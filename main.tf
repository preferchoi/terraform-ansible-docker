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
  tags = {Name="terra-igw"}
}

