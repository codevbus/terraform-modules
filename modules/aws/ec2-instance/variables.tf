variable "ami" {
  description = "ID of the AMI to use for the instance."
}

variable "instance" {
  description = "Type/size of the EC2 instance."
}

variable "ud" {
  description = "User data for the instance."
}

variable "sgs" {
  description = "Security group IDs to attach to the instance."
  type        = list(string)
}

variable "key" {
  description = "SSH key for accessing the instance."
}

variable "name" {
  description = "Name of the instance."
}

variable "profile" {
  description = "IAM instance profile to attach to the instance."
}
