terraform {
  required_providers {
    aws = ">= 2.62.0"
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
  policy = data.aws_iam_policy_document.main.json
}

resource "aws_iam_user_policy_attachment" "main" {
  user       = aws_iam_user.main.name
  policy_arn = aws_iam_policy.main.arn
}

data "aws_iam_policy_document" "main" {
  statement {
    actions   = ["glacier:*"]
    resources = ["*"]
    effect    = "Allow"
    sid       = "AllowAccessGlacier"
  }
}
