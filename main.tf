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

resource "github_repository" "assignment_repo" {
  name        = var.repo_name
  description = "Terraform assignment - Student: ${var.student_name} | ID: ${var.student_id}"
  visibility  = "public"
  has_issues  = true
  has_wiki    = false
  has_projects = false
  allow_merge_commit = true
  topics = ["terraform", "assignment", "${var.student_id}"]
}
