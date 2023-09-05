resource "aws_route_table" "tfer--rtb-001aae3ae61e84cad" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-09086a3b813114b76"
  }

  tags = {
    Name = "hanhorang-PublicSubnetRouteTable"
  }

  tags_all = {
    Name = "hanhorang-PublicSubnetRouteTable"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_route_table" "tfer--rtb-033afec717dd89e2f" {
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "nat-0c65bb87e9d201ac8"
  }

  tags = {
    Name = "hanhorang-PrivateSubnetRouteTable"
  }

  tags_all = {
    Name = "hanhorang-PrivateSubnetRouteTable"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_route_table" "tfer--rtb-05b0fe2cf19c8d369" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-01ca08858c082a0ae"
  }

  vpc_id = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_route_table" "tfer--rtb-06d81ac997dd576f6" {
  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_route_table" "tfer--rtb-06ffc72b457e4af85" {
  vpc_id = "vpc-0629b0e337fcbf3e0"
}
