# Terraform Module: AWS ACM Certificate Request

This module will:
1. Request a DNS validated ACM Certificate for a given domain name
1. Deploy Route53 validation records (outputs from the certificate request above)
1. Wait for validation to complete and output the certificate ARN

## Example Use

```
locals {
  domain = "appvia.io"
}

resource "aws_route53_zone" "example" {
  name = "${local.domain}"
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

module "acm-certificate" {
  source = "git::https://github.com/appvia/tf-aws-acm-certificate?ref=v0.0.1"

  domain_name = "${local.domain}"
  zone_id     = "${aws_route53_zone.example.zone_id}"

  providers {
    aws = "aws.us-east-1"
  }
}
```

> **Note:** To use ACM Certificates with AWS CloudFront, you must request the certificate in the US East (North Virginia) region, as shown in the above example.

## Required Variables

- **domain_name**: Fully qualified domain name to request a certificate for
- **zone_id**: The Route53 Zone ID that manages the above domain

## Outputs

- **arn**: The ARN for the AWS ACM Certificate
