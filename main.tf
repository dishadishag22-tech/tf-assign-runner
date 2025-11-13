terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "5.20.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "github" {
  token = var.github_token
}

locals {
  raw_id      = var.student_id
  lower_id    = lower(local.raw_id)
  replaced_id = regexreplace(local.lower_id, "[^a-z0-9-]", "-")
  stripped_id = regexreplace(local.replaced_id, "^-+", "")
  topic_id    = substr(local.stripped_id, 0, 50)
}

resource "github_repository" "assignment_repo" {
  name        = var.repo_name
  description = "Terraform assignment - Student: ${var.student_name} | ID: ${var.student_id}"
  visibility  = "public"
  has_issues  = true
  has_wiki    = false
  has_projects = false
  allow_merge_commit = true

  topics = [
    "terraform",
    "assignment",
    local.topic_id
  ]
}
