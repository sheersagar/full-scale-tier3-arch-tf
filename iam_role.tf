# Creating role to be assumed by our EC_2 instances
resource "aws_iam_role" "ec2_instance_role" {
  name = "PB-SN-EC2-ROLE"

  # The actual policy in json
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}


# Creating Profile (Which will attach role)
resource "aws_iam_instance_profile" "instance_profile" {
  name_prefix = "PB-SN-EC2-Profile"
  role = aws_iam_role.ec2_instance_role.name
}



# ATTACHING POLICIES TO EC2_INSTANCE ROLE

resource "aws_iam_policy_attachment" "cloud_watch_policy" {
  name       = "cloud-watch-policy-attachement"
  policy_arn = var.cloud_watch_policy
  roles      = [aws_iam_role.ec2_instance_role.id]
}

resource "aws_iam_policy_attachment" "ssm_full_access" {
  name       = "ssm-full-access-policy-attachement"
  policy_arn = var.ssm_full_access
  roles      = [aws_iam_role.ec2_instance_role.id]
}

resource "aws_iam_policy_attachment" "efs_full_access" {
  name       = "efs-full-access-policy-attachement"
  policy_arn = var.efs_full_access
  roles      = [aws_iam_role.ec2_instance_role.id]
}