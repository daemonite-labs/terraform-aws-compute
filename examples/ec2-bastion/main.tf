locals {
  region = "eu-west-1"

  name = basename(path.cwd)

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Name       = local.name
    Example    = "complete"
    Repository = "github.com/daemonite-labs/terraform-aws-compute"
  }
}

provider "aws" {
  region = local.region

  default_tags {
    tags = local.tags
  }
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs            = local.azs
  public_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
}

module "compute" {
  source = "../../modules/ec2-bastion"

  identifier = local.name
  vpc_id     = module.vpc.vpc_id
  subnet_id  = module.vpc.public_subnets[0]
}
