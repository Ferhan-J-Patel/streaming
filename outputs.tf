# Output the AppStream URL for the test useroutput "stack_arn" {
output "stack_arn" {
  value = "http://cl-auth-site.s3-website-ap-southeast-1.amazonaws.com/window-stack/signin.html"
}

output "password" {
  value = var.password
}

output "Note" {
  value = "Copy and paste the above url and enter your cloudlab-username and the password given here"
}
