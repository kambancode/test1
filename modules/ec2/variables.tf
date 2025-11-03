variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

## ALB requrement
variable "alb_sg_id" {
  type        = string
  default     = ""
  description = "ID of the ALB security group (optional, for secure ingress)"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}
