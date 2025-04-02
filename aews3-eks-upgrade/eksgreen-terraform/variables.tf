variable "cluster_version" {
  description = "EKS cluster version."
  type        = string
  default     = "1.30"
}

variable "mng_cluster_version" {
  description = "EKS cluster mng version."
  type        = string
  default     = "1.30"
}

variable "ami_id" {
  description = "EKS AMI ID for node groups"
  type        = string
  default     = ""
}

variable "efs_id" {
  description = "The ID of the already provisioned EFS Filesystem"
  type        = string
}
