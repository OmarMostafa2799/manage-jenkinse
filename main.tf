provider "aws" {
  region = "eu-east-1"
}

# VPC resource
resource "aws_vpc" "VPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "omar-vpc"
        }
}







