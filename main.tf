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
  lower_id = lower(var.student_id)
  cleaned_id = join("-", regexall("[a-z0-9]+", local.lower_id))
  repo_name_final = "${var.repo_name}-${local.cleaned_id}"
}

resource "github_repository" "assignment_repo" {
  name        = local.repo_name_final
  description = "Terraform assignment - Student: ${var.student_name} | ID: ${var.student_id}"
  visibility  = "private"
  has_issues  = true
  has_wiki    = false
  has_projects = false
  allow_merge_commit = true
  topics = ["terraform", "assignment", "${var.student_id}"]
}

