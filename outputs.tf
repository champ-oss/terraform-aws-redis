output "redis_endpoint" {
  desciption = "redis endpoint"
  value      = aws_elasticache_cluster.this.cache_nodes[0].address
}

output "redis_port" {
  desciption = "redis port"
  value      = aws_elasticache_cluster.this.cache_nodes[0].port
}