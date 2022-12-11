variable "ami" {
  description = "AMI ID to be used for creating EC2 instance"
  type    = string
}
variable "instance_type" {
  description = "Instance type for EC2 instance"
  type    = string
}
variable "az" {
  description = "Availability Zone"
  type    = string
}
variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type    = string
}

variable "tags" {
    type = any
    default = {}
}

variable "security_group_ids" {
    description = "Security Group ID for the EC2 instance"
    type = any
}

variable "ec2_name" {
  description = "Name of the ec2 instance"
  type    = string
}
