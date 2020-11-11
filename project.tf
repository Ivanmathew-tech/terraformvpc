
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



###############################################################################
# Creating Ineternet gateway
###############################################################################

resource "aws_internet_gateway" "defaultvpc" {
    
  vpc_id = aws_vpc.defaultvpc.id

  tags = {
    Name = "defaultvpc"
  }
}

###################################
#creating public subnet
####################################

resource "aws_subnet" "public1" {

  vpc_id     = aws_vpc.defaultvpc.id
  cidr_block = "172.17.0.0/18"
  map_public_ip_on_launch = true
  tags = {
    Name = "defaultvpc-public1"
  }
}


resource "aws_subnet" "public2" {

  vpc_id     = aws_vpc.defaultvpc.id
  cidr_block = "172.17.64.0/18"
  map_public_ip_on_launch = true
  tags = {
    Name = "defaultvpc-public2"
  }
}


resource "aws_subnet" "priavte" {

  vpc_id     = aws_vpc.defaultvpc.id
  cidr_block = "172.17.128.0/18"
  map_public_ip_on_launch = false
  tags = {
    Name = "defaultvpc-private"
  }
}

