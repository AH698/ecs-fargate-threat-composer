variable "cidr_block" {
  description = "cidr_block"
  type = string
}

variable "Name" {
    description = "name of the vpc"
    type = string
  
}

variable "state" {
    description = "state of the AZ"
    type = string
    default = "available"
  
}
