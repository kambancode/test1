module "dynamodb_lock" {
  count = local.enable_state_backend ? 1 : 0

  source       = "./modules/dynamodb_lock"
  project_name = var.project_name
}
