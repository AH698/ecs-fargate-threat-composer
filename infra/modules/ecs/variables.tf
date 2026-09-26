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