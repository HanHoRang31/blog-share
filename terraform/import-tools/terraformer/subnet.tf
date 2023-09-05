resource "aws_subnet" "tfer--subnet-027b8933268bcce7c" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.1.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                     = "hanhorang-PublicSubnet1"
    "kubernetes.io/role/elb" = "1"
  }

  tags_all = {
    Name                     = "hanhorang-PublicSubnet1"
    "kubernetes.io/role/elb" = "1"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_subnet" "tfer--subnet-032da54c0e72c6aa9" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.11.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                              = "hanhorang-PrivateSubnet1"
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags_all = {
    Name                              = "hanhorang-PrivateSubnet1"
    "kubernetes.io/role/internal-elb" = "1"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_subnet" "tfer--subnet-04613329990c6cf9e" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.12.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                              = "hanhorang-PrivateSubnet2"
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags_all = {
    Name                              = "hanhorang-PrivateSubnet2"
    "kubernetes.io/role/internal-elb" = "1"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_subnet" "tfer--subnet-046bf7c07e7695a77" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.13.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                              = "hanhorang-PrivateSubnet3"
    "kubernetes.io/role/internal-elb" = "1"
  }

  tags_all = {
    Name                              = "hanhorang-PrivateSubnet3"
    "kubernetes.io/role/internal-elb" = "1"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_subnet" "tfer--subnet-05b9fe29d22a8620e" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.2.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                     = "hanhorang-PublicSubnet2"
    "kubernetes.io/role/elb" = "1"
  }

  tags_all = {
    Name                     = "hanhorang-PublicSubnet2"
    "kubernetes.io/role/elb" = "1"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}

resource "aws_subnet" "tfer--subnet-07c49f56a5e863e8f" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "192.168.3.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name                     = "hanhorang-PublicSubnet3"
    "kubernetes.io/role/elb" = "1"
  }

  tags_all = {
    Name                     = "hanhorang-PublicSubnet3"
    "kubernetes.io/role/elb" = "1"
  }

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-080c3cee56b75cd1d_id}"
}
