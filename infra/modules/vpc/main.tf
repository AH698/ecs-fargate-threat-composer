resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = var.vpc_name
  }
}

data "aws_availability_zones" "az" {
  state = "available"
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# public
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_rt
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_cidr[count.index]
  availability_zone       = data.aws_availability_zones.az.names[count.index]
  map_public_ip_on_launch = var.public_ip_on_launch
}

resource "aws_route_table_association" "rt_association" {
  count          = length(var.public_cidr)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.route_table.id
}

# private 
resource "aws_subnet" "private_subnets" {
  count                   = length(var.private_cidr)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_cidr[count.index]
  availability_zone       = data.aws_availability_zones.az.names[count.index]
}

resource "aws_eip" "eip" {
  domain   = "vpc"
}

resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnets[0].id

  tags = {
    Name = var.ngw_name
  }

  depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.cidr_block_rt
     nat_gateway_id = aws_nat_gateway.ngw.id
  }
}

resource "aws_route_table_association" "priv_rt_association" {
  count          = length(var.private_cidr)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.priv_route_table.id
}
