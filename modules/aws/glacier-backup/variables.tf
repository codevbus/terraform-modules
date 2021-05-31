variable "project_name" {
  description = "project name"
}

variable "acl" {
  description = "Canned ACL of the S3 bucket"
  default     = "private"
}

variable "keybase_profile" {
  description = "Keybase profile for PGP encryption"
}
