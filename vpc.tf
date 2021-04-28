data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = "ethermint-testnet"
  cidr = "20.10.0.0/16"

 azs = [
    data.aws_availability_zones.available.names[1],
    data.aws_availability_zones.available.names[2]
  ]

  public_subnets      = ["20.10.10.0/24", "20.10.90.0/24"]
  

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "ethermint-testnet"
  }
}