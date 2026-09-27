module "ecr" {
  source = "./modules/ecr"
  name = var.ecr_name
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name = var.vpc_name
  cidr_block_vpc = var.cidr_block_vpc
  public_cidr = var.public_cidr
}

module "acm" {
  source = "./modules/acm"
  domain_name = var.domain_name
  r53_zone_name = var.r53_zone_name
}

module "alb" {
  source = "./modules/alb"

}

module "ecs" {
  source = "./modules/ecs"

}

module "route53" {
  source = "./modules/route53"

}