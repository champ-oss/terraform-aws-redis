output "reddis_endpoint" {
  description = "reddis endpoint"
  value       = "${aws_elasticache_cluster.this.cache_nodes.0.address}:6379"
}
