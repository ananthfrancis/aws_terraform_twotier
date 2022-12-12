# provider "aws" {
#   region = local.region
# }

locals {
  region = "us-east-1"

  tags = {
    Project = "MyProject"
    Author = "Terraform"
  }
}

################################################################################
# VPC Module
################################################################################

module "vpc" {
  source = "../modules/vpc/"

  name = "MyProject"
  cidr = "10.2.0.0/16"

  azs             = ["${local.region}b", "${local.region}c", "${local.region}d"]
  private_subnets = ["10.2.0.0/24", "10.2.1.0/24", "10.2.2.0/24"]
  public_subnets  = ["10.2.3.0/24", "10.2.4.0/24", "10.2.5.0/24"]


  enable_nat_gateway = false
  single_nat_gateway = true

  # public_subnet_tags = {
  #   Name = "MyProjectPublicSubnet"
  # }

  public_access_port=443
  instance_access_port=8080

  # tags = local.tags
  vpc_tags = {
    Name = "MyProjectVPC"
  }
}

################################################################################
# ALB Module
################################################################################
module "alb" {
  source = "../modules/alb/"
  alb_name = "MyProjectALB"
  security_group_ids = [module.vpc.sg_public_id]
  subnets = module.vpc.public_subnets
  cross_zone_load_balancing = true
  lb_port = "443"
  lb_protocol = "HTTPS"
  instance_port = "8080"
  instance_protocol = "HTTP"
  vpc_id=module.vpc.vpc_id
  instance_id=module.ec2.instance_id
  acm_arn=module.acm.acm_arn
  domain_name = "test.aadhanejournal.com"
  root_domain_name="aadhanejournal.com"
}

################################################################################
# ACM Module
################################################################################
module "acm" {
  source = "../modules/acm/"
  root_domain_name="aadhanejournal.com"
  acm_domain_name="*.aadhanejournal.com"
}

################################################################################
# ACM Module
################################################################################
module "ec2" {
  source = "../modules/ec2/"
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  subnet_id = module.vpc.private_subnets[0]
  az = "us-east-1b"
  ec2_name = "MyProjectEC2"
  security_group_ids = [module.vpc.sg_private_id]
  key_name  = "GrowingTrust"
}
