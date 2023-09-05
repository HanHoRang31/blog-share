resource "aws_eks_node_group" "tfer--ng2" {
  ami_type       = "AL2_x86_64"
  capacity_type  = "ON_DEMAND"
  cluster_name   = "${aws_eks_cluster.tfer--hanhorang2.name}"
  disk_size      = "0"
  instance_types = ["t3.medium"]

  labels = {
    "alpha.eksctl.io/cluster-name"   = "hanhorang2"
    "alpha.eksctl.io/nodegroup-name" = "ng1"
  }


  node_group_name = "ng1"
  node_role_arn   = "arn:aws:iam::955963799952:role/eksctl-hanhorang-nodegroup-ng1-NodeInstanceRole-FP4YFXDIKGN"

  scaling_config {
    desired_size = "2"
    max_size     = "2"
    min_size     = "2"
  }

  subnet_ids = ["subnet-027b8933268bcce7c", "subnet-05b9fe29d22a8620e", "subnet-07c49f56a5e863e8f"]

  tags = {
    "alpha.eksctl.io/cluster-name"                = "hanhorang2"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "alpha.eksctl.io/nodegroup-name"              = "ng1"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang2"
  }

  tags_all = {
    "alpha.eksctl.io/cluster-name"                = "hanhorang2"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "alpha.eksctl.io/nodegroup-name"              = "ng1"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang2"
  }

  update_config {
    max_unavailable = "1"
  }

  version = "1.25"
}
