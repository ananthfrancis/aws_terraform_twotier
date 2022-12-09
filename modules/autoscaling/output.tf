output "autoscaling_group_id" {
  description = "List of IDs of private subnets"
  value       = aws_autoscaling_group.this.id
}