output "id" {
  description = "ID of the security group."
  value       = "${aws_security_group.main.id}"
}

output "arn" {
  description = "ARN of the security group."
  value       = "${aws_security_group.main.arn}"
}
