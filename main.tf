provider "aws" {
  region = var.region
}

terraform {
  backend "remote" {
    organization = "ChainSafe"

    workspaces {
      name = "ethermint-testnet-us-east2"
    }
  }
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "1.13.3"
    }
  }
}

data "aws_availability_zones" "available" {
  all_availability_zones = true
  state                  = "available"

  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }

}

module "ethermint-ops" {
  source       = "./ec2/ethermint-ops"
  #project_name = var.project_name
  #vpc_id       = module.vpc.vpc_id
  #subnet_id    = module.vpc.public_subnets[0]
  #ethermint-ops_sg_id  = module.ethermint-ops.sg_id
  tags = merge(
    local.common_tags
  )
}
