# Define the AWS provider and specify the region
provider "aws" {
  region = "us-east-1"  # Change this based on your preferred AWS region
}

# Create an AWS EC2 instance for hosting the Smile website
resource "aws_instance" "smile_server" {
  ami           = "ami-04b4f1a9cf54c11d0"  # Ubuntu 20.04 AMI (Region-specific, update if needed)
  instance_type = "t2.micro"  # Free-tier eligible, sufficient for small applications
  key_name      = "smile-key"  # Replace with your actual AWS key pair name (needed for SSH access)

  # Attach the security group we will define below
  security_groups = [aws_security_group.smile_sg.name]

  # Assign a tag (name) to the EC2 instance for identification
  tags = {
    Name = "smile-server"
  }
}

# Create a Security Group for the EC2 instance
resource "aws_security_group" "smile_sg" {
  name        = "smile-sg"
  description = "Security group for Smile website"

  # Allow SSH access from anywhere (port 22)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows access from any IP (for remote login via SSH)
  }

  # Allow HTTP traffic (port 80) so users can access the website
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allows traffic from any IP (for public access)
  }

  # Allow HTTPS traffic (port 443) for secure connections
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rules (allow all outgoing traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # "-1" means all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}

