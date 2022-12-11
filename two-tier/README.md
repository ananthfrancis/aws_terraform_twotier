<!-- BEGIN_TF_DOCS -->

## IaC code for setting an Infrastructure required for hosting Wordpress application.

## How to Execute
Please follow the below steps to run.
- Change directory to two-tier 
   `cd two-tier`
- Ensure aws cli installed and note down which profile you want to use.
- Please run `terraform init`
- Please run `terraform apply -var 'profile=default'` to apply your changes. 

## Profile Customization
If you dont pass any profile value in terraform apply, it will use the terraform profile as a default one.
If you want to pass any specific profile value, you can pass it like `-var 'profile=default'` in terraform apply command.

## Output
In end of terraform apply command, it will output the below values.
- vpc_id
- private_subnet_ids
- public_subnet_ids
- acm_id
- alb_id
- ec2_instance_id

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.73 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | ../modules/alb/ | n/a |
| <a name="module_asg"></a> [asg](#module\_asg) | ../modules/autoscaling/ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/vpc/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | The Name of the VPC | `string` | `"abc"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->