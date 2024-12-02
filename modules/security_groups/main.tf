# Security group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.main.id  # Attach the security group to the VPC

  # Allow all outbound traffic
  egress {
    cidr_blocks = ["0.0.0.0/0"]  
    protocol    = "-1"            
  }

  # Allow SSH access from your local machine (replace <YOUR_PUBLIC_IP>)
  ingress {
    cidr_blocks = ["<YOUR_PUBLIC_IP>/32"]  # Replace with your public IP
    from_port   = 22                    # Allow SSH on port 22
    to_port     = 22
    protocol    = "tcp"                 # TCP protocol
  }
}

# Security group for Private EC2 Instances
resource "aws_security_group" "private_sg" {
  vpc_id = aws_vpc.main.id  # Attach the security group to the VPC

  # Allow all outbound traffic
  egress {
    cidr_blocks = ["0.0.0.0/0"]  
    protocol    = "-1"            
  }

  # Allow SSH access from Bastion Host security group
  ingress {
    cidr_blocks = [aws_security_group.bastion_sg.id]  # Allow access from Bastion SG
    from_port   = 22                    # SSH access on port 22
    to_port     = 22
    protocol    = "tcp"                 # TCP protocol
  }
}

