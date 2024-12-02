resource "aws_instance" "bastion" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use the appropriate AMI for your region
  instance_type = "t2.micro"               # Instance type for the Bastion host
  subnet_id     = aws_subnet.public_subnet_1.id  # Attach the instance to Public Subnet 1
  security_groups = [aws_security_group.bastion_sg.name]  # Attach the Bastion SG
}

