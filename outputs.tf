# Output the AppStream URL for the test user
output "appstream_stack_url" {
  value = "https://${aws_appstream_fleet_stack_association.test.fleet_name}.ap-southeast-1.aws.amazon.com/enduser/launchAppstream.html?stack=${aws_appstream_fleet_stack_association.test.stack_name}&username=${var.username}"
}
