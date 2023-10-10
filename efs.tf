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
  for_each        = toset(data.aws_availability_zones.available_zones.names)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_subnet.pb_sn[each.key].id
  security_groups = [aws_security_group.SGpvtapp.id]
}