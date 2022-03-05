data "aws_vpc" "main" {
  default = true
}

data "aws_region" "current" {}