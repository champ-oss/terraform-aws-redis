resource "aws_ssm_parameter" "this" {
  name        = "${var.git}-${random_string.identifier.result}"
  description = "redis password"
  type        = "SecureString"
  value       = random_password.password.result
  tags        = merge(local.tags, var.tags)

  lifecycle {
    create_before_destroy = true
  }
}
