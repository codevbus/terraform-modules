variable "bucket_name" {
  description = "S3 bucket name"
}

variable "acl" {
  description = "Canned ACL of the S3 bucket"
  default     = "private"
}
