provider "aws" {
  region = "us-east-1"  # Set the AWS region
}

module "vpc" {
  source = "./modules/vpc"  # Import VPC module
}

module "security_groups" {
  source = "./modules/security_groups"  # Import security groups module
}

module "bastion_host" {
  source = "./modules/bastion_host"  # Import Bastion Host module
}

module "autoscaling" {
  source = "./modules/autoscaling"  # Import Auto Scaling Group module
}

variable "key_name" {
  description = "Name of the SSH key"
  type        = string
}

