variable "group_subnets" {
  type        = list(string)
  description = "List of subnet ids to provide a DocumentDB subnet group resource."
  default     = []
}

variable "cluster_security_group" {
  type        = list(string)
  description = "List of VPC security groups to associate with the Cluster"
}

variable "master_password" {
  type        = string
  description = "(Required unless a snapshot_identifier or unless a global_cluster_identifier is provided when the cluster is the 'secondary' cluster of a global database) Password for the master DB user"
}

variable "master_username" {
  type        = string
  description = "(Required unless a snapshot_identifier or unless a global_cluster_identifier is provided when the cluster is the 'secondary' cluster of a global database) Username for the master DB user."
}

# https://docs.aws.amazon.com/documentdb/latest/developerguide/db-cluster-manage-performance.html#db-cluster-manage-scaling-instance
variable "cluster_instance_class" {
  type        = string
  default     = "db.r5.large"
  description = "The instance class to use."
}

variable "cluster_instance_count" {
  type        = number
  default     = 1
  description = "Number of cluster instances."
}

variable "name" {
  type        = string
  description = "Cluster identifier prefix."
}

variable "backup_retention_period" {
  default     = 5
  type        = number
  description = "The days to retain backups for."
}

variable "preferred_backup_window" {
  default     = "07:00-09:00"
  type        = string
  description = "The daily time range during which automated backups are created if automated backups are enabled using the BackupRetentionPeriod paramete."
}

variable "skip_final_snapshot" {
  default     = false
  type        = bool
  description = "Determines whether a final DB snapshot is created before the DB cluster is deleted. If true is specified, no DB snapshot is created."
}

variable "storage_encrypted" {
  default     = true
  type        = bool
  description = "Specifies whether the DB cluster is encrypted."
}

variable "kms_key_id" {
  type        = string
  description = "The ARN for the KMS encryption key."
  default     = null
}

variable "parameters" {
  description = "additional parameters modified in parameter group"
  type        = list(map(any))
  default     = []
}

variable "apply_immediately" {
  default     = false
  description = "Specifies whether any cluster modifications are applied immediately, or during the next maintenance window."
  type        = bool
}

variable "ca_cert_identifier" {
  default     = "rds-ca-2019"
  description = "Optional, identifier of the CA certificate to use for DB instance"
  type        = string
}

variable "family" {
  default     = "docdb3.6"
  description = "Version of docdb family being created"
  type        = string
}

variable "engine" {
  default     = "docdb"
  description = "The name of the database engine to be used for this DB cluster. Only `docdb` is supported."
  type        = string
}

variable "engine_version" {
  default     = "3.6.0"
  description = "The database engine version. Updating this argument results in an outage."
  type        = string
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  default     = []
  description = "List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: audit, profiler."
}

variable "tags" {
  type = map(any)
}