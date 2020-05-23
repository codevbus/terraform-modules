output "id" {
  description = "Name of the bucket"
  value       = aws_s3_bucket.main.id
}

output "arn" {
  description = "ARN of the bucket"
  value       = aws_s3_bucket.main.arn
}
