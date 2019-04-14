variable "cloudstack_api_url" {

}
variable "cloudstack_api_key" {
  
}

variable "cloudstack_secret_key" {
  
}

# Configure the CloudStack Provider
provider "cloudstack" {
  api_url    = "${var.cloudstack_api_url}"
  api_key    = "${var.cloudstack_api_key}"
  secret_key = "${var.cloudstack_secret_key}"
}

# Set up a new vpc for testing purposes
resource "cloudstack_vpc" "default" {
  name         = "test-vpc"
  display_text = "display text for your VPC"
  cidr         = "10.0.0.0/16"             #CIDR range for the VPC
  vpc_offering = "Default VPC Offering"    #Offering name or ID
  zone         = "VeetuZone1"               #Zone name or ID
}
