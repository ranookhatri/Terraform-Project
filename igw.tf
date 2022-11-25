# Creating Internet Gateway 
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.demovpc.id
  tags = {
    Name = "Internet-Gateway"
  }
}