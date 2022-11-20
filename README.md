<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_sonarqube"></a> [sonarqube](#requirement\_sonarqube) | 0.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_sonarqube"></a> [sonarqube](#provider\_sonarqube) | 0.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sonarqube_project.main](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.0/docs/resources/project) | resource |
| [sonarqube_qualitygate.main](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.0/docs/resources/qualitygate) | resource |
| [sonarqube_qualitygate_project_association.main](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.0/docs/resources/qualitygate_project_association) | resource |
| [sonarqube_qualityprofile.main](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.0/docs/resources/qualityprofile) | resource |
| [sonarqube_qualityprofile_activate_rule.xml_rule](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.0/docs/resources/qualityprofile_activate_rule) | resource |
| [sonarqube_rule.main](https://registry.terraform.io/providers/jdamata/sonarqube/0.15.0/docs/resources/rule) | resource |
| [aws_ssm_parameter.sq_host](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.sq_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_ssm_parameter.sq_username](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | application name | `string` | n/a | yes |
| <a name="input_is_default_profile"></a> [is\_default\_profile](#input\_is\_default\_profile) | n/a | `bool` | `false` | no |
| <a name="input_lang"></a> [lang](#input\_lang) | cs, css, flex, go, java, js, jsp, kotlin, php, py,ruby, scala, ts, vbnet, web, xml | `string` | `"js"` | no |
| <a name="input_region"></a> [region](#input\_region) | log groups region | `string` | `"us-east-1"` | no |
| <a name="input_rule_list"></a> [rule\_list](#input\_rule\_list) | n/a | `map` | `{}` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | project should be visible to everyone, or only specific user/groups. | `string` | `"public"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->