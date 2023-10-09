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
