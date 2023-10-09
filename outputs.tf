output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "internet_gateway" {
  value = var.internet_gateway_id
}


# #$$$$$$$$$$$$$$$$$$$$$$$$$  CIDR Output $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
# #$$$$$$$$$$$$$$$$$$$$$$$$$              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

output "pb_sn_cidr" {
  value = [for s in aws_subnet.pb_sn : s.cidr_block]
}

# #------------------------------

output "pvt_sn" {
  value = [for s in aws_subnet.pvt_sn_app : s.cidr_block]
}

# #------------------------------

output "pvt_sn_db" {
  value = [for s in aws_subnet.pvt_sn_db : s.cidr_block]
}

# ##################################################################################
# # Subnet IDs
# #################################################################################

output "pb_sn_az1_id" {
  value = [for s in aws_subnet.pb_sn : s.id]
}

#------------------------

output "pvt_sn_app_id" {
  value = [for s in aws_subnet.pvt_sn_app : s.id]
}

#-----------------------

output "pvt_sn_db_id" {
  value = [for s in aws_subnet.pvt_sn_db : s.id]
}


# ######################################################################
# # RDS
# ######################################################################3

output "aws_db_instance" {
  value = aws_db_instance.rds_cluster.endpoint
}