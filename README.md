# terraform-aws-redis

Summary: terraform module for aws redis

![ci](https://github.com/conventional-changelog/standard-version/workflows/ci/badge.svg)
[![version](https://img.shields.io/badge/version-1.x-yellow.svg)](https://semver.org)

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Features](#Features)
* [Usage](#usage)
* [Requirements](#Requirements)
* [Providers](#Providers)
* [Modules](#Modules)
* [Resources](#Resources)
* [Inputs](#Inputs)
* [Outputs](#Outputs)
* [Project Status](#project-status)

## General Information
- deploy several resources to support aws redis

## Technologies Used
- terraform
- github actions

## Features

* deploy redis to given subnet group
* security group created for ingress connection

## Usage

* look at examples/complete/main.tf for usage

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.redis_engine](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_log_group.redis_slow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_elasticache_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_ssm_parameter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_string.identifier](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_at_rest_encryption_enabled"></a> [at\_rest\_encryption\_enabled](#input\_at\_rest\_encryption\_enabled) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#at_rest_encryption_enabled | `bool` | `true` | no |
| <a name="input_automatic_failover_enabled"></a> [automatic\_failover\_enabled](#input\_automatic\_failover\_enabled) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#automatic_failover_enabled | `bool` | `true` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#engine_version | `string` | `"6.2"` | no |
| <a name="input_git"></a> [git](#input\_git) | Name of the Git repo | `string` | `"terraform-aws-redis"` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#maintenance_window | `string` | `"sun:07:00-sun:08:00"` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#node_type | `string` | `"cache.t2.micro"` | no |
| <a name="input_num_cache_clusters"></a> [num\_cache\_clusters](#input\_num\_cache\_clusters) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#num_cache_clusters | `number` | `2` | no |
| <a name="input_redis_family"></a> [redis\_family](#input\_redis\_family) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group#family | `string` | `"redis6.x"` | no |
| <a name="input_redis_port"></a> [redis\_port](#input\_redis\_port) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#port | `number` | `6379` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#snapshot_retention_limit | `number` | `0` | no |
| <a name="input_source_security_group_id"></a> [source\_security\_group\_id](#input\_source\_security\_group\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule#source_security_group_id | `string` | `""` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group#subnet_ids | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to resources | `map(string)` | `{}` | no |
| <a name="input_transit_encryption_enabled"></a> [transit\_encryption\_enabled](#input\_transit\_encryption\_enabled) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group#transit_encryption_enabled | `bool` | `true` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group#vpc_id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_arn"></a> [redis\_arn](#output\_redis\_arn) | redis arn |
| <a name="output_redis_default_password"></a> [redis\_default\_password](#output\_redis\_default\_password) | redis password |
| <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port) | redis port |
| <a name="output_redis_primary_endpoint_address"></a> [redis\_primary\_endpoint\_address](#output\_redis\_primary\_endpoint\_address) | redis endpoint |
<!-- END_TF_DOCS -->


## Project Status
Project is: _in_progress_ 