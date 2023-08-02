provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {}
}

data "aws_vpcs" "this" {
  tags = {
    purpose = "vega"
  }
}

data "aws_subnets" "private" {
  tags = {
    purpose = "vega"
    Type    = "Private"
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.this.ids[0]]
  }
}

resource "aws_security_group" "test" {
  name_prefix = "test-redis-"
  vpc_id      = data.aws_vpcs.this.ids[0]
}

module "this" {
  source                   = "../../"
  vpc_id                   = data.aws_vpcs.this.ids[0]
  source_security_group_id = aws_security_group.test.id
  subnet_ids               = data.aws_subnets.private.ids
  parameter_group_name     = aws_elasticache_parameter_group.this.name
}

resource "aws_elasticache_parameter_group" "this" {
  name        = "test-redis-${random_string.this.result}"
  family      = "redis6.x"
  description = "Redis default cluster parameter group"

  parameter {
    name  = "cluster-enabled"
    value = "yes"
  }
}

resource "random_string" "this" {
  length  = 5
  special = false
  upper   = false
  lower   = true
  number  = true
}

module "lambda" {
  source              = "github.com/champ-oss/terraform-aws-lambda.git?ref=v1.0.115-77403a9"
  git                 = "terraform-aws-redis-client"
  name                = "redis-client-${random_string.this.result}"
  description         = "redis client lambda function"
  enable_cw_event     = true
  schedule_expression = "rate(1 minute)"
  enable_vpc          = true
  private_subnet_ids  = data.aws_subnets.private.ids
  sync_image          = true
  sync_source_repo    = "champtitles/redis-client"
  ecr_name            = "redis-client-${random_string.this.result}"
  ecr_tag             = module.hash.hash
  timeout             = 60
  vpc_id              = data.aws_vpcs.this.ids[0]
  environment = {
    "REDIS_HOST" = module.this.redis_cluster_endpoint,
    "REDIS_PORT" = module.this.redis_port,
    "REDIS_AUTH" = module.this.redis_default_password
  }
}

module "hash" {
  source   = "github.com/champ-oss/terraform-git-hash.git?ref=v1.0.13-ffd1b7d"
  path     = "${path.module}/../.."
  fallback = ""
}
