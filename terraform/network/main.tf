resource "aws_vpc" "prod" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.prod.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "public_subnet"
  }
}

# Creating Internet Gateway 
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.prod.id
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.prod.id
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
tags = {
        Name = "Public Subnet Route Table"
    }
}
resource "aws_route_table_association" "rt_associate_public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.rt.id
}
