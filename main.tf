provider "aws" {
  region = "ap-southeast-1" # replace with the desired region
}

# resource "aws_cognito_user" "example_user" {
#   user_pool_id = "ap-southeast-1_mjueEvUGJ"
#   username     = var.username
#   message_action = "SUPPRESS"
#   # set permanent password for user
#   password = var.password
# }

# data "aws_appstream_stack" "my_stack" {
#   name = "cloudlab-windows-stack"
# }

# output "appstream_stack_url" {
#   value = "https://appstream2.ap-southeast-1.aws.amazon.com/?{\"action\":\"launch\",\"arn\":\"${aws_appstream_stack.my_stack.arn}\"}"
# }


resource "aws_appstream_stack_fleet_association" "test" {
  stack_name = "cloudlab-windows-stack"
  fleet_name = "cloudlab-windows-fleet"
}
