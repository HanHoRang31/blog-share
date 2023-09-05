resource "aws_main_route_table_association" "tfer--vpc-0629b0e337fcbf3e0" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-06ffc72b457e4af85_id}"
  vpc_id         = "vpc-0629b0e337fcbf3e0"
}

resource "aws_main_route_table_association" "tfer--vpc-087e1e27e159bf626" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-06d81ac997dd576f6_id}"
  vpc_id         = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_main_route_table_association" "tfer--vpc-0ddc7d053bbe39cc8" {
  route_table_id = "${data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-05b0fe2cf19c8d369_id}"
  vpc_id         = "vpc-0ddc7d053bbe39cc8"
}
