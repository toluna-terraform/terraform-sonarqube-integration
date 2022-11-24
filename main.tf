terraform {
  required_providers {
    sonarqube = {
      source  = "jdamata/sonarqube"
      version = "~>0.15.0"
    }
  }
}

provider "sonarqube" {
  user                     = data.aws_ssm_parameter.sq_username.value
  pass                     = data.aws_ssm_parameter.sq_password.value
  host                     = "https://${data.aws_ssm_parameter.sq_host.value}"
  tls_insecure_skip_verify = true
}

resource "sonarqube_project" "main" {
  name       = var.app_name
  project    = var.app_name
  visibility = var.visibility
}

resource "random_password" "password" {
  length  = 8
  special = true
}

resource "sonarqube_user" "user" {
  login_name = "sq-${var.app_name}"
  name       = var.app_name
  password   = "secret-sauce37!"
}

resource "sonarqube_user_token" "token" {
  login_name = sonarqube_user.user.login_name
  name       = "${var.app_name}-token"
}

resource "aws_ssm_parameter" "token" {
  name  = "/infra/${var.app_name}/sq_token"
  type  = "SecureString"
  value = sonarqube_user_token.token.token
}

resource "sonarqube_qualitygate" "main" {
  name = "${var.app_name}_qualitygate"
}

resource "sonarqube_qualitygate_project_association" "main" {
  gatename   = sonarqube_qualitygate.main.id
  projectkey = sonarqube_project.main.project
}

/* resource "sonarqube_qualityprofile_project_association" "main" {
  for_each        = var.profile_list
  quality_profile = each.key
  project         = sonarqube_project.main.name
  language        = each.value.lang
} */

resource "sonarqube_qualitygate_condition" "main" {
  for_each  = var.threshold_list
  gatename  = sonarqube_qualitygate.main.id
  metric    = each.value.metric
  threshold = each.value.threshold
  op        = each.value.op
}
