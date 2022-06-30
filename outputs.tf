output "redis_primary_endpoint_address" {
  value       = aws_elasticache_replication_group.this.primary_endpoint_address
  description = "redis endpoint"
}

output "redis_arn" {
  value       = aws_elasticache_replication_group.this.arn
  description = "redis arn"
}

output "redis_default_password" {
  value       = random_password.password.result
  sensitive   = true
  description = "redis password"
}

output "redis_port" {
  value       = aws_elasticache_replication_group.this.port
  description = "redis port"
}
