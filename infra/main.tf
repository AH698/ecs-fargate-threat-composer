module "ecr" {
  source = "./modules/ecr"
  ecr_name = var.ecr_name
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
  alb_name = var.alb_name
  vpc_id = module.vpc.vpc_id
  public_subnets_id = module.vpc.public_subnets_ids
  cert_arn = module.acm.acm_cert
  sg_alb = var.sg_alb
  alb_listener_2_status_code = var.alb_listener_2_status_code
  tg_name = var.tg_name
  hc_tg_path = var.hc_tg_path
}

module "ecs" {
  source = "./modules/ecs"
  cluster_name = var.cluster_name
  ecs_iam_execution_name = var.ecs_iam_execution_name
  ecs_sg_name = var.ecs_sg_name
  vpc_id = module.vpc.vpc_id
  alb_sg_id = module.alb.alb_sg_id
  ecs_family = var.ecs_family
  ecs_task_def_cpu = var.ecs_task_def_cpu
  ecs_task_def_memory = var.ecs_task_def_memory
  container_name =
  container_image =
  cpu_architecture =
  service_name = var.service_name
  alb_tg = module.alb.alb_tg_arn
  public_subnets_id = module.vpc.public_subnets_ids
}

module "route53" {
  source = "./modules/route53"
}