resource "aws_internet_gateway" "tfer--igw-01ca08858c082a0ae" {
  vpc_id = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_internet_gateway" "tfer--igw-09086a3b813114b76" {
  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}
