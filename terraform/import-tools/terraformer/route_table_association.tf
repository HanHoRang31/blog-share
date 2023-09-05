resource "aws_route_table_association" "tfer--subnet-027b8933268bcce7c" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-04355f2bcb936103b_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-027b8933268bcce7c_id}"
}

resource "aws_route_table_association" "tfer--subnet-032da54c0e72c6aa9" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-047401e3a0d8636e1_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-032da54c0e72c6aa9_id}"
}

resource "aws_route_table_association" "tfer--subnet-04613329990c6cf9e" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-047401e3a0d8636e1_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-04613329990c6cf9e_id}"
}

resource "aws_route_table_association" "tfer--subnet-046bf7c07e7695a77" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-047401e3a0d8636e1_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-046bf7c07e7695a77_id}"
}

resource "aws_route_table_association" "tfer--subnet-05b9fe29d22a8620e" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-04355f2bcb936103b_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-05b9fe29d22a8620e_id}"
}

resource "aws_route_table_association" "tfer--subnet-07c49f56a5e863e8f" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-04355f2bcb936103b_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-07c49f56a5e863e8f_id}"
}
