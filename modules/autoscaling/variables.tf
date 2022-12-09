variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  type = map
  default = {
    us-east-1    = "ami-0b0dcb5067f052a63"
  }
}

variable "key_name" {
  type    = string
  default = "ec2-demo"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnets" {
  type    = list(string)
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1b","us-east-1c","us-east-1d"]
}

variable "security_group_id" {
  type    = string
  default = "sg-53623a20"
}

# variable "instance_type" {
#   type    = string
#   default = "t2.micro"
# }

## ASG

variable "max_size" {
  type    = number
  default = 3
}

variable "min_size" {
  type    = number
  default = 1
}

variable "health_check_grace_period" {
  type    = number
  default = 300
}

variable "desired_capacity" {
  type    = number
  default = 1
}

variable "availability_zones" {
  type    = list(string)
}

# variable "subnets" {
#   type    = list(string)
# }



