resource "aws_route_table_association" "tfer--subnet-015058ac61e07391c" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-001aae3ae61e84cad_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-015058ac61e07391c_id}"
}

resource "aws_route_table_association" "tfer--subnet-0590fd1917b053a6a" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-001aae3ae61e84cad_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0590fd1917b053a6a_id}"
}

resource "aws_route_table_association" "tfer--subnet-09a74582a6fba35d9" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-033afec717dd89e2f_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-09a74582a6fba35d9_id}"
}

resource "aws_route_table_association" "tfer--subnet-0eb54f96064d4e96c" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-001aae3ae61e84cad_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0eb54f96064d4e96c_id}"
}

resource "aws_route_table_association" "tfer--subnet-0efbe3dc52379367b" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-033afec717dd89e2f_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0efbe3dc52379367b_id}"
}

resource "aws_route_table_association" "tfer--subnet-0f35d2a3065f588f4" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-033afec717dd89e2f_id}"
  subnet_id      = "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0f35d2a3065f588f4_id}"
}
