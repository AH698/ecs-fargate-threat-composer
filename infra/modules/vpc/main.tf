resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  tags = {
    Name = var.Name
  }
}

data "aws_availability_zones" "available" {
  state = var.state
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}