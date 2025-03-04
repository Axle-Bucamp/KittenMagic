# main.tf

terraform {
  required_version = ">= 0.14.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.0"
    }
  }
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

module "ecs" {
  source = "./modules/ecs"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}

module "load_balancer" {
  source = "./modules/load_balancer"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  ecs_service_name = module.ecs.service_name
}

module "monitoring" {
  source = "./modules/monitoring"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
}