variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "internet_gateway_id" {
  type = string
}


#############################################################################
# IAM Policies
#############################################################################

variable "cloud_watch_policy" {}
variable "ssm_full_access" {}
variable "efs_full_access" {}

#############################################################################
# Parameter Store variable
#############################################################################

variable "master_user_name" {}
variable "master_password" {}
variable "initial_db_name" {}

#############################################################################
# RDS Related
#############################################################################

variable "rds_cluster_endpoint" {
  description = "rds_cluster_endpoint"
  type        = string
}
