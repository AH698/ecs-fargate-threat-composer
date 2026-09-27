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