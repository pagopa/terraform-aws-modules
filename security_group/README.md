## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | n/a | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The security group description. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the security group. If omitted, Terraform will assign a random, unique name | `string` | `null` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Creates a unique name beginning with the specified prefix. Conflicts with name. | `string` | `null` | no |
| <a name="input_revoke_rules_on_delete"></a> [revoke\_rules\_on\_delete](#input\_revoke\_rules\_on\_delete) | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. | `bool` | `false` | no |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | n/a | <pre>list(object({<br>    type                     = string<br>    from_port                = number<br>    description              = string<br>    to_port                  = number<br>    protocol                 = string<br>    cidr_blocks              = list(string)<br>    source_security_group_id = string<br>    self                     = bool<br>    ipv6_cidr_blocks         = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags, each pair. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | Security group arn |
| <a name="output_id"></a> [id](#output\_id) | Security group id |
