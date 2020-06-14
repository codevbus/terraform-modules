variable "zone_id" {
  description = "Zone ID of the Route53 zone for this record"
}

variable "name" {
  description = "Name of the Route53 record"
}

variable "type" {
  description = "Type of Route53 record. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
}

variable "ttl" {
  description = "TTL of the Route53 record."
  type        = number
}

variable "records" {
  description = "String list of DNS records"
  type        = list
}
