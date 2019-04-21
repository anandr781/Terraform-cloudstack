#CloudStack Provider variables
cloudstack_api_url = "http://CSMgmt.labs.local:8080/api/client"
cloudstack_api_key  = "8aqDaBTpu8lsi50ibGReyM96tjMzq_lM3wGUR2Y4ZmCMObxQ4f6Ngr7we-EJDDOKUMMm-OUTqG9wg6wqhOx2KA"
cloudstack_secret_key = "W1qCT83-DTFzpccNAbpetA8Q1z0YGzsmMH_sxovQTackJRjBAgzf91PgyFAtLFRBc_xTOuyAxohTVsWeFMFFlg"

#VPC variables
vpc_super_cidr = "10.0.0.0/16"
vpc_name = "veetu-vpc-01"
vpc_desc = "vpc-01 in the VeetuZone-AZ"

#Subnet Variables
network_offering = "DefaultIsolatedNetworkOfferingForVpcNetworksNoLB"
subnet_name = "veetu-subnet-01"
subnet_desc = "subnet-01 in the veetu-vpc-01 with subnet CIDR (10.0.1.0/24 / 10.0.0.0/16)"
subnet_cidr = "10.0.1.0/24"

#Instance Variables
instance_template = "CoreOS-2023.5.0-Cloudstack-Template"
instance_type = "t2.micro"
instance_name = "CoreOS-Micro-01"
instance_display_name = "CoreOS Cluster - Host-I"
instance_root_disk_size = "20"