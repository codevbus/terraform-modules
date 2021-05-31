output "id" {
  description = "Name of the bucket"
  value       = aws_s3_bucket.main.id
}

output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.main.arn
}

output "iam_secret" {
  description = "Encrypted IAM credentials"
  value       = aws_iam_access_key.main.encrypted_secret
}
