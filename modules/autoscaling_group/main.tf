# Launch Template for EC2 Instances in Auto Scaling Group
resource "aws_launch_template" "private_instance_template" {
  image_id      = "ami-0c55b159cbfafe1f0"  # Use the appropriate AMI for your region
  instance_type = "t2.micro"               # EC2 instance type for Auto Scaling
  security_groups = [aws_security_group.private_sg.name]  # Attach the private security group
}

# Auto Scaling Group configuration
resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2  # Desired number of instances in the ASG
  max_size            = 6  # Maximum number of instances
  min_size            = 1  # Minimum number of instances
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]  # Attach to private subnets

  launch_template {
    id      = aws_launch_template.private_instance_template.id  # Use the launch template for instance configuration
    version = "$Latest"  # Always use the latest version of the launch template
  }
}

