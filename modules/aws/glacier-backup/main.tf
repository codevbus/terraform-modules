terraform {
  required_providers {
    aws = ">= 2.62.0"
  }
}

resource "aws_s3_bucket" "main" {
  bucket = var.project_name
  acl    = var.acl

  tags = {
    Name      = var.project_name
    Terraform = true
  }

  lifecycle_rule = {
    id      = "glacier-transition-rule"
    enabled = true

    transition = {
      days          = 0
      storage_class = "GLACIER"
    }
  }

  server_side_encryption_configuration = {

    rule = {

      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

}

resource "aws_iam_user" "main" {
  name = "${var.project_name}-user"

  tags = {
    Terraform = true
  }
}

resource "aws_iam_access_key" "main" {
  user    = aws_iam_user.main.name
  pgp_key = var.keybase_profile
}

resource "aws_iam_policy" "main" {
  name   = "${var.project_name}-user-policy"
  policy = data.aws_policy_document.main
}

resource "aws_iam_user_policy_attachment" "main" {
  user       = aws_iam_user.main.name
  policy_arn = aws_iam_policy.main.arn
}

data "aws_policy_document" "main" {
  statement {
    actions   = ["s3:*"]
    resources = [aws_s3_bucket.main.arn]
    effect    = "Allow"
  }
}
