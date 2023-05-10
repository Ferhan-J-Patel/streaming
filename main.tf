provider "aws" {
  region = "ap-southeast-1" # replace with the desired region
}

resource "aws_cognito_user" "example_user" {
  user_pool_id = "ap-southeast-1_KSAGoIwOU"
  username     = var.username
  message_action = "SUPPRESS"
  # set permanent password for user
  password = var.password
}
