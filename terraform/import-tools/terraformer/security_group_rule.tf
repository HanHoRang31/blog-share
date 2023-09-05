resource "aws_security_group_rule" "tfer--sg-043247c3005ce59f7_egress_-1_-1_-1_0-002E-0-002E-0-002E-0-002F-0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = "0"
  protocol          = "-1"
  security_group_id = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-UMFIQK68E36_sg-043247c3005ce59f7_id}"
  to_port           = "0"
  type              = "egress"
}

resource "aws_security_group_rule" "tfer--sg-043247c3005ce59f7_ingress_-1_-1_-1_sg-00c1fa1ab17f61307" {
  description              = "Allow managed and unmanaged nodes to communicate with each other (all ports)"
  from_port                = "0"
  protocol                 = "-1"
  security_group_id        = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-UMFIQK68E36_sg-043247c3005ce59f7_id}"
  source_security_group_id = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eks-cluster-sg-hanhorang-181800068_sg-00c1fa1ab17f61307_id}"
  to_port                  = "0"
  type                     = "ingress"
}

resource "aws_security_group_rule" "tfer--sg-043247c3005ce59f7_ingress_-1_-1_-1_sg-043247c3005ce59f7" {
  description       = "Allow nodes to communicate with each other (all ports)"
  from_port         = "0"
  protocol          = "-1"
  security_group_id = "${data.terraform_remote_state.local.outputs.aws_security_group_tfer--eksctl-hanhorang-cluster-ClusterSharedNodeSecurityGroup-UMFIQK68E36_sg-043247c3005ce59f7_id}"
  self              = "true"
  to_port           = "0"
  type              = "ingress"
}
