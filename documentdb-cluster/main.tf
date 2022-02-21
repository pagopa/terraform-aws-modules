resource "aws_docdb_subnet_group" "this" {
  name_prefix = var.name
  subnet_ids  = var.group_subnets
}

resource "aws_docdb_cluster" "this" {
  cluster_identifier_prefix       = var.name
  db_subnet_group_name            = aws_docdb_subnet_group.this.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.this.name
  vpc_security_group_ids          = var.cluster_security_group
  engine                          = var.engine
  engine_version                  = var.engine_version
  master_username                 = var.master_username
  master_password                 = var.master_password
  storage_encrypted               = var.storage_encrypted
  apply_immediately               = var.apply_immediately
  kms_key_id                      = var.kms_key_id

  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  skip_final_snapshot     = var.skip_final_snapshot

  #tfsec:ignore:aws-documentdb-enable-log-export
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  tags = var.tags
}

#tfsec:ignore:aws-documentdb-encryption-customer-key
resource "aws_docdb_cluster_instance" "instances" {
  count              = var.cluster_instance_count
  identifier         = format("%s-%s", var.name, count.index)
  cluster_identifier = aws_docdb_cluster.this.id
  instance_class     = var.cluster_instance_class
  ca_cert_identifier = var.ca_cert_identifier

  tags = var.tags
}

resource "aws_docdb_cluster_parameter_group" "this" {
  family      = var.family
  name_prefix = var.name
  description = format("${var.name} docdb cluster parameter group", var.name)
  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = var.tags
}