variable "ecr_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "vpc_name" {
  description = "name of the vpc"
  type        = string

}

variable "cidr_block_vpc" {
  description = "cidr_block"
  type        = string
}

variable "public_cidr" {
  description = "public subnets cidr block"
  type        = list(string)
}

variable "domain_name" {
  description = "domain name for app"
  type        = string
}

variable "r53_zone_name" {
  description = "The name of the r53 zone"
  type        = string
}

variable "alb_name" {
  description = "the name of the alb"
  type        = string
}

variable "sg_alb" {
  description = "name of the security group"
  type        = string
}

variable "alb_listener_2_status_code" {
  description = "status code for the redirect"
  type        = string
}

variable "tg_name" {
  description = "name of the tg"
  type        = string
}

variable "hc_tg_path" {
  description = "path for health check"
  type        = string
}