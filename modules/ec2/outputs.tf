output "web_public_ip" {
  description = "Public IP of the web EC2 instance"
  value       = aws_instance.web.public_ip
}

output "web_sg_id" {
  description = "ID of the web security group"
  value       = aws_security_group.web.id
}