
# Creating VPC
resource "aws_vpc" "myVPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "myVPC"
  }
}

# Creating Internet Gateway attached with VPC
resource "aws_internet_gateway" "myVPCigw" {
  vpc_id = aws_vpc.myVPC.id

  tags = {
    Name = "myVPC-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "myVPC-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.myVPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "myVPC-private-subnet"
  }
}

resource "aws_route_table" "pubic_rt" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.myVPCigw.id
  }

  tags = {
    Name = "myVPC-public-subnet-rt"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.pubic_rt.id
}


resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.myVPC.id

  route {
    cidr_block = "10.0.2.0/24"
    gateway_id = aws_nat_gateway.myVPC_nat.id
  }

  tags = {
    Name = "myVPC-private-subnet-rt"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_nat_gateway" "myVPC_nat" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "myVPC-NAT-gw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.myVPCigw]
}

resource "aws_eip" "nat_ip" {
  vpc = true
   tags = {
    Name = "myVPC-NAT-eip"
  }
}

output "nat_gateway_ip" {
  value = aws_eip.nat_ip.public_ip
}

