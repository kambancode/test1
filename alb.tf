module "alb" {
  count = local.enable_alb && local.enable_ec2 ? 1 : 0

  source             = "./modules/alb"
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  private_subnet_ids = module.vpc.private_subnet_ids # Add this
  ec2_instance_id    = module.ec2[0].web_instance_id
  ec2_sg_id          = module.ec2[0].web_sg_id
}
