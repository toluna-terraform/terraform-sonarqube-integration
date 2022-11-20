module "sonarqube" {
  source                      = "../../"
  version                     = "~>0.0.1"
  app_name                    = "my_app"
  visibility                  = "public"
  region                      = "us-east-1"
  lang                        = "js"
  is_default_profile          = false
  rule_list                   = {
    "rule_1" :{
      "markdown_description":"Description of my rule"
      "params": "FilePattern=**/pom.xml;FilePattern=**/*.js;"
      "prevent_reactivation": "false"
      "severity":"CRITICAL"
      "status":"READY"
      "template_key":"xml:XPathCheck"
      "type":"VULNERABILITY"
    },
    "rule_2" :{
      "markdown_description":"Description of my rule"
      "params": "FilePattern=**/pom.xml;FilePattern=**/*.js;"
      "prevent_reactivation": "false"
      "severity":"MINOR"
      "status":"BETA"
      "template_key":"xml:XPathCheck"
      "type":"CODE_SMELL"
    }
  }
}


