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

variable "transport_layer" {
    description = "transport layer"
    type = string
    default = "tcp"
  
}

variable "http" {
    description = "from port to port for http"
    type = number
    default = 80
}

variable "https" {
    description = "from port to port for https"
    type = number
    default = 443
}

variable "egress" {
    description = "allow all outbound"
    type = number
    default = 0
}
variable "egress_protocol" {
    description = "all protocols"
    type = string
    default = "-1"
}

variable "egress_cidr" {
    description = "determines which ip add traffic can go to"
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "ingress_cidr" {
    description = "determines which ip add can send traffic to alb"
    type = list(string)
    default = [ "0.0.0.0/0" ]
  
}