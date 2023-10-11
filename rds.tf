# Create a DB subnet group

resource "aws_db_subnet_group" "db_sn_group" {
  name        = "demo-rds-subnet-group"
  description = "RDS Subnet group for my three tier project"

  subnet_ids = [
    aws_subnet.pvt_sn_db_az1.id,
    aws_subnet.pvt_sn_db_az2.id,
    aws_subnet.pvt_sn_db_az3.id
  ]
}


# Both the Cluster and the instance are must to successfully create the rds

# Now Creating the RDS cluster using the subnet group
resource "aws_db_instance" "rds_cluster" {
  allocated_storage = 20
  db_subnet_group_name = aws_db_subnet_group.db_sn_group.id
  engine = "mysql"
  engine_version = "8.0.34"
  instance_class = "db.t2.micro"
  db_name = var.initial_db_name
  username = var.master_user_name
  password = var.master_password
  skip_final_snapshot = true
  multi_az = true 
  storage_type = "gp3"
  
}

#resource "aws_rds_cluster" "rds_cluster" {
  #allocate_storage = 20
#  storage_type           = "gp2"
#  engine                 = "mysql"
#  engine_version         = "8.0.34"
#  db_cluster_instance_class = "db.t3.large"
#  allocated_storage      =  20
#  database_name          = var.initial_db_name
#  master_username        = var.master_user_name
#  master_password        = var.master_password
#  skip_final_snapshot    = true
#  vpc_security_group_ids = [aws_security_group.SGpvtdb.id]
#  db_subnet_group_name   = aws_db_subnet_group.db_sn_group.id
#  availability_zones = [
#    data.aws_availability_zones.available_zones.names[0]
#  ]
#}