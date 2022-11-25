# Creating Public Route Table
resource "aws_route_table" "public-RT" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }
  tags = {
    Name = "Public-RT"
  }
}

# Creating Private Route Table
resource "aws_route_table" "private-RT" {
  vpc_id = aws_vpc.demovpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.n-gw.id
  }
  tags = {
    Name = "Private-RT"
  }
}

# Associating Route Table - Public
resource "aws_route_table_association" "public-rt-association-1" {
  # gateway_id = "${aws_internet_gateway.internet-gateway.id}"
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-RT.id
}
# Associating Route Table - Public
resource "aws_route_table_association" "public-rt-association-2" {
  # gateway_id = "${aws_internet_gateway.internet-gateway.id}"
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-RT.id
}

# Associating Route Table - Private
resource "aws_route_table_association" "private-rt-association-1" {
  # subnet_id = aws_subnet.application-subnet-1.id
  subnet_id      = aws_subnet.application-subnet-1.id
  route_table_id = aws_route_table.private-RT.id
}
# Associating Route Table - Private
resource "aws_route_table_association" "private-rt-association-2" {
  # subnet_id = aws_subnet.application-subnet-1.id
  subnet_id      = aws_subnet.application-subnet-2.id
  route_table_id = aws_route_table.private-RT.id
}

# Associating Route Table - Private-DB
resource "aws_route_table_association" "private-db-rt-association-1" {
  # subnet_id = aws_subnet.application-subnet-1.id
  subnet_id      = aws_subnet.database-subnet-1.id
  route_table_id = aws_route_table.private-RT.id
}
# Associating Route Table - Private-DB
resource "aws_route_table_association" "private-db-rt-association-2" {
  # subnet_id = aws_subnet.application-subnet-1.id
  subnet_id      = aws_subnet.database-subnet-2.id
  route_table_id = aws_route_table.private-RT.id
}