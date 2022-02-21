resource "aws_elasticache_subnet_group" "this" {
  name       = format("%s-subnet-group", var.name)
  subnet_ids = var.subnets

  tags = var.tags
}

resource "aws_elasticache_replication_group" "this" {

  replication_group_id       = var.name
  description                = format("ElastiCache replication group for %s", var.name)
  num_cache_clusters         = var.redis_clusters
  node_type                  = var.redis_node_type
  automatic_failover_enabled = var.redis_failover
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  availability_zones         = var.availability_zones
  multi_az_enabled           = var.multi_az_enabled
  engine                     = "redis" # this is the only version.
  at_rest_encryption_enabled = var.at_rest_encryption_enabled
  kms_key_id                 = var.kms_key_id
  transit_encryption_enabled = var.transit_encryption_enabled
  auth_token                 = var.transit_encryption_enabled ? var.auth_token : null
  engine_version             = var.redis_version
  port                       = var.redis_port
  parameter_group_name       = aws_elasticache_parameter_group.this.id
  subnet_group_name          = aws_elasticache_subnet_group.this.id
  security_group_names       = var.security_group_names
  security_group_ids         = var.security_group_ids
  snapshot_arns              = var.snapshot_arns
  snapshot_name              = var.snapshot_name
  apply_immediately          = var.apply_immediately
  maintenance_window         = var.redis_maintenance_window
  notification_topic_arn     = var.notification_topic_arn
  snapshot_window            = var.redis_snapshot_window
  snapshot_retention_limit   = var.redis_snapshot_retention_limit
  tags                       = merge(tomap({ "Name" = var.name }), var.tags)
}


resource "aws_elasticache_parameter_group" "this" {
  name = format("%s-parameter-group", var.name)

  description = format("ElastiCache parameter group for %s", var.name)

  # Strip the patch version from redis_version var
  # #TODO make this available for mamecached too.
  family = "redis${replace(var.redis_version, "/\\.[\\d]+$/", "")}"
  dynamic "parameter" {
    for_each = var.redis_parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  lifecycle {
    create_before_destroy = true
  }
}