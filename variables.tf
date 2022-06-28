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
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster#engine_version"
  type        = string
  default     = "6.2"
}

variable "parameter_group_name" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster#parameter_group_name"
  type        = string
  default     = null
}

variable "node_type" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster#node_type"
  type        = string
  default     = "cache.t2.micro"
}

variable "maintenance_window" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster#maintenance_window"
  type        = string
  default     = "sun:07:00-sun:08:00"
}

variable "num_cache_nodes" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster#num_cache_nodes"
  type        = number
  default     = 1
}

variable "redis_port" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster#port"
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

variable "redis_family" {
  description = "https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group#family"
  default     = "redis6.x"
  type        = string
}
