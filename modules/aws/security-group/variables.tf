variable "name" {
  description = "Name of the security group."
}

variable "vpc" {
  description = "ID of the VPC to place the security group in."
}

variable "description" {
  description = "Security group description"
  default     = "security group"
}

variable "ingress_rules" {
  description = "List of ingress rule objects"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rule objects"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
