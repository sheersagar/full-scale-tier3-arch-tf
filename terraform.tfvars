############################################################################
#
# THIS FILE SHOULD NOT BE COMMITTED IN FINAL VERSION
# It contains sensitive values
#
############################################################################
region              = "us-east-1"
project_name        = "full-scale-3tier-arch"
vpc_cidr            = "10.16.0.0/16"
internet_gateway_id = "aws_internet_gateway.internet_gateway.id"

############################################################################
# IAM Policies
############################################################################

cloud_watch_policy = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
ssm_full_access    = "arn:aws:iam::aws:policy/AmazonSSMFullAccess"
efs_full_access    = "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"


############################################################################
# Parameter Values
############################################################################

master_user_name = "a4lwordpressuser"
master_password  = "VishvDeshwal1234567890" # @ not vaild for mysql passwords
initial_db_name  = "a4lwordpressuserdb"

