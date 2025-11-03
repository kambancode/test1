output "db_endpoint" {
  description = "Endpoint of the RDS instance"
  value       = aws_db_instance.main.endpoint
}

# output "db_password" {
#   description = "Generated password for the RDS instance"
#   value       = random_password.db.result
#   sensitive   = true  # Hides in outputs
# }

output "db_ssm_param_name" {
  description = "Name of the SSM Parameter for DB password"
  value       = aws_ssm_parameter.db_password.name
}
