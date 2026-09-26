variable "domain_name" {
    description = "domain name for app"
    type = string
}

variable "r53_zone_name" {
    description = "The name of the r53 zone" 
    type = string
}

variable "r53_private_zone" {
    description = "r53 private zone"
    type = bool
    default = false
}

