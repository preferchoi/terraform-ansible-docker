# vpc 선언
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "terra-vpc" }
}

# 게이트웨이 선언
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "terra-igw" }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.service_zone}a"
  map_public_ip_on_launch = true
  tags                    = { Name = "terra-public-subnet-a" }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "${var.service_zone}c"
  map_public_ip_on_launch = true
  tags                    = { Name = "terra-public-subnet-c" }
}