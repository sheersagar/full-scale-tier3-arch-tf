# Security Group 1 for pb-sn
resource "aws_security_group" "SGpublicSN" {
  name        = "${var.vpc_cidr}-public-SG"
  description = "It allows public subnet to connect with the internet"
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group 2 for pvt-sn-db<----------> pb-sn
resource "aws_security_group" "SGpvtdb" {
  name        = "${var.vpc_cidr}-pvt-dbsn-sg"
  description = "Allow MySQL in"
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.SGpublicSN.id]
  }
}

# Security Group 3 for pvt-sn-app <------------> pb-sn
resource "aws_security_group" "SGpvtapp" {
  name        = "${var.vpc_cidr}-pvt-appsn-sg"
  description = "Allow EFS in"
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.SGpublicSN.id]
  }
}

# Security group for Load balancer
resource "aws_security_group" "SGLB" {
  name        = "${var.vpc_cidr}-lb-sg"
  description = "Allow public internet in"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}