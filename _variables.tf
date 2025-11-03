variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name of the project for tagging"
  type        = string
  default     = "test-demo"
}


variable "enable_ec2" {
  description = "Enable (1) or disable (0) EC2 module creation"
  type        = bool
  default     = true # Enabled by default
}

variable "enable_rds" {
  description = "Enable or disable RDS module creation"
  type        = bool
  default     = true # Enabled by default
}

variable "enable_alb" {
  description = "Enable or disable RDS module creation"
  type        = bool
  default     = true # Enabled by default
}

variable "enable_s3_endpoint" {
  description = "Enable or disable S3 VPC Endpoint module creation"
  type        = bool
  default     = true # Enabled by default
}
