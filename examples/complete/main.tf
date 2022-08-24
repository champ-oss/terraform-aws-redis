provider "aws" {
  region = "us-east-1"
}

locals {
  git = "terraform-aws-redis"
}

module "vpc" {
  source                   = "github.com/champ-oss/terraform-aws-vpc?ref=v1.0.32-86c316d"
  git                      = local.git
  availability_zones_count = 2
  retention_in_days        = 1
}

resource "aws_security_group" "test" {
  name_prefix = "test-mq-"
  vpc_id      = module.vpc.vpc_id
}

module "this" {
  source                   = "../../"
  vpc_id                   = module.vpc.vpc_id
  source_security_group_id = aws_security_group.test.id
  subnet_ids               = module.vpc.private_subnets_ids
}
