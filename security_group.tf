resource "aws_security_group" "this" {
  name_prefix = "${var.git}-redis-"
  vpc_id      = var.vpc_id
  tags        = merge(local.tags, var.tags)
}

resource "aws_security_group_rule" "this" {
  description              = "ingress redis inbound rule"
  type                     = "ingress"
  protocol                 = "tcp"
  from_port                = var.redis_port
  to_port                  = var.redis_port
  security_group_id        = aws_security_group.this.id
  source_security_group_id = var.source_security_group_id
}
