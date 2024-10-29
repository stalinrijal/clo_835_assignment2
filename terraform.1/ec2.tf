resource "aws_instance" "dockerhost_server" {
  ami                    = var.linux_ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet
  vpc_security_group_ids = [aws_security_group.allow_web_ssh.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum -y install docker
    sudo service docker start
    sudo usermod -a -G docker ec2-user
    EOF
  key_name               = aws_key_pair.ec2_key.key_name
  # iam_instance_profile = aws_iam_instance_profile.ec2_ecr_instance_profile.name
  associate_public_ip_address = true
  tags = {
    Name = "dockerhost_server"
  }
}

# Create an AWS Key Pair
resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key_pair"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Create the private key locally
resource "local_file" "private_key" {
  filename = "${path.module}/ec2_key.pem"
  content  = tls_private_key.ec2_key.private_key_pem
  file_permission = "0400"
}

resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}