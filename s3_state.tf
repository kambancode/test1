module "s3_state" {
  count = local.enable_state_backend ? 1 : 0

  source       = "./modules/s3_state"
  project_name = var.project_name
  aws_region   = var.aws_region
}
