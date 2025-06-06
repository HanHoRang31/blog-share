################################################################################
# EKS Blueprints Addons
################################################################################

module "eks_blueprints_addons" {
  depends_on = [ time_sleep.wait_60_seconds ]
  source  = "aws-ia/eks-blueprints-addons/aws"
  version = "~> 1.16"

  cluster_name      = module.eks.cluster_name
  cluster_endpoint  = module.eks.cluster_endpoint
  cluster_version   = module.eks.cluster_version
  oidc_provider_arn = module.eks.oidc_provider_arn

  # We want to wait for the Fargate profiles to be deployed first
  create_delay_dependencies = [for prof in module.eks.fargate_profiles : prof.fargate_profile_arn]

  eks_addons = {
    coredns = {
      addon_version = "v1.11.3-eksbuild.1"
    }
    vpc-cni    = {
      most_recent = true
    }
    kube-proxy = {
      addon_version = "v1.30.3-eksbuild.2"
    }
    aws-ebs-csi-driver = {
      service_account_role_arn = module.ebs_csi_driver_irsa.iam_role_arn
    }
  }

  enable_karpenter = true
  enable_aws_efs_csi_driver = true
  enable_argocd = true
  enable_aws_load_balancer_controller = true
  enable_metrics_server = true

  argocd = {
    set = [
      {
        name = "server.service.type"
        value = "LoadBalancer"
      }
    ]
    wait = true
  }


  aws_load_balancer_controller = {
    set = [
      {
        name  = "vpcId"
        value = data.aws_vpc.existing_vpc.id
      },
      {
        name  = "region"
        value = local.region
      },
      {
        name  = "podDisruptionBudget.maxUnavailable"
        value = 1
      },
      {
        name  = "enableServiceMutatorWebhook"
        value = "false"
      }
    ]
    wait = true
  }

  karpenter_node = {
    # Use static name so that it matches what is defined in `karpenter.yaml` example manifest
    iam_role_use_name_prefix = false
  }

  tags = local.tags
}

resource "time_sleep" "wait_90_seconds" {
  create_duration = "90s"

  depends_on = [module.eks_blueprints_addons]
}

resource "aws_eks_access_entry" "karpenter_node_access_entry" {
  cluster_name      = module.eks.cluster_name
  principal_arn     = module.eks_blueprints_addons.karpenter.node_iam_role_arn
  # kubernetes_groups = []
  type              = "EC2_LINUX"

  lifecycle {
    ignore_changes = [
      user_name
    ]
  }
}

################################################################################
# Supporting Resources
################################################################################
module "ebs_csi_driver_irsa" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"
  version = "~> 5.20"

  role_name_prefix = "${module.eks.cluster_name}-ebs-csi-driver-"

  attach_ebs_csi_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["kube-system:ebs-csi-controller-sa"]
    }
  }

  tags = local.tags
}

################################################################################
# Storage Classes
################################################################################

resource "kubernetes_annotations" "gp2" {
  api_version = "storage.k8s.io/v1"
  kind        = "StorageClass"
  # This is true because the resources was already created by the ebs-csi-driver addon
  force = "true"

  metadata {
    name = "gp2"
  }

  annotations = {
    # Modify annotations to remove gp2 as default storage class still retain the class
    "storageclass.kubernetes.io/is-default-class" = "false"
  }

  depends_on = [
    module.eks_blueprints_addons
  ]
}

resource "kubernetes_storage_class_v1" "gp3" {
  metadata {
    name = "gp3"

    annotations = {
      # Annotation to set gp3 as default storage class
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }

  storage_provisioner    = "ebs.csi.aws.com"
  allow_volume_expansion = true
  reclaim_policy         = "Delete"
  volume_binding_mode    = "WaitForFirstConsumer"

  parameters = {
    encrypted = true
    fsType    = "ext4"
    type      = "gp3"
  }

  depends_on = [
    module.eks_blueprints_addons
  ]
}

# done: update parameters
resource "kubernetes_storage_class_v1" "efs" {
  metadata {
    name = "efs"
  }

  storage_provisioner = "efs.csi.aws.com"
  reclaim_policy      = "Delete"
  parameters = {
    provisioningMode = "efs-ap"
    fileSystemId     = var.efs_id
    directoryPerms   = "755"
    gidRangeStart    = "1000" # optional
    gidRangeEnd      = "2000" # optional
    basePath         = "/dynamic_provisioning" # optional
    subPathPattern   = "$${.PVC.namespace}/$${.PVC.name}" # optional
    ensureUniqueDirectory = "false"    # optional
    reuseAccessPoint = "false"         # optional
  }

  mount_options = [
    "iam"
  ]

  depends_on = [
    module.eks_blueprints_addons
  ]
}
