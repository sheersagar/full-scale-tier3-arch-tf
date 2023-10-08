#------------------------------------------------------------------

#--------------Creating Route Table ------------------------

# Route Table for Public Subnet and IGW
resource "aws_route_table" "pb_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "public route table"
  }
}


# ----------------------------------------------------------


###################Public Route Table Association############################
###################                              ############################


resource "aws_route_table_association" "pb_rt_assoc" {
  for_each = toset(data.aws_availability_zones.available_zones.names)
  subnet_id      = aws_subnet.pb_sn[each.key].id
  route_table_id = aws_route_table.pb_rt.id
}
