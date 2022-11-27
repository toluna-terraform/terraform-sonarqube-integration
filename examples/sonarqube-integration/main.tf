locals {
  sonarqube_rules = {
profile_list = {
    Toluna_terraform ={
      lang =terraform
    },
    Toluna_javascript = {
      lang =js
    }
  },
  threshold_list = {
    th_1 ={
      metric = vulnerabilities
      threshold =10
      op =GT
    },
    th_2 ={
      metric =coverage
      threshold =70
      op =LT
    },
    th_3 ={
      metric =blocker_violations
      threshold =4
      op =GT
    }
  }
  }
}

module "sonarqube" {
  source                      = "../../"
  version                     = "~>0.0.1"
  app_name                    = "my_app"
  visibility                  = "private"
  region                      = "us-east-1"
  profile_list = local.sonarqube_rules.profile_list
  threshold_list = local.sonarqube_rules.threshold_list
}


