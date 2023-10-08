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
master_password      = "VishvDeshwal@1234567890"
initial_db_name      = "a4lwordpressuserdb"


#############################################################################
# SUBNET IDs
#############################################################################

subnet_ids_pb_sn = [
    "subnet-0b1c4af9e87df5136",
    "subnet-0831f92674766cc10",
    "subnet-0824128e2316de411"
]

subnet_ids_pvt_sn_app = [
    "subnet-084253b232e47dfd2",
    "subnet-072ee4be3058cb25c",
    "subnet-0df5804df202189ca"
]

subnet_ids_pvt_sn_db = [
    "subnet-083da77277169c505",
    "subnet-0e244030e8a9ed152",
    "subnet-030ab52699f9e8dba"
]



#########################################3
# RDS
##################################3#######

rds_cluster_endpoint = "aws_rds_cluster.rds_cluster.endpoint"

#########################################3
# Ubuntu Image
##########################################

ubuntu_ami = "ami-053b0d53c279acc90"
