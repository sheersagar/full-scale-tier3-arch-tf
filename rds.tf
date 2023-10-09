# Create a DB subnet group

resource "aws_db_subnet_group" "db_sn_group" {
  name        = "demo-rds-subnet-group"
  description = "RDS Subnet group for my three tier project"

  subnet_ids = [
    for s in aws_subnet.pvt_sn_db : s.id
  ]
}

resource "aws_db_instance" "rds_cluster" {
  allocated_storage    = 20
  db_subnet_group_name = aws_db_subnet_group.db_sn_group.id
  engine               = "mysql"
  engine_version       = "8.0.34"
  instance_class       = "db.t3.large"
  db_name              = var.initial_db_name
  username             = var.master_user_name
  password             = var.master_password
  skip_final_snapshot  = true
  multi_az             = true
  storage_type         = "gp3"
}

# # Both the Cluster and the instance are must to successfully create the rds

# # Now Creating the RDS cluster using the subnet group
# resource "aws_rds_cluster_instance" "rds_instance" {
#   cluster_identifier = aws_rds_cluster.rds_cluster.id
#   instance_class     = aws_rds_cluster.rds_cluster.db_cluster_instance_class
# #  availability_zone  = data.aws_availability_zones.available_zones.names[0]
#   engine             = aws_rds_cluster.rds_cluster.engine
# }

# # aws_rds_cluster creates an Aurora cluster, so we have to specify aurora engine
# # To find what engine versions for what instance types are supported, run the following AWS CLI command
# #
# # aws rds describe-orderable-db-instance-options --engine aurora-mysql  --query "OrderableDBInstanceOptions[].{DBInstanceClass:DBInstanceClass,EngineVersion:EngineVersion,SupportedEngineModes:SupportedEngineModes[0]}" --output table --region us-east-1

# resource "aws_rds_cluster" "rds_cluster" {
#   storage_type           = "gp2"
#   engine                 = "mysql"
#   engine_version         = "8.0.mysql_aurora.3.01.1"
#   db_cluster_instance_class = "db.t3.large"
#   allocated_storage      =  20
#   database_name          = var.initial_db_name
#   master_username        = var.master_user_name
#   master_password        = var.master_password
#   skip_final_snapshot    = true
#   vpc_security_group_ids = [aws_security_group.SGpvtdb.id]
#   db_subnet_group_name   = aws_db_subnet_group.db_sn_group.id
#   # Don't need availability_zones. Will be deduced from
#   # availability_zones = [
#   #   for n in data.aws_availability_zones.available_zones.names : n
#   # ]
# }