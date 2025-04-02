variable "cluster_version" {
  description = "EKS cluster version."
  type        = string
  default     = "1.26"
}

variable "mng_cluster_version" {
  description = "EKS cluster mng version."
  type        = string
  default     = "1.26"
}


variable "ami_id" {
  description = "EKS AMI ID for node groups"
  type        = string
  default     = "ami-086414611b43bb691"
}

