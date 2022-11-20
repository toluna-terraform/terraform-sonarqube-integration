terraform {
  required_providers {
    sonarqube = {
      source = "jdamata/sonarqube"
      version = "0.15.0"
    }
  }
}

provider "sonarqube" {
    user   = "${data.aws_ssm_parameter.sq_username.value}"
    pass   = "${data.aws_ssm_parameter.sq_password.value}"
    host   = "${data.aws_ssm_parameter.sq_host.value}"
}

resource "sonarqube_project" "main" {
    name       = "${var.app_name}"
    project    = "${var.app_name}"
    visibility = "${var.visibility}" 
}

resource "sonarqube_qualitygate" "main" {
    name = "${var.app_name}_qualitygate"
}

resource "sonarqube_qualitygate_project_association" "main" {
    gatename   = sonarqube_qualitygate.main.id
    projectkey = sonarqube_project.main.project
}

resource "sonarqube_qualityprofile" "main" {
    name     = "${var.app_name}_qualitygate_profile"
    language = "${var.lang}" #  "cs", "css", "flex", "go", "java", "js", "jsp", "kotlin", "php", "py", "ruby", "scala", "ts", "vbnet", "web", "xml"
    is_default = var.is_default_profile
    parent = "sonar way"
}

resource "sonarqube_rule" "main" {
  for_each = var.rule_list
  custom_key = "${var.app_name}-${each.key}"
  markdown_description = "${each.value.markdown_description}"  
  name = "${var.app_name}-${each.key}"
  params = "${each.value.params}"
  prevent_reactivation = "${each.value.prevent_reactivation}"
  severity = "${each.value.sevirity}"
  status = "${each.value.status}"
  template_key = "${each.value.template_key}"
  type = "${each.value.type}"
}

resource "sonarqube_qualityprofile_activate_rule" "main" {
  for_each = var.rule_list
  key = sonarqube_qualityprofile.main.key # .id also works
  rule = sonarqube_rule.main[each.key].id
  severity = "${each.value.sevirity}"
}