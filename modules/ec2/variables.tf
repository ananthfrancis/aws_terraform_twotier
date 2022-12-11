variable "ami" {
  type    = string
}
variable "instance_type" {
  type    = string
}
variable "az" {
  type    = string
}
variable "subnet_id" {
  type    = string
}

variable "tags" {
    type = any
    default = {}
}

variable "security_group_ids" {
    type = any
}

variable "ec2_name" {
  type    = string
}
