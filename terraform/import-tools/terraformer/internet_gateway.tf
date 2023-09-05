resource "aws_internet_gateway" "tfer--igw-06f8eb61ed849f38f" {
  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}
