# Pulls existing ssh key from AWS to Terraform state
# This key was uploaded manually to the Secret Manager
# Named 'key.pub' as type 'Plaintext'
data "aws_secretsmanager_secret" "public_key" {
  name = "key.pub"
}

data "aws_secretsmanager_secret_version" "public_key_secret" {
  secret_id = data.aws_secretsmanager_secret.public_key.id
}