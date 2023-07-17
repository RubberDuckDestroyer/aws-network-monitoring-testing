module "test-security-group" {
    source = "terraform-aws-modules/security-group/aws"

    name = "test-ec2-sg"
    description = "EC2 egress + inbound HTTPS access for test"

    vpc_id = var.vpc_id
    
    ingress_cidr_blocks      = ["0.0.0.0/0"]
    ingress_rules            = ["https-443-tcp"]

    egress_rules = ["all-all"]
}

module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    
    name = "test-network-instance"
    instance_type = "t2.micro"
    subnet_id = var.subnet_id

    vpc_security_group_ids = [module.test-security-group.security_group_id]

}