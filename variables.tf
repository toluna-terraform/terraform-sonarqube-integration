variable "app_name" {
  description = "application name"
  type        = string
}

variable "region" {
  description = "log groups region"
  default     = "us-east-1"
}

variable "visibility" {
  description = "project should be visible to everyone, or only specific user/groups."
  default     = "public"
}

variable "threshold_list" {
  type    = map(any)
  default = {}
}


variable "profile_list" {
  type    = map(any)
  default = {}
}
