output "r53_zone_id" {
  value = data.aws_route53_zone.r53_zone.zone_id
}

output "acm_cert" {
  value = aws_acm_certificate_validation.cert_valid.certificate_arn
}