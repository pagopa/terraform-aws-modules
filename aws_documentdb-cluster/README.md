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
| [aws_docdb_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster) | resource |
| [aws_docdb_cluster_instance.instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_instance) | resource |
| [aws_docdb_cluster_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_cluster_parameter_group) | resource |
| [aws_docdb_subnet_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/docdb_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_security_group"></a> [cluster\_security\_group](#input\_cluster\_security\_group) | List of VPC security groups to associate with the Cluster | `list(string)` | n/a | yes |
| <a name="input_master_password"></a> [master\_password](#input\_master\_password) | (Required unless a snapshot\_identifier or unless a global\_cluster\_identifier is provided when the cluster is the 'secondary' cluster of a global database) Password for the master DB user | `string` | n/a | yes |
| <a name="input_master_username"></a> [master\_username](#input\_master\_username) | (Required unless a snapshot\_identifier or unless a global\_cluster\_identifier is provided when the cluster is the 'secondary' cluster of a global database) Username for the master DB user. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Cluster identifier prefix. | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Specifies whether any cluster modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | The days to retain backups for. | `number` | `5` | no |
| <a name="input_ca_cert_identifier"></a> [ca\_cert\_identifier](#input\_ca\_cert\_identifier) | Optional, identifier of the CA certificate to use for DB instance | `string` | `"rds-ca-2019"` | no |
| <a name="input_cluster_instance_class"></a> [cluster\_instance\_class](#input\_cluster\_instance\_class) | The instance class to use. | `string` | `"db.r5.large"` | no |
| <a name="input_cluster_instance_count"></a> [cluster\_instance\_count](#input\_cluster\_instance\_count) | Number of cluster instances. | `number` | `1` | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The name of the database engine to be used for this DB cluster. Only `docdb` is supported. | `string` | `"docdb"` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | The database engine version. Updating this argument results in an outage. | `string` | `"3.6.0"` | no |
| <a name="input_family"></a> [family](#input\_family) | Version of docdb family being created | `string` | `"docdb3.6"` | no |
| <a name="input_group_subnets"></a> [group\_subnets](#input\_group\_subnets) | List of subnet ids to provide a DocumentDB subnet group resource. | `list(string)` | `[]` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. | `string` | `null` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | additional parameters modified in parameter group | `list(map(any))` | `[]` | no |
| <a name="input_preferred_backup_window"></a> [preferred\_backup\_window](#input\_preferred\_backup\_window) | The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod paramete. | `string` | `"07:00-09:00"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created. | `bool` | `false` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | n/a |
| <a name="output_cluster_members"></a> [cluster\_members](#output\_cluster\_members) | n/a |
| <a name="output_cluster_resource_id"></a> [cluster\_resource\_id](#output\_cluster\_resource\_id) | n/a |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | n/a |
| <a name="output_hosted_zone_id"></a> [hosted\_zone\_id](#output\_hosted\_zone\_id) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_reader_endpoint"></a> [reader\_endpoint](#output\_reader\_endpoint) | n/a |
