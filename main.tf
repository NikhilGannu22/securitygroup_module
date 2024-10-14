provider "aws" {
  region = "us-east-1"
}


module "app_security_group" {
  source             = "./modules/security_group"
  vpc_id             = aws_vpc.app_vpc.id
  ingress_from_port  = 0
  ingress_to_port    = 0
  ingress_protocol   = "-1"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  egress_from_port   = 0
  egress_to_port     = 0
  egress_protocol    = "-1"
  egress_cidr_blocks = ["0.0.0.0/0"]
  tags = {
    Name = "App-Security-Group"
  }
}

output "app_security_group_id" {
  value = module.app_security_group.security_group_id
}