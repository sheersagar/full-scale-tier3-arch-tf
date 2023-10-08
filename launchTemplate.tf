#Creating a Launch Template to create EC2 Instances
resource "aws_launch_template" "ec2_launch_template" {
  name_prefix   = "EC2-TL"
  description   = "Infrastructure demo Launch Template"
  instance_type = "t2.micro"
  image_id      = var.ubuntu_ami
  key_name      = "k8"

  credit_specification {
    cpu_credits = "standard"
  }

  security_group_names = [aws_security_group.SGpublicSN.id]

  iam_instance_profile {
    name = aws_iam_role.ec2_instance_role.name
  }

  user_data = base64encode(file("script.sh"))
}