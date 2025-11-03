locals {
  metrics_list = [
    var.ec2_instance_id != null ? ["AWS/EC2", "CPUUtilization", "InstanceId", var.ec2_instance_id] : null,
    var.rds_identifier != null ? ["AWS/RDS", "FreeStorageSpace", "DBInstanceIdentifier", var.rds_identifier] : null,
    var.alb_arn != null ? ["AWS/ApplicationELB", "UnHealthyHostCount", "LoadBalancer", var.alb_arn] : null,
  ]
}

resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "${var.project_name}-dashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6
        properties = {
          metrics = [for m in local.metrics_list : m if m != null]
          view    = "timeSeries"
          stacked = false
          region  = var.aws_region # Use variable
          title   = "Key Metrics"
        }
      }
    ]
  })
}

# Expanded EC2 CPU Alarm (if EC2 enabled)
resource "aws_cloudwatch_metric_alarm" "ec2_high_cpu" {
  count               = var.ec2_instance_id != null ? 1 : 0
  alarm_name          = "${var.project_name}-ec2-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU > 80%"
  dimensions          = { InstanceId = var.ec2_instance_id }
}

# RDS Storage Alarm (if RDS enabled)
resource "aws_cloudwatch_metric_alarm" "rds_low_storage" {
  count               = var.rds_identifier != null ? 1 : 0
  alarm_name          = "${var.project_name}-rds-low-storage"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 1000000000 # 1 GB
  alarm_description   = "Alarm when RDS free storage < 1GB"
  dimensions          = { DBInstanceIdentifier = var.rds_identifier }
}

# ALB Unhealthy Hosts Alarm (if ALB enabled)
resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_hosts" {
  count               = var.alb_arn != null ? 1 : 0
  alarm_name          = "${var.project_name}-alb-unhealthy-hosts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Average"
  threshold           = 0
  alarm_description   = "Alarm when ALB has unhealthy hosts"
  dimensions          = { LoadBalancer = var.alb_arn }
}
