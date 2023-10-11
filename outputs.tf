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


#$$$$$$$$$$$$$$$$$$$$$$$$$  CIDR Output $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#$$$$$$$$$$$$$$$$$$$$$$$$$              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

output "pb_sn_az1_cidr" {
  value = var.pb_sn_az1_cidr
}

output "pb_sn_az2_cidr" {
  value = var.pb_sn_az2_cidr
}

output "pb_sn_az3_cidr" {
  value = var.pb_sn_az3_cidr
}

#------------------------------

output "pvt_sn_app_az1_cidr" {
  value = var.pvt_sn_app_az1_cidr
}

output "pvt_sn_app_az2_cidr" {
  value = var.pvt_sn_app_az2_cidr
}

output "pvt_sn_app_az3_cidr" {
  value = var.pvt_sn_app_az3_cidr
}

#------------------------------

output "pvt_sn_db_az1_cidr" {
  value = var.pvt_sn_db_az1_cidr
}

output "pvt_sn_db_az2_cidr" {
  value = var.pvt_sn_db_az2_cidr
}

output "pvt_sn_db_az3_cidr" {
  value = var.pvt_sn_db_az3_cidr
}

##################################################################################
# Subnet IDs
#################################################################################

output "pb_sn_az1_id" {
  value = aws_subnet.pb_sn_az1.id
}

output "pb_sn_az2_id" {
  value = aws_subnet.pb_sn_az2.id
}

output "pb_sn_az3_id" {
  value = aws_subnet.pb_sn_az3.id
}

#------------------------

output "pvt_sn_app_az1_id" {
  value = aws_subnet.pvt_sn_app_az1.id
}

output "pvt_sn_app_az2_id" {
  value = aws_subnet.pvt_sn_app_az2.id
}

output "pvt_sn_app_az3_id" {
  value = aws_subnet.pvt_sn_app_az3.id
}

#-----------------------

output "pvt_sn_db_az1_id" {
  value = aws_subnet.pvt_sn_db_az1.id
}

output "pvt_sn_db_az2_id" {
  value = aws_subnet.pvt_sn_db_az2.id
}

output "pvt_sn_db_az3_id" {
  value = aws_subnet.pvt_sn_db_az3.id
}

######################################################################
# RDS
######################################################################3