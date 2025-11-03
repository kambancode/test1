module "s3_endpoint" {
  count = local.enable_s3_endpoint ? 1 : 0

  source          = "./modules/s3_endpoint"
  project_name    = var.project_name
  vpc_id          = module.vpc.vpc_id
  aws_region      = var.aws_region
  route_table_ids = [module.vpc.private_route_table_id] # Associate with private RT for secure access
}
