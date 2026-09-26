variable "alb_name" {
    description = "the name of the alb"
    type = string
}
variable "internal" {
    description = "decides whether alb is reachable from internet"
    type = bool
    default = false
}

variable "public_subnets_id" {
    description = "The id for public subnets"
    type = list(string)
}

variable "sg_alb" {
    description = "name of the security group"
    type = string
}

variable "vpc_id" {
    description = "the vpc id"
    type = string
}

# http ingress

variable "http" {
    description = "from port to port for http"
    type = number
    default = 80
}