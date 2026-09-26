resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"
  lifecycle { create_before_destroy = true }
}

data "aws_route53_zone" "r53_zone" {
  name         = var.r53_zone_name
  private_zone = var.r53_private_zone
}






