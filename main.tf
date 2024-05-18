provider "aws" {
  region = "eu-eust-1"
}

# VPC resource
resource "aws_vpc" "VPC" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "h-vpc"
        }
}

# Internet Gateway resource
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC.id
  tags = {
        Name = "h-igw"
        }
}

# Route Table resource
resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.VPC.id

  # Route for IPv4 traffic
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
        Name = "h-route-table"
  }
}

# Subnet resource
resource "aws_subnet" "puplic_subnet" {
      vpc_id = aws_vpc.VPC.id
      cidr_block = "10.0.0.0/24"
      availability_zone = "eu-west-1a"

      tags = {
        Name = "h-pulic-subnet"
      }
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.puplic_subnet.id
  route_table_id = aws_route_table.route_table.id
}

# Security Group resource
resource "aws_security_group" "sec_group" {
  vpc_id = aws_vpc.VPC.id

  name = "h-security-group"
  description = "This is a sec group to allow all traffic"

  # Ingress rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
        Name = "h-security-group-n"
  }
}


# EC2 Instance resource
resource "aws_instance" "instance" {
  ami           = "ami-0776c814353b4814d"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.puplic_subnet.id
  associate_public_ip_address = true
  security_groups = [ aws_security_group.sec_group.id ]
  key_name      = aws_key_pair.key_pair.key_name


  tags = {
        Name = "h-instance"
  }
}


