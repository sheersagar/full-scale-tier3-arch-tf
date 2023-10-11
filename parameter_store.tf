# Creating Parameter for different resource configureation


resource "aws_ssm_parameter" "efs_parameter" {
  name        = "/Infrastructure/Demo/EFSID"
  description = "EFS ID parameter"
  type        = "String"
  value       = aws_efs_file_system.efs.id

  depends_on = [aws_efs_file_system.efs]
}

# Creating Parameter for RDS Credentials
resource "aws_ssm_parameter" "rds_parameter_db_user" {
  name        = "/Infrastructure/Demo/DBUser"
  description = "Database User"
  type        = "String"
  value       = var.master_user_name # This will be used in RDS Master Username
}

# Creating Parameter for DB User Password
resource "aws_ssm_parameter" "rds_parameter_db_userPass" {
  name        = "/Infrastructure/Demo/DBPassword"
  description = "Database DB Password"
  type        = "SecureString"
  value       = var.master_password # This will be used in RDS Master Password
}

# Creating DB Name
resource "aws_ssm_parameter" "rds_parameter_db_name" {
  name        = "/Infrastructure/Demo/DBName"
  description = "Database Name"
  type        = "String"
  value       = var.initial_db_name # Used in Additional setting to set up Initial database name
}

# Creating Endpoint Parameter for RDS Database to get connected
resource "aws_ssm_parameter" "rds_endpoint" {
  name        = "/Infrastructure/Demo/DBEndpoint"
  description = "The Endpoint of the rds data base"
  type        = "String"
  value       = aws_db_instance.rds_cluster.endpoint
}

# Creating parameter for EFS FSID
resource "aws_ssm_parameter" "efs_fs_id" {
  name        = "/Infrastructure/Demo/EFSFSID"
  description = "EFS FS ID for wordpress website"
  type        = "String"
  value       = aws_efs_file_system.efs.id
}

# Creating parameter for ALB dns name 
resource "aws_ssm_parameter" "alb_dns" {
  name        = "/Infrastructure/Demo/ALBDNSName"
  description = "DNS name of ALB"
  type        = "String"
  value       = aws_lb.lb.dns_name # DNS Name of ALB created
}