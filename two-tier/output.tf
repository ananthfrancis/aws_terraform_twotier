output "vpc_id" {
  description = "The ID of the Instance"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "The ID of the Instance"
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "The ID of the Instance"
  value       = module.vpc.private_subnets
}

output "alb_id" {
  description = "The ID of the Instance"
  value       = module.alb.alb_id
}

output "acm_id" {
  description = "The ID of the Instance"
  value       = module.acm.acm_id
}

output "ec2_instance_id" {
  description = "The ID of the Instance"
  value       = module.ec2.instance_id
}