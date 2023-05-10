# Output the AppStream URL for the test user
output "appstream_stack_url" {
  value = "https://${data.aws_appstream_fleet_stack_association.test.fleet_name}.${data.aws_appstream_fleet_stack_association.test.region}.aws.amazon.com/enduser/launchAppstream.html?stack=${aws_appstream_fleet_stack_association.test.name}&username=${var.username}"
}
