/* 
data "aws_ssm_parameter" "sq_username" {
  name = "/infra/sonarqube/username"
  with_decryption = true
}

data "aws_ssm_parameter" "sq_password" {
  name = "/infra/sonarqube/password"
  with_decryption = true
}

data "aws_ssm_parameter" "sq_host" {
  name = "/infra/sonarqube/host"
  with_decryption = true
} */
