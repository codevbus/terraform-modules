terraform {
  required_providers {
    aws = ">= 2.62.0"
  }
}

resource "aws_iam_instance_profile" "main" {
  name = "${var.name}-instance-profile"
  role = aws_iam_role.main.name
}

resource "aws_iam_role" "main" {
  name = "${var.name}-instance-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "",
        "Effect": "Allow",
        "Principal": {
          "Service": "ec2.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
}
EOF
}

resource "aws_iam_role_policy" "main" {
  name   = "${var.name}-instance-profile-policy"
  role   = aws_iam_role.main.name
  policy = var.policy
}
