resource "aws_cloudwatch_log_group" "redis_slow" {
  name = "${var.git}-slow-${random_string.identifier.result}"
  tags = merge(local.tags, var.tags)
}
resource "aws_cloudwatch_log_group" "redis_engine" {
  name = "${var.git}-engine-${random_string.identifier.result}"
  tags = merge(local.tags, var.tags)
}
