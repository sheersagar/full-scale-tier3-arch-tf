
# Use data source to get first 3 availability zones in region
data "aws_availability_zones" "available_zones" {
  filter {
    name = "zone-name"
    values = [
      "${var.region}a",
      "${var.region}b",
      "${var.region}c"
    ]
  }
}

# Generate CIDR ranges for all the subnets
locals {
  cidr_ranges_pub_sn = {
    "${var.region}a" = cidrsubnet(var.vpc_cidr, 8, 0)
    "${var.region}b" = cidrsubnet(var.vpc_cidr, 8, 1)
    "${var.region}c" = cidrsubnet(var.vpc_cidr, 8, 2)
  }

  cidr_ranges_pvt_sn = {
    "${var.region}a" = cidrsubnet(var.vpc_cidr, 8, 3)
    "${var.region}b" = cidrsubnet(var.vpc_cidr, 8, 4)
    "${var.region}c" = cidrsubnet(var.vpc_cidr, 8, 5)
  }

  cidr_ranges_db_sn = {
    "${var.region}a" = cidrsubnet(var.vpc_cidr, 8, 6)
    "${var.region}b" = cidrsubnet(var.vpc_cidr, 8, 7)
    "${var.region}c" = cidrsubnet(var.vpc_cidr, 8, 8)
  }
}

#############################Public Subnet##################################
#############################             ##################################


# Creating public subnets in AZ1
resource "aws_subnet" "pb_sn" {
  for_each                = toset(data.aws_availability_zones.available_zones.names)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.cidr_ranges_pub_sn[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "pb-sn-${each.key}"
  }
}


########################App Private Subnet##################################
########################                  ##################################

# Creating Private app subnets in AZ1
resource "aws_subnet" "pvt_sn_app" {
  for_each                = toset(data.aws_availability_zones.available_zones.names)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.cidr_ranges_pvt_sn[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-sn-${each.key}"
  }
}

#---------------------------------------------------------------

############################DB Private Subnet##############################
############################                 ##############################

# creating private db subnet in AZ1
resource "aws_subnet" "pvt_sn_db" {
  for_each                = toset(data.aws_availability_zones.available_zones.names)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.cidr_ranges_db_sn[each.key]
  availability_zone       = each.key
  map_public_ip_on_launch = false

  tags = {
    Name = "pvt-app-db-${each.key}"
  }
}
