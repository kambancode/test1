variable "project_name" { type = string }
variable "vpc_id" { type = string }
variable "public_subnet_ids" { type = list(string) }
variable "ec2_instance_id" { type = string }
variable "ec2_sg_id" { type = string }

## ALB on/off
variable "private_subnet_ids" {
  description = "List of private subnet IDs (optional for ALB)"
  type        = list(string)
  default     = [] # Add default to make optional
}
