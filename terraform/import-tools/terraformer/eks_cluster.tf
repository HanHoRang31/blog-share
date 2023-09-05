resource "aws_eks_cluster" "tfer--hanhorang" {
  kubernetes_network_config {
    ip_family         = "ipv4"
    service_ipv4_cidr = "10.100.0.0/16"
  }

  name     = "hanhorang"
  role_arn = "arn:aws:iam::955963799952:role/eksctl-hanhorang-cluster-ServiceRole-1F2E3C8RNWHQL"

  tags = {
    Name                                          = "eksctl-hanhorang-cluster/ControlPlane"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  tags_all = {
    Name                                          = "eksctl-hanhorang-cluster/ControlPlane"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  version = "1.24"

  vpc_config {
    endpoint_private_access = "false"
    endpoint_public_access  = "true"
    public_access_cidrs     = ["0.0.0.0/0"]
    security_group_ids      = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eksctl-hanhorang-cluster-ControlPlaneSecurityGroup-14JOYAGOKWGVB_sg-0f31cdaa79a02d639_id}"]
    subnet_ids              = ["${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-027b8933268bcce7c_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-05b9fe29d22a8620e_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-07c49f56a5e863e8f_id}"]
  }
}
