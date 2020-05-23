terraform {
  required_providers {
    aws = ">= 2.62.0"
  }
}

resource "aws_security_group" "main" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc

  ingress = [
    for rule in var.ingress_rules : merge({
      from_port        = 0
      to_port          = 0
      description      = null
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }, rule)
  ]

  egress = [
    for rule in var.egress_rules : merge({
      from_port        = 0
      to_port          = 0
      description      = null
      ipv6_cidr_blocks = null
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }, rule)
  ]
}
