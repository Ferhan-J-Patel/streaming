provider "aws" {
  region = "ap-southeast-1" # replace with the desired region
}

# Retrieve the ID of the Cognito User Pool Client
data "external" "aws_cognito_user_pool_client" {
  client_id = "5verth6csk863jgouvrfrrnnah"
}

# Retrieve the ID of the AppStream Fleet
data "external" "aws_appstream_fleet" {
  name = "cloudlab-windows-fleet"
}

# Create a Cognito user
resource "aws_cognito_user" "cognito_user" {
  username = var.username
  user_pool_id = data.aws_cognito_user_pool_client.userpoolclient.user_pool_id
  password = var.password
}

# Authenticate the user and retrieve the AppStream URL
data "external" "aws_cognito_user_pools_auth" {
  client_id = data.aws_cognito_user_pool_client.userpoolclient.id
  user_pool_id = data.aws_cognito_user_pool_client.userpoolclient.user_pool_id
  auth_flow = "USER_PASSWORD_AUTH"
  auth_parameters {
    username = var.username
    password = var.password
  }
}
