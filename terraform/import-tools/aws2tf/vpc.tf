resource "aws_vpc" "tfer--vpc-087e1e27e159bf626" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "192.168.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"

  tags = {
    Name = "hanhorang-VPC"
  }

  tags_all = {
    Name = "hanhorang-VPC"
  }
}
