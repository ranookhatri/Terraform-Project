
# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "web-instance" {
  ami           = "ami-074dc0a6f6c764218"
  instance_type = "t2.micro"
  # count                       = 1
  key_name                    = "Terraform"
  vpc_security_group_ids      = ["${aws_security_group.web-sg.id}"]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  user_data                   = file("data.sh")
  tags = {
    Name = "My Public Instance"
  }
}
# # Creating 2nd EC2 instance in Public Subnet
# resource "aws_instance" "app-instance-1" {
#   ami           = "ami-074dc0a6f6c764218"
#   instance_type = "t2.micro"
#   # count                       = 1
#   key_name               = "Terraform"
#   vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
#   subnet_id              = aws_subnet.application-subnet-1.id
#   # associate_public_ip_address = true
#   # user_data                   = "${file("data.sh")}"
#   tags = {
#     Name = "My Private Instance 1"
#   }
# }

# # Creating 3nd EC2 instance in Public Subnet
# resource "aws_instance" "app-instance-2" {
#   ami           = "ami-074dc0a6f6c764218"
#   instance_type = "t2.micro"
#   # count                       = 1
#   key_name               = "Terraform"
#   vpc_security_group_ids = ["${aws_security_group.web-sg.id}"]
#   subnet_id              = aws_subnet.application-subnet-2.id
#   # associate_public_ip_address = true
#   # user_data                   = "${file("data.sh")}"
#   tags = {
#     Name = "My Private Instance 2"
#   }
# }