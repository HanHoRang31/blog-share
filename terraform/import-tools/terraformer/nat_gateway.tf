resource "aws_nat_gateway" "tfer--nat-09425987ca4eebeb4" {
  allocation_id                      = "eipalloc-039c7f20c075b5d3a"
  connectivity_type                  = "public"
  private_ip                         = "192.168.1.11"
  subnet_id                          = "subnet-027b8933268bcce7c"

  tags = {
    Name = "hanhorang--NATGW"
  }

  tags_all = {
    Name = "hanhorang--NATGW"
  }
}
