## VPC
output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "web_public_ip" {
  description = "Public IP of the web EC2 instance (null if disabled)"
  value       = local.enable_ec2 ? module.ec2[0].web_public_ip : null # Use [0] for count
}

## RDS
output "db_endpoint" {
  description = "Endpoint of the RDS instance (null if disabled)"
  value       = local.enable_rds ? module.rds[0].db_endpoint : null # [0] for count
}

# output "db_password" {
#   description = "Generated password for the RDS instance (null if disabled)"
#   value       = local.enable_rds ? module.rds[0].db_password : null
#   sensitive   = true
# }

output "db_ssm_param_name" {
  description = "Name of the DB password SSM parameter (null if disabled)"
  value       = length(module.rds) > 0 ? module.rds[0].db_ssm_param_name : null
}

output "alb_dns_name" {
  description = "DNS name of the ALB (null if disabled)"
  value       = length(module.alb) > 0 ? module.alb[0].alb_dns_name : null
}

## S3 Endpoint
output "s3_endpoint_id" {
  description = "ID of the S3 VPC Endpoint (null if disabled)"
  value       = local.enable_s3_endpoint ? module.s3_endpoint[0].s3_endpoint_id : null
}

## Monitoring
output "dashboard_url" {
  description = "URL of the CloudWatch dashboard (null if disabled)"
  value       = local.enable_monitoring ? module.monitoring[0].dashboard_url : null
}

## State Backend
output "s3_state_bucket" {
  description = "Name of the S3 bucket for Terraform state (null if disabled)"
  value       = local.enable_state_backend ? module.s3_state[0].bucket_name : null
}

output "dynamodb_lock_table" {
  description = "Name of the DynamoDB table for Terraform locks (null if disabled)"
  value       = local.enable_state_backend ? module.dynamodb_lock[0].table_name : null
}
