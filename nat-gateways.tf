# # Create NAT Gateway
# resource "aws_nat_gateway" "n-gw" {
#   allocation_id = aws_eip.eip.id

#   subnet_id = aws_subnet.public-subnet-1.id

#   tags = {
#     Name = "NAT-Gateway"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.internet-gateway]
# }