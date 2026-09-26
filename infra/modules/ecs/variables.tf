variable "cluster_name" {
    description = "name of the cluster"
    type = string
}

variable "ecs_iam_execution_name" {
    description = "name of the ecs task execution iam role"
    type = string
}

variable "iam_role_effect" {
    description = "either permits or denies action"
    type = string
    default = "Allow"
}


variable "vpc_id" {
  description = "the vpc id"
  type        = string
}

variable "ecs_sg_name" {
    description = "name of the ecs security group"
    type = string
}

variable "alb_sg_id" {
  description = "id of the alb security group "
  type        = string
}

variable "ecs_sg_ingress" {
    description = "ports that are able to communicate with ecs"
    type = number
    default = 8080 
}

variable "ecs_sg_ingress_protocol" {
    description = "transport layer"
    type = string
    default = "tcp"
}