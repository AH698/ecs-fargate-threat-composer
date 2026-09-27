module "ecr" {
  source = "./modules/ecr"

}

module "vpc" {
  source = "./modules/vpc"

}

module "acm" {
  source = "./modules/acm"

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