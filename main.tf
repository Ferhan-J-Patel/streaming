provider "aws" {
  region = "ap-southeast-1" # replace with the desired region
}

# Retrieve the ID of the Cognito User Pool Client
resource "aws_cognito_user_pool_client" "userpoolclient" {
#   client_id = "5verth6csk863jgouvrfrrnnah"
  user_pool_id = "ap-southeast-1_mjueEvUGJ"
  name = "admin"
}

data "aws_appstream_stack_fleet_association" "existing_association" {
  stack_name = "cloudlab_windows_stack"
  fleet_name = "cloudlab_windows_fleet"
}

# Create a Cognito user
resource "aws_cognito_user" "cognito_user" {
  username = var.username
  user_pool_id = data.aws_cognito_user_pool_client.userpoolclient.user_pool_id
  password = var.password
}

# Authenticate the user and retrieve the AppStream URL
resource "aws_cognito_user_pools_auth" "cognito_auth" {
  client_id = data.aws_cognito_user_pool_client.userpoolclient.id
  user_pool_id = data.aws_cognito_user_pool_client.userpoolclient.user_pool_id
  auth_flow = "USER_PASSWORD_AUTH"
  auth_parameters {
    username = var.username
    password = var.password
  }
}
