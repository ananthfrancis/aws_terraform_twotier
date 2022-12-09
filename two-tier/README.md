<!-- BEGIN_TF_DOCS -->
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