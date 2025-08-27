# vpc 선언
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "terra-vpc"
  }
}

# 게이트웨이 선언
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "terra-igw"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.service_zone}a"
  map_public_ip_on_launch = true
  tags = {
    Name = "terra-public-subnet-a"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "${var.service_zone}c"
  map_public_ip_on_launch = true
  tags = {
    Name = "terra-public-subnet-c"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = { Name = "terra-public-rt" }
}

resource "aws_route_table_association" "public_a" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_a.id
}

resource "aws_route_table_association" "public_c" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_c.id
}



