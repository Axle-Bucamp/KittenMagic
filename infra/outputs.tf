# outputs.tf

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value       = module.vpc.subnet_ids
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  value       = module.ecs.cluster_name
}

output "ecs_service_name" {
  description = "The name of the ECS service"
  value       = module.ecs.service_name
}

output "load_balancer_dns" {
  description = "The DNS name of the load balancer"
  value       = module.load_balancer.dns_name
}

output "prometheus_endpoint" {
  description = "The endpoint for Prometheus"
  value       = module.monitoring.prometheus_endpoint
}

output "grafana_endpoint" {
  description = "The endpoint for Grafana"
  value       = module.monitoring.grafana_endpoint
}