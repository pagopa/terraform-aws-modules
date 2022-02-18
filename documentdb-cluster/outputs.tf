output "arn" {
  value = aws_docdb_cluster.this.arn
}

output "cluster_members" {
  value = aws_docdb_cluster.this.cluster_members
}

output "cluster_resource_id" {
  value = aws_docdb_cluster.this.cluster_resource_id
}

output "endpoint" {
  value = aws_docdb_cluster.this.endpoint
}

output "hosted_zone_id" {
  value = aws_docdb_cluster.this.hosted_zone_id
}

output "id" {
  value = aws_docdb_cluster.this.id
}

output "reader_endpoint" {
  value = aws_docdb_cluster.this.reader_endpoint
}