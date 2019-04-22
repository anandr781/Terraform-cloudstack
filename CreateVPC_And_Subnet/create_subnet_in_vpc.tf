#
#     VPC (SuperCIDR : 10.0.0.0/16)
#        |--> Subnet (CIDR : 10.0.1.0/24)
#               (---> Network ACL)
#               |---> Instances 
#                        (---> service_offering, root_disk_size, template)
#
variable "cloudstack_api_url" {}
variable "cloudstack_api_key" {}
variable "cloudstack_secret_key" {}
variable "vpc_super_cidr" {}
variable "vpc_name" {}
variable "vpc_desc" {}
variable "network_offering" {}
variable "subnet_name" {}
variable "subnet_cidr" {}
variable "subnet_desc" {}
/* variable "instance_template" {}
variable "instance_type" {}
variable "instance_name" {}
variable "instance_display_name" {}
variable "instance_root_disk_size" {} */

# Configure the CloudStack Provider
provider "cloudstack" {
  api_url    = "${var.cloudstack_api_url}"
  api_key    = "${var.cloudstack_api_key}"
  secret_key = "${var.cloudstack_secret_key}"
}

# Set up the new vpc 
resource "cloudstack_vpc" "default" {
  name         = "${var.vpc_name}"
  display_text = "${var.vpc_desc}"
  cidr         = "${var.vpc_super_cidr}"   
  vpc_offering = "Default VPC Offering"    #Offering name or ID
  zone         = "VeetuZone"               #Zone name or ID
}

#Setup a default network ACL 
resource "cloudstack_network_acl" "default" {
    name = "nw-acl-01"
    vpc_id = "${cloudstack_vpc.default.id}"  
}
resource "cloudstack_network_acl_rule" "default" {
   acl_id = "${cloudstack_network_acl.default.id}" 

   rule {
     action="allow"
     cidr_list=["0.0.0.0/0"]
     protocol="tcp"
     ports=["0"]
     traffic_type="ingress"
   }
}

#Setup a subnet within the VPC 
resource "cloudstack_network" "veetu-subnet-1" {
    name = "${var.subnet_name}"
    display_text = "${var.subnet_desc}"
    cidr = "${var.subnet_cidr}"
    network_offering = "${var.network_offering}"
    zone = "VeetuZone"
    vpc_id= "${cloudstack_vpc.default.id}"
}
