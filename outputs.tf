output "subnet_ids" {
  description = "join elastic cache subnet ids"
  value       = join("", aws_elasticache_subnet_group.this[*].subnet_ids)
}
