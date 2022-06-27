resource "aws_elasticache_cluster" "this" {
  cluster_id           = "redis-${var.git}"
  engine               = "redis"
  engine_version       = var.engine_version
  maintenance_window   = var.maintenance_window
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.redis_port
  subnet_group_name    = aws_elasticache_subnet_group.this.name
  security_group_ids   = ["${aws_security_group.this.id}"]
  tags                 = merge(local.tags, var.tags)
}

resource "aws_elasticache_subnet_group" "this" {
  name        = "${var.git}-sg-${random_string.identifier.result}"
  description = "private subnets for the elastic cache cluster"
  subnet_ids  = var.subnet_ids
}
