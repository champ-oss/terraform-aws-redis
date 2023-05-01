output "cloudwatch_log_group" {
  description = "alarm name output"
  value       = module.lambda.cloudwatch_log_group
}