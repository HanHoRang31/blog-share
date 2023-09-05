resource "aws_main_route_table_association" "tfer--vpc-080c3cee56b75cd1d" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-022ec0dbed0cefa67_id}"
  vpc_id         = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-0ddc7d053bbe39cc8" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-05b0fe2cf19c8d369_id}"
  vpc_id         = "vpc-0ddc7d053bbe39cc8"
}
