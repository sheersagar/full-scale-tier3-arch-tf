variable "region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "internet_gateway_id" {
  type = string
}

############################################################################
# Cidr for subnets
############################################################################

variable "pb_sn_az1_cidr" {}
variable "pb_sn_az2_cidr" {}
variable "pb_sn_az3_cidr" {}

variable "pvt_sn_app_az1_cidr" {}
variable "pvt_sn_app_az2_cidr" {}
variable "pvt_sn_app_az3_cidr" {}

variable "pvt_sn_db_az1_cidr" {}
variable "pvt_sn_db_az2_cidr" {}
variable "pvt_sn_db_az3_cidr" {}


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

##############################################################################
# Subnet IDs
##############################################################################

variable "subnet_ids_pb_sn" {
  type    = list(string)
  default = [ ]
}
variable "subnet_ids_pvt_sn_app" {
  type    = list(string)
  default = [ ]
}
variable "subnet_ids_pvt_sn_db" {
  type    = list(string)
  default = [  ]
}

#############################################################################
# RDS Related
#############################################################################

variable "rds_cluster_endpoint" {
  description = "rds_cluster_endpoint"
  type        = string
}

#############################################################################
# AMI Image
#############################################################################
variable "ubuntu_ami" {}

