variable "git" {
  description = "Name of the Git repo"
  type        = string
  default     = "terraform-aws-redis"
}

variable "tags" {
  description = "Tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "engine_version" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#engine_version"
  type        = string
  default     = "7.x"
}

variable "parameter_group_name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#engine_version"
  type        = string
  default     = "default.redis7.cluster.on"
}

variable "node_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#node_type"
  type        = string
  default     = "cache.t2.micro"
}

variable "maintenance_window" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#maintenance_window"
  type        = string
  default     = "sun:07:00-sun:08:00"
}

variable "num_cache_clusters" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#num_cache_clusters"
  type        = number
  default     = 2 # must be greater than 1. Must be enabled for Redis
}

variable "redis_port" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#port"
  type        = number
  default     = 6379
}

variable "vpc_id" {
  type        = string
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id"
}

variable "source_security_group_id" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#source_security_group_id"
  default     = ""
  type        = string
}

variable "subnet_ids" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group#subnet_ids"
  default     = []
  type        = list(string)
}

variable "transit_encryption_enabled" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#transit_encryption_enabled"
  type        = bool
  default     = true
}

variable "automatic_failover_enabled" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#automatic_failover_enabled"
  type        = bool
  default     = true
}

variable "snapshot_retention_limit" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#snapshot_retention_limit"
  type        = number
  default     = 0
}

variable "at_rest_encryption_enabled" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#at_rest_encryption_enabled"
  type        = bool
  default     = true
}

variable "enable_pw_encryption" {
  description = "enable kms password encryption"
  type        = bool
  default     = false
}
