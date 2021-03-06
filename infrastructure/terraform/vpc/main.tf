terraform {
  backend s3 {
    bucket = "rgduncan-terraform-state"
    key = "infrastructure/vpc.tfstate"
    region = "us-west-2"
    profile = "personal"
  }
}

provider "aws" {
  region = "us-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "personal"
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  # https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.33.0"

  name = "vpc-main"
  cidr = "10.0.0.0/16"

  azs             = ["us-west-2a", "us-west-2b", "us-west-2c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = {
    Owner       = "rgduncan"
    Terraform = "true"
    Environment = "prod"
  }
}