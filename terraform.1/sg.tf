# Create a Security Group
resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow HTTP, custom app (8080), and SSH"

  # Ingress rules: allow inbound traffic on port 80 (HTTP), 8080, and 22 (SSH)
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP
  }

  ingress {
    description = "Allow custom app on 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP
  }

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow from any IP
  }

  # Egress rules: allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allows all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_ssh"
  }
}
