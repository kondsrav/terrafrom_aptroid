resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"  # Define the CIDR block for the VPC
}

# Public Subnet 1
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.main.id  # Attach to the VPC
  cidr_block        = "10.0.0.0/20"   # CIDR block for Public Subnet 1
  availability_zone = "us-east-1a"     # Availability zone for this subnet
  map_public_ip_on_launch = true       # Assign public IP to instances launched in this subnet
}

# Public Subnet 2
resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.main.id  # Attach to the VPC
  cidr_block        = "10.0.16.0/20"  # CIDR block for Public Subnet 2
  availability_zone = "us-east-1b"     # Availability zone for this subnet
  map_public_ip_on_launch = true       # Assign public IP to instances launched in this subnet
}

# Private Subnet 1
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id  # Attach to the VPC
  cidr_block        = "10.0.32.0/20"  # CIDR block for Private Subnet 1
  availability_zone = "us-east-1a"     # Availability zone for this subnet
}

# Private Subnet 2
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id  # Attach to the VPC
  cidr_block        = "10.0.48.0/20"  # CIDR block for Private Subnet 2
  availability_zone = "us-east-1b"     # Availability zone for this subnet
}

