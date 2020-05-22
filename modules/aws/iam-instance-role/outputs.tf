output "profile_name" {
  description = "Name/ID of the instance profile."
  value       = aws_iam_instance_profile.main.id
}
