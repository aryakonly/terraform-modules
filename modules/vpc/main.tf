resource "aws_vpc" "my-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "pub-sub" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = var.subnet_cidr
  availability_zone = var.available_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.sub-name
  }
}

resource "aws_internet_gateway" "my-igw" {
  vpc_id = aws_vpc.my-vpc.id
  tags = {
    Name = var.igw
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_internet_gateway.my-igw.id
  }

  tags = {
    Name = var.rt_table_name
  }
}

resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.my-sub.id
  route_table_id = aws_route_table.rt.id
}
