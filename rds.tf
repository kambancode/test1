module "rds" {
  count = local.enable_rds ? 1 : 0 # Optional conditional

  source             = "./modules/rds"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  web_sg_id          = var.enable_ec2 ? module.ec2[0].web_sg_id : null
}
