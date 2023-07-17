terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      version = "5.7.0"
      source  = "hashicorp/aws"
    }
  }
}

# Pulling the igw from the same vpc
data "aws_internet_gateway" "test" {
  filter {
    name   = "attachment.vpc-id"
    values = [var.vpc_id]
  }
}

resource "aws_ec2_network_insights_path" "path" {

  # Source and Destination Can be an Instance, Internet Gateway, Network Interface, Transit Gateway, VPC Endpoint, VPC Peering Connection or VPN Gateway.
  source      = module.ec2_instance.id
  destination = data.aws_internet_gateway.test.internet_gateway_id

  # Source and destination could optionally be an IP Address
  # source_ip = ""
  # destination_ip = ""
  destination_port = "443"


  # Protocol - tcp or udp
  protocol = "tcp"

}
