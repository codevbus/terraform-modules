output "zone_id" {
  description = "Zone ID of the Route53 zone"
  value       = aws_route53_zone.main.zone_id
}

output "name_servers" {
  description = "Name servers in the Route53 zone delegation set"
  value       = aws_route53_zone.main.name_servers
}
