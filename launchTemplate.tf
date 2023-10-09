# Find latest Ubuntu image
data "aws_ami" "ubuntu" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"
    ]
  }
}

# Create a key pair
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "full-scale-tier3-arch"
  public_key = tls_private_key.pk.public_key_openssh
}

# Save the keys to home directory (user profile on Windows)
resource "local_sensitive_file" "private_key" {
  content  = tls_private_key.pk.private_key_pem
  filename = "~/full-scale-tier3-arch-pvt.pem"
}

resource "local_sensitive_file" "public_key" {
  content  = tls_private_key.pk.public_key_pem
  filename = "~/full-scale-tier3-arch-pub.pem"
}

#Creating a Launch Template to create EC2 Instances
resource "aws_launch_template" "ec2_launch_template" {
  name_prefix   = "EC2-TL"
  description   = "Infrastructure demo Launch Template"
  instance_type = "t2.micro"
  image_id      = data.aws_ami.ubuntu.id
  key_name      = aws_key_pair.generated_key.key_name

  credit_specification {
    cpu_credits = "standard"
  }

  # The parameter groupName cannot be used with the parameter subnet
  # Error was caused by using security_group_names and not vpc_security_group_ids
  vpc_security_group_ids = [ aws_security_group.SGpublicSN.id ]

  # Attach instance profile, _not_ role!
  iam_instance_profile {
    name = aws_iam_instance_profile.instance_profile.name
  }

  #  user_data = base64encode(file("script.sh"))
}