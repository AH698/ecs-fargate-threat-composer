variable "alb_name" {
  description = "the name of the alb"
  type        = string
}
variable "internal" {
  description = "decides whether alb is reachable from internet"
  type        = bool
  default     = false
}

variable "public_subnets_id" {
  description = "The id for public subnets"
  type        = list(string)
}

variable "sg_alb" {
  description = "name of the security group"
  type        = string
}

variable "vpc_id" {
  description = "the vpc id"
  type        = string
}

variable "transport_layer" {
  description = "transport layer"
  type        = string
  default     = "tcp"

}

variable "http" {
  description = "from port to port for http"
  type        = number
  default     = 80
}

variable "https" {
  description = "from port to port for https"
  type        = number
  default     = 443
}

variable "egress" {
  description = "allow all outbound"
  type        = number
  default     = 0
}
variable "egress_protocol" {
  description = "all protocols"
  type        = string
  default     = "-1"
}

variable "egress_cidr" {
  description = "determines which ip add traffic can go to"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_cidr" {
  description = "determines which ip add can send traffic to alb"
  type        = list(string)
  default     = ["0.0.0.0/0"]

}

variable "tg_name" {
  description = "name of the tg"
  type        = string
}

variable "tg_port" {
  description = "port containers listen on"
  type        = number
  default     = 8080
}

variable "tg_protocol" {
  description = "protocol alb uses to send traffic to containers"
  type        = string
  default     = "HTTP"
}

variable "hc_tg_path" {
  description = "path for health check"
  type        = string
}
variable "hc_tg_matcher" {
  description = "status code that counts as a healthy response"
  type        = string
  default     = "200"
}

variable "hc_tg_interval" {
  description = "Seconds between health checks"
  type        = number
  default     = 30
}

variable "hc_tg_timeout" {
  description = "Seconds to wait for a health check response before it counts as a fail"
  type        = number
  default     = 5
}

variable "hc_tg_healthy_threshold" {
  description = "Consecutive passed checks before a target is marked healthy"
  type        = number
  default     = 2
}

variable "hc_tg_unhealthy_threshold" {
  description = "Consecutive failed checks before a target is marked unhealthy"
  type        = number
  default     = 3
}

variable "alb_listener_1_protocol" {
  description = "protocol"
  type        = string
  default     = "HTTPS"
}

variable "cert_arn" {
  description = "arn of the acm certificate for the domain"
  type        = string
}

variable "alb_listener_1_type" {
  description = "action that listener takes on incoming requests"
  type        = string
  default     = "forward"
}

variable "alb_listener_2_protocol" {
  description = "protocol"
  type        = string
  default     = "HTTP"
}

variable "alb_listener_2_status_code" {
  description = "status code for the redirect"
  type        = string
}
