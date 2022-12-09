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
}

variable "security_group_ids" {
    type = any
}
