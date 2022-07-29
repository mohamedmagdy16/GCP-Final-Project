
region     = "us-central1"
project_id = "gold-order-354113"


management_subnet_cidr = "10.0.0.0/24"
restricted_subnet_cidr = "10.0.1.0/24"


machine_image = "centos-cloud/centos-7"
machine_type  = "e2-micro"

pods_ipv4_cidr_block     = "10.48.0.0/14"
services_ipv4_cidr_block = "10.52.0.0/20"
master_ipv4_cidr_block   = "172.16.0.0/28"