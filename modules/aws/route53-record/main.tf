resource "aws_route53_record" "main" {
  zone_id = var.zone_id
  name    = var.name
  type    = var.type
}
