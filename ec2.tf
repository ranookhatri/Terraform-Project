
# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "web-instance" {
  ami           = var.ami_ids["redhat"]
  instance_type = "t2.micro"
  # count                       = 1
  key_name                    = "Terraform"
  vpc_security_group_ids      = ["${aws_security_group.web-sg.id}"]
  subnet_id                   = aws_subnet.public-subnet-1.id
  associate_public_ip_address = true
  # user_data                   = file("../../docs-setup/jenkins-setup.sh")

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/rkhatri/Desktop/Terraform/Terraform.pem")
    host        = self.public_ip
  }

  provisioner "file" {
    source = "../../docs-setup/jenkins-setup.sh"
    # source = file("../../docs-setup/jenkins-setup.sh")
    destination = "/tmp/jenkins-setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      # "sudo su",
      "sudo chown -R root:root /tmp/jenkins-setup.sh",
      "sudo mv /tmp/jenkins-setup.sh /opt/jenkins-setup.sh",
      "sudo chmod +x /opt/jenkins-setup.sh",
      "sudo sh /opt/jenkins-setup.sh"
    ]
    on_failure = continue
  }

  tags = {
    Name = "Public-Instance"
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