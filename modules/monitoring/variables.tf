variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
}

variable "ec2_instance_id" {
  description = "ID of the EC2 instance (optional)"
  type        = string
  default     = null
}

variable "rds_identifier" {
  description = "Identifier of the RDS instance (optional)"
  type        = string
  default     = null
}

variable "alb_arn" {
  description = "ARN of the ALB (optional)"
  type        = string
  default     = null
}

# Monitoring
variable "aws_region" {
  description = "AWS region for the dashboard"
  type        = string
  default     = "us-east-1"
}
