
# Use data source to get all availability zones in region
data "aws_availability_zones" "available_zones" {}



#############################Public Subnet##################################
#############################             ##################################


# Creating public subnet in AZ1
resource "aws_subnet" "pb_sn_az1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pb_sn_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pb-sn-az1"
  }
}

# Creating public subnet in AZ2
resource "aws_subnet" "pb_sn_az2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pb_sn_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "pb-sn-az2"
  }
}


# creating public subnet in AZ3
resource "aws_subnet" "pb_sn_az3" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pb_sn_az3_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = true

  tags = {
    Name = "pb-sn-az3"
  }
}







########################App Private Subnet##################################
########################                  ##################################

# Creating Private app subnet in AZ1
resource "aws_subnet" "pvt_sn_app_az1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pvt_sn_app_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-sn-az1"
  }
}

# Creating Private app subnet in AZ2
resource "aws_subnet" "pvt_sn_app_az2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pvt_sn_app_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-sn-az2"
  }
}


# creating private app subnet in AZ3
resource "aws_subnet" "pvt_sn_app_az3" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pvt_sn_app_az3_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-sn-az3"
  }
}


#---------------------------------------------------------------

############################DB Private Subnet##############################
############################                 ##############################

# creating private db subnet in AZ1
resource "aws_subnet" "pvt_sn_db_az1" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pvt_sn_db_az1_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-db-az1"
  }
}

# creating private db subnet in AZ2
resource "aws_subnet" "pvt_sn_db_az2" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pvt_sn_db_az2_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-db-az2"
  }
}

# creating private db subnet in AZ3
resource "aws_subnet" "pvt_sn_db_az3" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.pvt_sn_db_az3_cidr
  availability_zone       = data.aws_availability_zones.available_zones.names[2]
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-db-az3"
  }
}
