resource "aws_nat_gateway" "tfer--nat-0c65bb87e9d201ac8" {
  allocation_id                      = "eipalloc-0b0e1c7f5bdc81f72"
  connectivity_type                  = "public"
  private_ip                         = "192.168.1.142"
  subnet_id                          = "subnet-015058ac61e07391c"

  tags = {
    Name = "hanhorang--NATGW"
  }

  tags_all = {
    Name = "hanhorang--NATGW"
  }
}
