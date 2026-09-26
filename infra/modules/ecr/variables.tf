variable "name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "image_tag_mutability" {
  description = "MUTABLE OR IMMUTABLE"
  type        = string
  default     = "IMMUTABLE"
}


