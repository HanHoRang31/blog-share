resource "aws_route_table" "tfer--rtb-022ec0dbed0cefa67" {
  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_route_table" "tfer--rtb-04355f2bcb936103b" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-06f8eb61ed849f38f"
  }

  tags = {
    Name = "hanhorang-PublicSubnetRouteTable"
  }

  tags_all = {
    Name = "hanhorang-PublicSubnetRouteTable"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_route_table" "tfer--rtb-047401e3a0d8636e1" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-09425987ca4eebeb4"
  }

  tags = {
    Name = "hanhorang-PrivateSubnetRouteTable"
  }

  tags_all = {
    Name = "hanhorang-PrivateSubnetRouteTable"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_route_table" "tfer--rtb-05b0fe2cf19c8d369" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-01ca08858c082a0ae"
  }

  vpc_id = "vpc-0ddc7d053bbe39cc8"
}
