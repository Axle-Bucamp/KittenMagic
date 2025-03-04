# outputs.tf

output "vpc_id" {
  description = "ID of the created VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "IDs of the created subnets"
  value       = module.vpc.subnet_ids
}

output "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = module.ecs.service_name
}

output "alb_dns_name" {
  description = "DNS name of the load balancer"
  value       = module.load_balancer.alb_dns_name
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group"
  value       = module.monitoring.log_group_name
}