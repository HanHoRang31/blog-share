resource "aws_security_group_rule" "tfer--sg-00be73ec863ca7943_egress_-1_-1_-1_0-002E-0-002E-0-002E-0-002F-0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  protocol          = "-1"
  security_group_id = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eks-cluster-sg-hanhorang-181800068_sg-00be73ec863ca7943_id}"
  to_port           = "0"
  type              = "egress"
}

resource "aws_security_group_rule" "tfer--sg-00be73ec863ca7943_ingress_-1_-1_-1_sg-00be73ec863ca7943" {
  from_port         = "0"
  protocol          = "-1"
  security_group_id = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eks-cluster-sg-hanhorang-181800068_sg-00be73ec863ca7943_id}"
  self              = "true"
  to_port           = "0"
  type              = "ingress"
}

resource "aws_security_group_rule" "tfer--sg-00be73ec863ca7943_ingress_-1_-1_-1_sg-0435a44214aa33d8a" {
  description              = "Allow unmanaged nodes to communicate with control plane (all ports)"
  from_port                = "0"
  protocol                 = "-1"
  security_group_id        = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eks-cluster-sg-hanhorang-181800068_sg-00be73ec863ca7943_id}"
  source_security_group_id = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-1L7JX9BZ5VDV8_sg-0435a44214aa33d8a_id}"
  to_port                  = "0"
  type                     = "ingress"
}
