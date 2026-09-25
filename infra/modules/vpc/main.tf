resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  tags = {
    Name = var.Name
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}