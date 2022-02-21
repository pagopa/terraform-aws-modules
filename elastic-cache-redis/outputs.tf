output "parameter_group_id" {
  value = aws_elasticache_parameter_group.this.id
}

output "redis_subnet_group_name" {
  value = aws_elasticache_subnet_group.this.name
}

output "id" {
  value = aws_elasticache_replication_group.this.id
}

output "port" {
  value = var.redis_port
}

output "endpoint" {
  value = aws_elasticache_replication_group.this.primary_endpoint_address
}