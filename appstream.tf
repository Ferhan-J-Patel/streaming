provider "aws" {
  region = "us-west-2" # replace with the desired region
  # other provider configuration options
}

# Define variables for username and password
variable "username" {
  type    = string
  default = "username"
}

variable "password" {
  type    = string
  default = "123456"
}

# Retrieve the ID of the Cognito User Pool Client
data "aws_cognito_user_pool_client" "userpoolclient" {
  name = var.username
  user_pool_id = var.password
}

# Retrieve the ID of the AppStream Fleet
data "aws_appstream_fleet" "appstream_fleet" {
  name = "cloudlab-windows-fleet"
}

# Create a Cognito user
resource "aws_cognito_user" "cognito_user" {
  username = var.username
  user_pool_id = data.aws_cognito_user_pool_client.userpoolclient.user_pool_id
  password = var.password
}

# Authenticate the user and retrieve the AppStream URL
data "aws_cognito_user_pools_auth" "example" {
  client_id = data.aws_cognito_user_pool_client.userpoolclient.id
  user_pool_id = data.aws_cognito_user_pool_client.userpoolclient.user_pool_id
  auth_flow = "USER_PASSWORD_AUTH"
  auth_parameters {
    username = var.username
    password = var.password
  }
}

# Output the AppStream URL for the test user
output "appstream_url" {
  value = data.aws_appstream_fleet.appstream_fleet.url
}

