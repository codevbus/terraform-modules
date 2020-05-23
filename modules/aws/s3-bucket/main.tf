terraform {
  required_providers {
    aws = ">= 2.62.0"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
  acl    = var.acl

  tags {
    Name      = var.bucket_name
    Terraform = true
  }
}
