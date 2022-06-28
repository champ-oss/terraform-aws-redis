output "redis_endpoint" {
  description = "redis endpoint"
  value       = aws_elasticache_cluster.this.cache_nodes[0].address
}

output "redis_port" {
  description = "redis port"
  value       = aws_elasticache_cluster.this.cache_nodes[0].port
}