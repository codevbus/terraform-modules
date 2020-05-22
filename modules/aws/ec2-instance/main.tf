terraform {
  required_providers {
    aws = ">= 2.62.0"
  }
}

resource "aws_instance" "main" {
  ami                         = var.ami
  instance_type               = var.instance
  user_data                   = var.ud
  vpc_security_group_ids      = var.sgs
  key_name                    = var.key
  iam_instance_profile        = var.profile
  associate_public_ip_address = true

  tags = {
    Name      = var.name
    Terraform = true
  }
}
