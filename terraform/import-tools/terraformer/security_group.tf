resource "aws_security_group" "tfer--default_sg-002aa07faf2ef5b29" {
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
  vpc_id = "vpc-080c3cee56b75cd1d"
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

resource "aws_security_group" "tfer--eks-cluster-sg-hanhorang-181800068_sg-00c1fa1ab17f61307" {
  description = "EKS created security group applied to ENI that is attached to EKS Control Plane master nodes, as well as any managed workloads."

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    description     = "Allow unmanaged nodes to communicate with control plane (all ports)"
    from_port       = "0"
    protocol        = "-1"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-UMFIQK68E36_sg-043247c3005ce59f7_id}"]
    self            = "false"
    to_port         = "0"
  }

  ingress {
    description     = "elbv2.k8s.aws/targetGroupBinding=shared"
    from_port       = "80"
    protocol        = "tcp"
    security_groups = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--k8s-traffic-hanhorang-a0db105a63_sg-078d79781ff272286_id}"]
    self            = "false"
    to_port         = "80"
  }

  ingress {
    from_port = "0"
    protocol  = "-1"
    self      = "true"
    to_port   = "0"
  }

  name = "eks-cluster-sg-hanhorang-181800068"

  tags = {
    Name                              = "eks-cluster-sg-hanhorang-181800068"
    "kubernetes.io/cluster/hanhorang" = "owned"
  }

  tags_all = {
    Name                              = "eks-cluster-sg-hanhorang-181800068"
    "kubernetes.io/cluster/hanhorang" = "owned"
  }

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-UMFIQK68E36_sg-043247c3005ce59f7" {
  description = "Communication between all nodes in the cluster"
  name        = "eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-UMFIQK68E36"

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

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--eksctl-hanhorang-cluster-ControlPlaneSecurityGroup-14JOYAGOKWGVB_sg-0f31cdaa79a02d639" {
  description = "Communication between the control plane and worker nodegroups"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "eksctl-hanhorang-cluster-ControlPlaneSecurityGroup-14JOYAGOKWGVB"

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

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--eksctl-hanhorang-nodegroup-ng1-remoteAccess_sg-058bc9689e217c46d" {
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

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--k8s-default-resultin-85937225fd_sg-087109a3f626e2821" {
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

  name = "k8s-default-resultin-85937225fd"

  tags = {
    "elbv2.k8s.aws/cluster"    = "hanhorang"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "default/result-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "hanhorang"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "default/result-ingress"
  }

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--k8s-default-voteingr-7ae597072f_sg-0353b962c2c38b3aa" {
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

  name = "k8s-default-voteingr-7ae597072f"

  tags = {
    "elbv2.k8s.aws/cluster"    = "hanhorang"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "default/vote-ingress"
  }

  tags_all = {
    "elbv2.k8s.aws/cluster"    = "hanhorang"
    "ingress.k8s.aws/resource" = "ManagedLBSecurityGroup"
    "ingress.k8s.aws/stack"    = "default/vote-ingress"
  }

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--k8s-traffic-hanhorang-a0db105a63_sg-078d79781ff272286" {
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

  vpc_id = "vpc-080c3cee56b75cd1d"
}

resource "aws_security_group" "tfer--myeks-EKSEC2SG-1PFP5FDCTNSMN_sg-03bbb08a7654dbec3" {
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

  name = "myeks-EKSEC2SG-1PFP5FDCTNSMN"

  tags = {
    Name = "hanhorang-HOST-SG"
  }

  tags_all = {
    Name = "hanhorang-HOST-SG"
  }

  vpc_id = "vpc-080c3cee56b75cd1d"
}
