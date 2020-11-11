###############################################################################
# Creating VPC
###############################################################################
resource "aws_vpc" "defaultvpc" {
 cidr_block       = "172.17.0.0/16"
  instance_tenancy = "default"
  enable_dns_support =  true
  enable_dns_hostnames = true

  tags = {
    Name = "defaultvpc"
  }
}
