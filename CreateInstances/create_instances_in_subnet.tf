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
variable "subnet_id" {}
variable "instance_type" {}
variable "instance_name" {}
variable "instance_display_name" {}
variable "instance_root_disk_size" {}
variable "instance_template_name" {}


# Configure the CloudStack Provider
provider "cloudstack" {
  api_url    = "${var.cloudstack_api_url}"
  api_key    = "${var.cloudstack_api_key}"
  secret_key = "${var.cloudstack_secret_key}"
}

data "cloudstack_template" "instance_template" {
    template_filter = "featured"
    filter {
      name="name"
      value = "${var.instance_template_name}"
      
    }
}

#Setup an instance within the extracted "terraform data type" -> subnet 
resource "cloudstack_instance" "Host-I" {
  name             = "${var.instance_name}"
  display_name     = "${var.instance_display_name}"
  service_offering = "${var.instance_type}"
  network_id       = "${var.subnet_id}"
  template         = "${data.cloudstack_template.instance_template.id}"
  root_disk_size   = "${var.instance_root_disk_size}"
  start_vm         = "false"
  zone             = "VeetuZone"
}