variable "cidr_block_vpc" {
  description = "cidr_block"
  type        = string
}

variable "vpc_name" {
  description = "name of the vpc"
  type        = string

}

variable "cidr_block_rt" {
  description = "cidr block for route table (public)"
  type        = string
  default     = "0.0.0.0/0"
}

variable "public_cidr" {
  description = "public subnets cidr block"
  type        = list(string)
}

variable "public_ip_on_launch" {
  description = "A public ip that will be designated to both public subnets"
  type        = bool
  default     = true
}