output "arn" {
  description = "The ARN for the AWS ACM Certificate"
  value       = aws_acm_certificate.cert.arn
}

