output "port" {
  value = "${aws_elasticache_cluster.this.cache_nodes.0.port}"
}

output "endpoint" {
  value = "${aws_elasticache_cluster.this.cache_nodes.0.address}:6379"
}
