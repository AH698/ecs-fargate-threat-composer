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