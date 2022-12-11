provider "aws" {
  profile = var.profile
  region = local.region
  default_tags {
   tags = {
        Project = "MyProject"
        Author  = "Terraform"
   }
 }
}