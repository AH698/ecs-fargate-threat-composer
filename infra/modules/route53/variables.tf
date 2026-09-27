variable "r53_zone_id" {
  description = "r53 zone id from acm"
  type        = string
}

variable "domain_name" {
  description = "the domain name"
  type        = string
}

variable "type" {
  description = "dns_type"
  type        = string
}

variable "alb_dns" {
  description = "alb_dns from alb"
  type        = string
}

variable "alb_zone_id" {
  description = "alb_zone_id from alb"
  type        = string
}

variable "evaluate_target_health" {
  description = "evaluates the health of target"
  type        = bool
  default     = true
}