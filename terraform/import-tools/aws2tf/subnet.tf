resource "aws_subnet" "tfer--subnet-015058ac61e07391c" {
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

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_subnet" "tfer--subnet-03a1600bfef722f68" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_subnet" "tfer--subnet-0590fd1917b053a6a" {
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

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_subnet" "tfer--subnet-09a74582a6fba35d9" {
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

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_subnet" "tfer--subnet-0bfc6e64f2e70513f" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_subnet" "tfer--subnet-0eb54f96064d4e96c" {
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

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_subnet" "tfer--subnet-0efbe3dc52379367b" {
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

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_subnet" "tfer--subnet-0f35d2a3065f588f4" {
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

  vpc_id = "${data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-087e1e27e159bf626_id}"
}

resource "aws_subnet" "tfer--subnet-0f9f38418feda2a50" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0ddc7d053bbe39cc8"
}

resource "aws_subnet" "tfer--subnet-0facb7c5440660aaa" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.48.0/20"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "vpc-0ddc7d053bbe39cc8"
}
