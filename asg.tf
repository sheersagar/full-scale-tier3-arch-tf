
# Creating an Auto-Scaling group
resource "aws_autoscaling_group" "asg_demo" {
  name             = "demo-asg"
  min_size         = 1
  max_size         = 3
  desired_capacity = 1


  launch_template {
    id      = aws_launch_template.ec2_launch_template.id
    version = "$Latest"
  }

  vpc_zone_identifier = [
    for s in aws_subnet.pvt_sn_db : s.id
  ]

  #target_group_arns         = [aws_lb_target_group.ec2.arn]
  health_check_type         = "EC2"
  health_check_grace_period = 300
  
}