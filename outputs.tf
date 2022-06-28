output "port" {
  value = "${aws_elasticache_cluster.this.cache_nodes.0.port}"
}

output "endpoint" {
  value = "${join(":", list(aws_elasticache_cluster.this.cache_nodes.0.address, aws_elasticache_cluster.this.cache_nodes.0.port))}"
}
