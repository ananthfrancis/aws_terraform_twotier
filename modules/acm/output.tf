output "acm_arn" {
  description = "The ID of the Instance"
  value       = aws_acm_certificate.this.arn
}

output "acm_id" {
  description = "The ID of the Instance"
  value       = aws_acm_certificate.this.id
}