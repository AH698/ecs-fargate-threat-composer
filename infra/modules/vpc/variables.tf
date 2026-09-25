variable "cidr_block" {
  description = "cidr_block"
  type = string
  default = "10.0.0.0/16"
}

variable "Name" {
    description = "name of the vpc"
    type = string
  
}

variable "cidr_block_rt" {
    description = "cidr block for route table (public)"
    type = string
    default = "0.0.0.0/0"
}