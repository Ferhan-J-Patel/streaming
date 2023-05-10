# Output the AppStream URL for the test user
output "appstream_url" {
  value = data.aws_appstream_stack_fleet_association.existing_association.url
}
