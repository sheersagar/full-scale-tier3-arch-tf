data "aws_subnet" "pvt_sn_app_az1" {
  id = aws_subnet.pvt_sn_app_az1.id
}

data "aws_subnet" "pvt_sn_app_az2" {
    id = aws_subnet.pvt_sn_app_az2.id
}

data "aws_subnet" "pvt_sn_app_az3" {
  id = aws_subnet.pvt_sn_app_az3.id
}
#