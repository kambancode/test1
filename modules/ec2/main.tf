data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = var.alb_sg_id != "" ? [var.alb_sg_id] : []
    cidr_blocks     = var.alb_sg_id == "" ? ["0.0.0.0/0"] : [] # Block public when ALB enabled
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.project_name}-web-sg" }
}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = var.alb_sg_id == "" ? var.public_subnet_ids[0] : var.private_subnet_ids[0] # Public if no ALB, private if ALB
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = var.alb_sg_id == "" ? true : false # Public IP if no ALB, none if ALB

  user_data = <<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y nginx
    echo "<h1>Hello from $(hostname -f) - $(date)</h1>" > /usr/share/nginx/html/index.html
    systemctl start nginx
    systemctl enable nginx
  EOF

  tags = { Name = "${var.project_name}-web" }
}

# Monitoring
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "${var.project_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when CPU > 80%"
  dimensions          = { InstanceId = aws_instance.web.id }
}
