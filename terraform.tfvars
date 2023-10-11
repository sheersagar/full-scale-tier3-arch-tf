region = "us-east-1"
project_name = "full-scale-3tier-arch"
vpc_cidr = "10.16.0.0/16"
internet_gateway_id = "aws_internet_gateway.internet_gateway.id"


#AZ1

pb_sn_az1_cidr      = "10.16.48.0/20"
pvt_sn_app_az1_cidr = "10.16.32.0/20"
pvt_sn_db_az1_cidr  = "10.16.16.0/20"


#AZ2 

pb_sn_az2_cidr      = "10.16.112.0/20"
pvt_sn_app_az2_cidr = "10.16.96.0/20"
pvt_sn_db_az2_cidr  = "10.16.80.0/20"


#AZ3

pb_sn_az3_cidr      = "10.16.176.0/20"
pvt_sn_app_az3_cidr = "10.16.160.0/20"
pvt_sn_db_az3_cidr  = "10.16.144.0/20"


############################################################################
# IAM Policies
############################################################################

cloud_watch_policy   = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
ssm_full_access      = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
efs_full_access      = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"


############################################################################
# Parameter Values
############################################################################

master_user_name     = "a4lwordpressuser"
master_password      = "VishvDeshwal1234567890"
initial_db_name      = "a4lwordpressuserdb"


#############################################################################
# SUBNET IDs
#############################################################################

subnet_ids_pb_sn = [
    "subnet-017f0c2086e2c3cd3",
    "subnet-0d594f67d22390284",
    "subnet-0dbeb33959610c924"
]

subnet_ids_pvt_sn_app = [
    "subnet-03133c6ef657db7b6",
    "subnet-03eb7ef52c84947f7",
    "subnet-01b4ee7fb495d9b9e"
]

subnet_ids_pvt_sn_db = [
    "subnet-0cd57fec23b81d0b2",
    "subnet-016d88df0b8023778",
    "subnet-0b05ba5b98ceb1a1a"
]



#########################################3
# RDS
##################################3#######

rds_cluster_endpoint = "aws_rds_cluster.rds_cluster.endpoint"

#########################################3
# Ubuntu Image
##########################################

ubuntu_ami = "ami-053b0d53c279acc90"