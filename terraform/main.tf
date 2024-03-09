terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.0.1"
    }
  }
}

provider "github" {
  owner = local.repo_owner
}

data "github_app" "lock" {
  slug = local.app_slug
}

data "github_repository" "main" {
  name = local.repo_name
}

resource "github_branch_protection" "main" {
  enforce_admins = true
  pattern        = local.base_branch
  repository_id  = data.github_repository.main.id
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 0
  }
  required_status_checks {
    contexts = local.status_check_contexts
    strict   = false
  }
  restrict_pushes {
    blocks_creations = true
    # https://github.com/integrations/terraform-provider-github/issues/1248
    push_allowances = [
      data.github_app.lock.node_id,
    ]
  }
}

resource "github_repository_ruleset" "lock" {
  enforcement = "active"
  name        = local.lock_ruleset_name
  repository  = local.repo_name
  target      = "branch"
  bypass_actors {
    actor_id    = data.github_app.lock.id
    actor_type  = "Integration"
    bypass_mode = "always"
  }
  conditions {
    ref_name {
      exclude = []
      include = ["refs/heads/${local.lock_branch_pattern}"]
    }
  }
  rules {
    deletion = true
  }
}
