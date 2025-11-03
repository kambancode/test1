module "monitoring" {
  count = local.enable_monitoring ? 1 : 0

  source          = "./modules/monitoring"
  project_name    = var.project_name
  ec2_instance_id = local.enable_ec2 ? module.ec2[0].web_instance_id : null
  rds_identifier  = local.enable_rds ? module.rds[0].db_identifier : null
  alb_arn         = local.enable_alb ? module.alb[0].alb_arn : null
  aws_region      = var.aws_region # Pass region
}
