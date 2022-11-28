# Defining CIDR Block for VPC
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
# Defining CIDR Block for 1st Subnet
variable "subnet_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for 2nd Subnet
variable "subnet1_cidr" {
  default = "10.0.2.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet2_cidr" {
  default = "10.0.3.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet3_cidr" {
  default = "10.0.4.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet4_cidr" {
  default = "10.0.5.0/24"
}
# Defining CIDR Block for 3rd Subnet
variable "subnet5_cidr" {
  default = "10.0.6.0/24"
}

variable "aws_region" {
  default = "ap-south-1"
}

variable "ami_ids" {
  type = map(string)
  default = {
    "ubuntu"   = "ami-062df10d14676e201"
    "amzlinux" = "ami-074dc0a6f6c764218"
    "redhat"   = "ami-069d9fecd19e7ed40"
  }

}