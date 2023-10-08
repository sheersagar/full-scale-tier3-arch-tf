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


resource "aws_route_table_association" "pb_rt_assoc_pb1" {
  subnet_id      = aws_subnet.pb_sn_az1.id
  route_table_id = aws_route_table.pb_rt.id
}

resource "aws_route_table_association" "pb_rt_assoc_pb2" {
  subnet_id      = aws_subnet.pb_sn_az2.id
  route_table_id = aws_route_table.pb_rt.id
}

resource "aws_route_table_association" "pb_rt_assoc_pb3" {
  subnet_id      = aws_subnet.pb_sn_az3.id
  route_table_id = aws_route_table.pb_rt.id
}
#------------------------------------------------------------
