variable "aws_region" {
    type = string
    description = "AWS Region"
    default = "ap-southeast-2"
}

variable "vpc_id"  {
    type = string
    description = "VPC ID for test EC2 instance and security group"
}

variable "subnet_id" {
    type = string
    description = "Subnet Id for test EC2 instance "
}