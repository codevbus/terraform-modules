output "name" {
  description = "Name of the Route53 record"
  value       = aws_route53_record.main.name
}

output "fqdn" {
  description = "FQDN of the Route53 record"
  value       = aws_route53_record.main.fqdn
}
