# Terraform AWS Provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.34.0"
    }
  }
}

# AWS Region
provider "aws" {
  region = var.aws_region
}

