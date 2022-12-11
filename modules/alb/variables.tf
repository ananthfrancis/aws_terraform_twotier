
variable "alb_name" {
  description = "ALB Name"
  type        = string
  default     = "default"
}

variable "security_group_ids" {
  description = "Security Group IDs"
  type        = list(string)
}

variable "subnets" {
  description = "List of Subnet IDs where the ALB will be provisioned"
  type        = list(string)
}


variable "cross_zone_load_balancing" {
  description = "Cross zone load balancing required or not"
  type        = bool
}

variable "lb_port" {
  description = "LB port number"
  type        = string
  default     = "public"
}

variable "lb_protocol" {
  description = "LB Protocol. Only HTTP or HTTPS allowed"
  type        = string
  default     = "private"
}

variable "instance_port" {
  description = "Instance Port number"
  type        = string
  default     = "public"
}

variable "instance_protocol" {
  description = "Instance Protocol. Only HTTP or HTTPS allowed"
  type        = string
  default     = "private"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "instance_id" {
  description = "Instance ID value"
  type        = string
}

variable "acm_arn" {
  description = "ACM arn value to be used in HTTPS listener of ALB"
  type        = string
}

variable "root_domain_name" {
  description = "root domain name to be used for configuring route53 record"
  type        = string
}

variable "domain_name" {
  description = "subdomain record to be created in the public hosted zone"
  type        = string
}