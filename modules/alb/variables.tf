
variable "alb_name" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "security_group_ids" {
  description = "Suffix to append to public subnets name"
  type        = list(string)
}

variable "subnets" {
  description = "Suffix to append to private subnets name"
  type        = list(string)
}


variable "cross_zone_load_balancing" {
  description = "A tenancy option for instances launched into the VPC"
  type        = bool
}

variable "lb_port" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "lb_protocol" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

variable "instance_port" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "instance_protocol" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

variable "vpc_id" {
  description = "Suffix to append to public subnets name"
  type        = string
}

variable "instance_id" {
  description = "Suffix to append to public subnets name"
  type        = string
}

variable "acm_arn" {
  description = "Suffix to append to private subnets name"
  type        = string
}

# variable "zone_id" {
#   description = "Suffix to append to private subnets name"
#   type        = string
# }

variable "root_domain_name" {
  description = "Suffix to append to private subnets name"
  type        = string
}

variable "domain_name" {
  description = "Suffix to append to private subnets name"
  type        = string
}