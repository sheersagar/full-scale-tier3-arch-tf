# Create a DB subnet group

resource "aws_db_subnet_group" "db_sn_group" {
  name        = "demo-rds-subnet-group"
  description = "RDS Subnet group for my three tier project"

  subnet_ids = var.subnet_ids_pvt_sn_db
}


# Both the Cluster and the instance are must to successfully create the rds

# Now Creating the RDS cluster using the subnet group
resource "aws_rds_cluster_instance" "rds_instance" {
  cluster_identifier = aws_rds_cluster.rds_cluster.id
  instance_class     = "db.t3.large"
  availability_zone  = data.aws_availability_zones.available_zones.names[0]
  engine             = "mysql"
}

resource "aws_rds_cluster" "rds_cluster" {
  #allocate_storage = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.34"
  db_cluster_instance_class = "db.t3.large"
  allocated_storage      =  20
  database_name          = var.initial_db_name
  master_username        = var.master_user_name
  master_password        = var.master_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.SGpvtdb.id]
  db_subnet_group_name   = aws_db_subnet_group.db_sn_group.id
  availability_zones = [
    data.aws_availability_zones.available_zones.names[0]
  ]
}