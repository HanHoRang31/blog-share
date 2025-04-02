provider "aws" {
  region = local.region
}

# Required for public ECR where Karpenter artifacts are hosted
provider "aws" {
  region = "us-east-1"
  alias  = "virginia"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    # This requires the awscli to be installed locally where Terraform is executed
    args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
  }
}

provider "helm" {
  kubernetes {
    host                   = module.eks.cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)

    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      command     = "aws"
      # This requires the awscli to be installed locally where Terraform is executed
      args = ["eks", "get-token", "--cluster-name", module.eks.cluster_name]
    }
  }
}

data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}

data "aws_ecrpublic_authorization_token" "token" {
  provider = aws.virginia
}

data "aws_availability_zones" "available" {}

# tflint-ignore: terraform_unused_declarations
variable "eks_cluster_id" {
  description = "EKS cluster name"
  type        = string
}
variable "aws_region" {
  description = "AWS Region"
  type        = string
}

locals {
  name   = var.eks_cluster_id
  region = var.aws_region

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = local.name
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }
}

################################################################################
# Cluster
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.14"

  cluster_name                   = local.name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Fargate profiles use the cluster primary security group so these are not utilized
  # create_cluster_security_group = false
  # create_node_security_group    = false

  enable_cluster_creator_admin_permissions = true

  fargate_profiles = {
    fp-profile = {
      selectors = [
        { namespace = "assets" }
      ]
    }
  }

  eks_managed_node_group_defaults = {
    cluster_version = var.mng_cluster_version
  }

  eks_managed_node_groups = {
    initial = {
      instance_types = ["m5.large", "m6a.large", "m6i.large"]
      min_size     = 2
      max_size     = 10
      desired_size = 2
      update_config = {
        max_unavailable_percentage = 35
      }
    }

  custom = {
      instance_types = ["t3.medium"]
      min_size     = 1
      max_size     = 2
      desired_size = 1
      update_config = {
        max_unavailable_percentage = 35
      }
      ami_id = try(var.ami_id) # 추가
      enable_bootstrap_user_data = true 
    }
    
    blue-mng={
      instance_types = ["m5.large", "m6a.large", "m6i.large"]
      cluster_version = "1.25"
      min_size     = 1
      max_size     = 2
      desired_size = 1
      update_config = {
        max_unavailable_percentage = 35
      }
      labels = {
        type = "OrdersMNG"
      }
      subnet_ids = [module.vpc.private_subnets[0]]
      taints = [
        {
          key    = "dedicated"
          value  = "OrdersApp"
          effect = "NO_SCHEDULE"
        }
      ]
    }
    green-mng={
      instance_types = ["m5.large", "m6a.large", "m6i.large"]
      subnet_ids = [module.vpc.private_subnets[0]]
      min_size     = 1
      max_size     = 2
      desired_size = 1
      update_config = {
        max_unavailable_percentage = 35
      }
      labels = {
        type = "OrdersMNG"
      }
      taints = [
        {
          key    = "dedicated"
          value  = "OrdersApp"
          effect = "NO_SCHEDULE"
        }
      ]
    }
  }

  # For demonstrating node-termination-handler
  self_managed_node_groups = {
    default-selfmng = {
      instance_type = "m5.large"
      
      min_size     = 1
      max_size     = 2
      desired_size = 2

      # Additional configurations
      ami_id           = "ami-0ee947a6f4880da75" # Replace with your desired AMI ID
      subnet_ids       = module.vpc.private_subnets
      disk_size        = 100

      # Optional
      bootstrap_extra_args = "--kubelet-extra-args '--node-labels=node.kubernetes.io/lifecycle=self-managed,team=carts'"
      
      # Required for self-managed node groups
      create_launch_template = true
      launch_template_use_name_prefix = true
    }
  }

  tags = merge(local.tags, {
    # NOTE - if creating multiple security groups with this module, only tag the
    # security group that Karpenter should utilize with the following tag
    # (i.e. - at most, only one security group should have this tag in your account)
    "karpenter.sh/discovery" = local.name
  })
}

resource "time_sleep" "wait_60_seconds" {
  create_duration = "60s"

  depends_on = [module.eks]
}
