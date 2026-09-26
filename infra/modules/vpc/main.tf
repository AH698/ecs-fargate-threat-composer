resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  tags = {
    Name = var.Name
  }
}

data "aws_availability_zones" "az" {
  state = "available"
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_rt
    gateway_id = aws_internet_gateway.igw.id
}
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_cidr)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_cidr[count.index]
  availability_zone = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = var.public_ip_on_launch
}

resource "aws_route_table_association" "example" {
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.route_table.id
}