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

# Data source to reference the existing VPC
data "aws_vpc" "existing_vpc" {
  filter {
    name   = "tag:Name"
    values = [local.name]
  }
}

data "aws_subnets" "existing_private_subnets" {
  filter {
    name   = "vpc-id"
    values = [ data.aws_vpc.existing_vpc.id ]
  }

  filter {
    name   = "tag:karpenter.sh/discovery"
    values = [local.name]
  }
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

  #vpc_cidr = "10.0.0.0/16"
  #azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Blueprint  = "${local.name}-gr"
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }
}

################################################################################
# Cluster
################################################################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.14"

  cluster_name                   = "${local.name}-gr"
  cluster_version                = "1.30"
  cluster_endpoint_public_access = true

  vpc_id     = data.aws_vpc.existing_vpc.id
  subnet_ids = data.aws_subnets.existing_private_subnets.ids

  enable_cluster_creator_admin_permissions = true

  eks_managed_node_group_defaults = {
    cluster_version = var.mng_cluster_version
  }

  eks_managed_node_groups = {
    initial = {
      instance_types = ["m5.large", "m6a.large", "m6i.large"]
      min_size     = 2
      max_size     = 10
      desired_size = 2
    }
  }


  # For demonstrating node-termination-handler
  self_managed_node_groups = {
    default-selfmng = {
      instance_type = "m5.large"
      
      min_size     = 2
      max_size     = 4
      desired_size = 2

      # Additional configurations
      subnet_ids       = data.aws_subnets.existing_private_subnets.ids
      disk_size        = 100

      # Optional
      bootstrap_extra_args = "--kubelet-extra-args '--node-labels=node.kubernetes.io/lifecycle=self-managed,team=carts,type=OrdersMNG'"
      
      # Required for self-managed node groups
      create_launch_template = true
      launch_template_use_name_prefix = true
    }
  }
  
  tags = merge(local.tags, {
    # NOTE - if creating multiple security groups with this module, only tag the
    # security group that Karpenter should utilize with the following tag
    # (i.e. - at most, only one security group should have this tag in your account)
    "karpenter.sh/discovery" = "${local.name}-gr"
  })
}

resource "time_sleep" "wait_60_seconds" {
  create_duration = "60s"

  depends_on = [module.eks]
}
