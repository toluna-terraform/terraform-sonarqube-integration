<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_sonarqube"></a> [sonarqube](#requirement\_sonarqube) | ~>0.15.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_sonarqube"></a> [sonarqube](#provider\_sonarqube) | ~>0.15.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameter.token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [sonarqube_project.main](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/project) | resource |
| [sonarqube_qualitygate.main](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/qualitygate) | resource |
| [sonarqube_qualitygate_condition.main](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/qualitygate_condition) | resource |
| [sonarqube_qualitygate_project_association.main](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/qualitygate_project_association) | resource |
| [sonarqube_qualityprofile_project_association.main](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/qualityprofile_project_association) | resource |
| [sonarqube_user.user](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/user) | resource |
| [sonarqube_user_token.token](https://registry.terraform.io/providers/jdamata/sonarqube/latest/docs/resources/user_token) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | application name | `string` | n/a | yes |
| <a name="input_profile_list"></a> [profile\_list](#input\_profile\_list) | n/a | `map(any)` | `{}` | no |
| <a name="input_region"></a> [region](#input\_region) | log groups region | `string` | `"us-east-1"` | no |
| <a name="input_threshold_list"></a> [threshold\_list](#input\_threshold\_list) | n/a | `map(any)` | `{}` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | project should be visible to everyone, or only specific user/groups. | `string` | `"public"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->