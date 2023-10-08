resource "aws_efs_file_system" "efs" {
  creation_token   = "basic-efs-file-system"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = false

  lifecycle_policy {
    transition_to_ia = "AFTER_7_DAYS"
  }

  tags = {
    Name = "MyEfsFileSystem"
  }
}


# Mounting this efs in VPC and subnets
resource "aws_efs_mount_target" "efs_mount" {
  count           = length(var.subnet_ids_pvt_sn_app)                                            # Setting 'count' argument for the aws_efs_mount_target resource and make sure that count.index is used correctly within block
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = var.subnet_ids_pvt_sn_app[count.index]
  security_groups = [aws_security_group.SGpvtapp.id]
}