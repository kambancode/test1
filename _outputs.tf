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
