# Output the AppStream URL for the test user
output "appstream_url" {
  value = resource.aws_appstream_fleet.appstream_fleet.url
}
