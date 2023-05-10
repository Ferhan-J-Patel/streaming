# Output the AppStream URL for the test user
output "appstream_stack_url" {
  value = "https://${aws_appstream_stack.test.domain_name}/enduser/launchAppstream.html?stack=${aws_appstream_stack.test.name}&username=${var.username}"
}
