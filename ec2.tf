module "ec2" {
  count = local.enable_ec2 ? 1 : 0

  source            = "./modules/ec2"
  project_name      = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}
