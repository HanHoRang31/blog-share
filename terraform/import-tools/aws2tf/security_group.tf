resource "aws_security_group" "tfer--default_sg-0087b07c3abd70994" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-0629b0e337fcbf3e0"
}

resource "aws_security_group" "tfer--default_sg-0cba95ff0005736b2" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-087e1e27e159bf626"
}

resource "aws_security_group" "tfer--default_sg-0f4d9420977e9169d" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name   = "default"
  vpc_id = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_security_group" "tfer--eks-cluster-sg-hanhorang-181800068_sg-00be73ec863ca7943" {
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."
  name        = "eks-cluster-sg-hanhorang-181800068"

  tags = {
    Name                              = "eks-cluster-sg-hanhorang-181800068"
    "kubernetes.io/cluster/hanhorang" = "owned"
  }

  tags_all = {
    Name                              = "eks-cluster-sg-hanhorang-181800068"
    "kubernetes.io/cluster/hanhorang" = "owned"
  }

  vpc_id = "vpc-087e1e27e159bf626"
}

resource "aws_security_group" "tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-1L7JX9BZ5VDV8_sg-0435a44214aa33d8a" {
  description = "Communication between all nodes in the cluster"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Allow managed and unmanaged nodes to communicate with each other (all ports)"
    from_port       = "0"
    protocol        = "-1"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eks-cluster-sg-hanhorang-181800068_sg-00be73ec863ca7943_id}"]
    self            = "false"
    to_port         = "0"
  }

  ingress {
    description = "Allow nodes to communicate with each other (all ports)"
    from_port   = "0"
    protocol    = "-1"
    self        = "true"
    to_port     = "0"
  }

  name = "eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-1L7JX9BZ5VDV8"

  tags = {
    Name                                          = "eksctl-hanhorang-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  tags_all = {
    Name                                          = "eksctl-hanhorang-cluster/ClusterSharedNodeSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  vpc_id = "vpc-087e1e27e159bf626"
}

resource "aws_security_group" "tfer--eksctl-hanhorang-cluster-ControlPlaneSecurityGroup-186VO6YUM9A43_sg-0270c4da847aa9121" {
  description = "Communication between the control plane and worker nodegroups"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "eksctl-hanhorang-cluster-ControlPlaneSecurityGroup-186VO6YUM9A43"

  tags = {
    Name                                          = "eksctl-hanhorang-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  tags_all = {
    Name                                          = "eksctl-hanhorang-cluster/ControlPlaneSecurityGroup"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/cluster-oidc-enabled"        = "true"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  vpc_id = "vpc-087e1e27e159bf626"
}

resource "aws_security_group" "tfer--eksctl-hanhorang-nodegroup-ng1-remoteAccess_sg-004e9c65de933bd8c" {
  description = "Allow SSH access"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH access to managed worker nodes in group ng1"
    from_port        = "22"
    ipv6_cidr_blocks = ["::/0"]
    protocol         = "tcp"
    self             = "false"
    to_port          = "22"
  }

  name = "eksctl-hanhorang-nodegroup-ng1-remoteAccess"

  tags = {
    Name                                          = "eksctl-hanhorang-nodegroup-ng1/SSH"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "alpha.eksctl.io/nodegroup-name"              = "ng1"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  tags_all = {
    Name                                          = "eksctl-hanhorang-nodegroup-ng1/SSH"
    "alpha.eksctl.io/cluster-name"                = "hanhorang"
    "alpha.eksctl.io/eksctl-version"              = "0.154.0"
    "alpha.eksctl.io/nodegroup-name"              = "ng1"
    "alpha.eksctl.io/nodegroup-type"              = "managed"
    "eksctl.cluster.k8s.io/v1alpha1/cluster-name" = "hanhorang"
  }

  vpc_id = "vpc-087e1e27e159bf626"
}

resource "aws_security_group" "tfer--k8s-default-ingressl-7d2fe7964c_sg-025bca9dc63de9cf9" {
  description = "[k8s] Managed SecurityGroup for LoadBalancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "80"
    protocol    = "tcp"
    self        = "false"
    to_port     = "80"
  }

  name = "k8s-default-ingressl-7d2fe7964c"

  tags = {
    "elbv2.k8s.aws/cluster"    = "hanhorang"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "default/ingress-locust-dashboard"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "hanhorang"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "default/ingress-locust-dashboard"
  }

  vpc_id = "vpc-0629b0e337fcbf3e0"
}

resource "aws_security_group" "tfer--k8s-traffic-hanhorang-a0db105a63_sg-06d4972d6a1375e17" {
  description = "[k8s] Shared Backend SecurityGroup for LoadBalancer"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "k8s-traffic-hanhorang-a0db105a63"

  tags = {
    "elbv2.k8s.aws/cluster"  = "hanhorang"
    "elbv2.k8s.aws/resource" = "backend-sg"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"  = "hanhorang"
    "elbv2.k8s.aws/resource" = "backend-sg"
  }

  vpc_id = "vpc-0629b0e337fcbf3e0"
}

resource "aws_security_group" "tfer--launch-wizard-1_sg-033472e209f567329" {
  description = "launch-wizard-1 created 2023-05-06T07:53:58.053Z"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "22"
    protocol    = "tcp"
    self        = "false"
    to_port     = "22"
  }

  name   = "launch-wizard-1"
  vpc_id = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_security_group" "tfer--myeks-EKSEC2SG-AKY7N7FENWY6_sg-00b61c0fb85ed3a67" {
  description = "eksctl-host Security Group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "myeks-EKSEC2SG-AKY7N7FENWY6"

  tags = {
    Name = "hanhorang-HOST-SG"
  }

  tags_all = {
    Name = "hanhorang-HOST-SG"
  }

  vpc_id = "vpc-087e1e27e159bf626"
}
