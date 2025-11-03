variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "aws_region" {
  description = "AWS region for the service name"
  type        = string
}

variable "route_table_ids" {
  description = "List of route table IDs to associate with the endpoint"
  type        = list(string)
}
