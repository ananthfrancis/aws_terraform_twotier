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
| <a name="module_acm"></a> [acm](#module\_acm) | ../modules/acm/ | n/a |
| <a name="module_alb"></a> [alb](#module\_alb) | ../modules/alb/ | n/a |
| <a name="module_ec2"></a> [ec2](#module\_ec2) | ../modules/ec2/ | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ../modules/vpc/ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_profile"></a> [profile](#input\_profile) | Profile name | `string` | `"terraform"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_id"></a> [acm\_id](#output\_acm\_id) | The ID of the Instance |
| <a name="output_alb_id"></a> [alb\_id](#output\_alb\_id) | The ID of the Instance |
| <a name="output_ec2_instance_id"></a> [ec2\_instance\_id](#output\_ec2\_instance\_id) | The ID of the Instance |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | The ID of the Instance |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | The ID of the Instance |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the Instance |

<!-- END_TF_DOCS -->