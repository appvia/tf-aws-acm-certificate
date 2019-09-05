variable "domain_name" {
  description = "The domain name to request a certificate for"
}

variable "validation_method" {
  description = "The certificate validation method to perform"
  default     = "DNS"
}

variable "zone_id" {
  default = "The Route53 Zone ID for the domain that the certificate is being requested for"
}

