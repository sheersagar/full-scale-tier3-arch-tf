
# Creating an Auto-Scaling group
resource "aws_autoscaling_group" "asg_demo" {
  name = "demo-asg"
  min_size                  = 1
  max_size                  = 3
  desired_capacity          = 1


launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }



  vpc_zone_identifier       = [
    aws_subnet.pb_sn_az1.id,
    aws_subnet.pb_sn_az2.id,
    aws_subnet.pb_sn_az3.id
    ]

  target_group_arns         = [aws_lb_target_group.ec2.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 300

  # ASG Dependencies
    # Ensure EFS and RDS is created first
  depends_on = [
    aws_ssm_parameter.rds_endpoint,
    aws_ssm_parameter.efs_parameter
   ]
}