variable "github_token" {
  type      = string
  sensitive = true
}

variable "repo_name" {
  type        = string
  description = "Name of repository to create"
}

variable "student_name" {
  type        = string
  description = "Your full name"
}

variable "student_id" {
  type        = string
  description = "Your student id"
}
