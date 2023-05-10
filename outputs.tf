# Output the AppStream URL for the test user
output "appstream_url" {
  value = data.aws_appstream_fleet.existing_fleet.url
}
