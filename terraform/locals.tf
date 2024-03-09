locals {
  repo_owner            = "szksh-lab"
  repo_name             = "poc-lock-action"
  app_slug              = "szksh-lab"
  base_branch           = "main"
  lock_ruleset_name     = "lock"
  lock_branch_pattern   = "lock/**/*"
  status_check_contexts = ["test"]
}
