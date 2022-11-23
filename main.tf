terraform {
  required_providers {
    sonarqube = {
      source = "jdamata/sonarqube"
      version = "~>0.15.0"
    }
  }
}

provider "sonarqube" {
    user   = "${data.aws_ssm_parameter.sq_username.value}"
    pass   = "${data.aws_ssm_parameter.sq_password.value}"
    host   = "https://${data.aws_ssm_parameter.sq_host.value}"
}

resource "sonarqube_project" "main" {
    name       = "${var.app_name}"
    project    = "${var.app_name}"
    visibility = "${var.visibility}" 
}

resource "sonarqube_qualitygate" "main" {
    name = "${var.app_name}_qualitygate"
}

resource "sonarqube_qualityprofile_project_association" "main" {
    for_each = var.profile_list
    quality_profile = sonarqube_qualityprofile.main.name
    project         = sonarqube_project.main.name
    language        = each.value.lang
}


resource "sonarqube_qualitygate_project_association" "main" {
    gatename   = sonarqube_qualitygate.main.id
    projectkey = sonarqube_project.main.project
}

resource "sonarqube_qualitygate_condition" "main" {
    for_each = var.threshold_list
    gatename  = sonarqube_qualitygate.main.id
    metric    = "${each.value.metric}"
    threshold = "${each.value.threshold}"
    op        = "${each.value.op}"
}