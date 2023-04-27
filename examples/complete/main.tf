provider "aws" {
  region = "us-east-2"
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


