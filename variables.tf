variable "app_name" {
  description = "application name"
  type        = string
}

variable "region" {
  description = "log groups region"
  default = "us-east-1"
}

variable "visibility" {
  description = "project should be visible to everyone, or only specific user/groups."
  default = "public"
}

variable "lang" {
  description = " cs, css, flex, go, java, js, jsp, kotlin, php, py,ruby, scala, ts, vbnet, web, xml"
  default = "js"
}

 variable "is_default_profile" {
  type = bool
  default = false
 }

 variable "rule_list" {
  type = map
  default = {}
 }