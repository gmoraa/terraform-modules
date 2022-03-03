resource "aws_key_pair" "default_key" {
  key_name   = "default-key"
  public_key = data.aws_secretsmanager_secret_version.public_key_secret.secret_string
}