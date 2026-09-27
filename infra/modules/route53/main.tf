resource "aws_route53_record" "r53_dns" {
  zone_id = var.r53_zone_id
  name    = var.domain_name
  type    = var.type

  alias {
    name                   = var.alb_dns
    zone_id                = var.alb_zone_id
    evaluate_target_health = var.evaluate_target_health
  }
}