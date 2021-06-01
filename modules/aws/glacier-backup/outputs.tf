output "iam_user" {
  description = "IAM user for glacier backups"
  value       = aws_iam_user.main.name
}

output "iam_secret" {
  description = "Encrypted IAM credentials"
  value       = aws_iam_access_key.main.encrypted_secret
}
