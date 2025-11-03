module "github_oidc" {
  count = local.enable_github_oidc ? 1 : 0

  source       = "./modules/github_oidc"
  project_name = var.project_name
  github_repo  = var.github_repo
}
