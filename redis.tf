resource "aws_elasticache_replication_group" "this" {
  replication_group_description = "Redis Replication Group"
  replication_group_id          = substr("${var.git}-${random_string.identifier.result}", 0, 40) # 40 character max length
  engine                        = "redis"
  engine_version                = var.engine_version
  maintenance_window            = var.maintenance_window
  node_type                     = var.node_type
  num_cache_clusters            = var.num_cache_clusters
  parameter_group_name          = "default.redis6.x.cluster.on"
  port                          = var.redis_port
  subnet_group_name             = aws_elasticache_subnet_group.this.name
  automatic_failover_enabled    = var.automatic_failover_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  snapshot_retention_limit      = var.snapshot_retention_limit
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  security_group_ids            = [aws_security_group.this.id]
  auth_token                    = random_password.password.result
  tags                          = merge(local.tags, var.tags)

  log_delivery_configuration {
    destination      = aws_cloudwatch_log_group.redis_slow.name
    destination_type = "cloudwatch-logs"
    log_format       = "json"
    log_type         = "slow-log"
  }
  log_delivery_configuration {
    destination      = aws_cloudwatch_log_group.redis_engine.name
    destination_type = "cloudwatch-logs"
    log_format       = "json"
    log_type         = "engine-log"
  }
}

resource "aws_elasticache_subnet_group" "this" {
  name        = "${var.git}-sg-${random_string.identifier.result}"
  description = "private subnets for the elastic cache cluster"
  subnet_ids  = var.subnet_ids
}
