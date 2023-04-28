output "redis_cluster_endpoint" {
  value       = aws_elasticache_replication_group.this.configuration_endpoint_address
  description = "redis cluster endpoint"
}

output "redis_arn" {
  value       = aws_elasticache_replication_group.this.arn
  description = "redis arn"
}

output "redis_default_password" {
  value       = aws_elasticache_replication_group.this.auth_token
  sensitive   = true
  description = "redis password"
}

output "redis_port" {
  value       = aws_elasticache_replication_group.this.port
  description = "redis port"
}

output "redis_encrypted_password" {
  value       = var.enable_pw_encryption ? aws_kms_ciphertext.this[0].ciphertext_blob : null
  description = "kms encrypted password"
}

output "password_ssm_name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter#name"
  value       = aws_ssm_parameter.this.name
}

