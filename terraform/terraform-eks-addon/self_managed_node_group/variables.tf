variable "name" {
  description = "Prefix for the name"
  default     = "t1013-eks"
}

variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.27`)"
  type        = string
  default     = "1.27"
}


variable "aws_auth_users_arn" {
  description = "List of AWS IAM ARNs"
  type        = string
  default     = ""
}

variable "aws_auth_users_username" {
  description = "List of Kubernetes usernames corresponding to ARNs"
  type        = string
  default     = ""
}

variable "region" {
  description = "AWS Region"
  default     = "ap-northeast-2"
}


variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "availability_zones_count" {
  description = "Number of availability zones to use"
  default     = 3
}



variable "tags" {
  description = "Map of tags to apply to resources"
  default = {
    GithubRepo = "t1013-eks"
    GithubOrg  = ""
  }
}
