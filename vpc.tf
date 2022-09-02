# Terraform Backend to store state.

terraform {

  backend "local" {}

}

# Provider plugin information

provider "aws" {

  region = "us-west-2"

}

# Creating VPC module

module "vpc" {

  source = "terraform-aws-modules/vpc/aws"

  cidr   = "10.200.0.0/16"
  azs    = data.aws_availability_zones.az.zone_ids

  private_subnets = ["10.200.1.0/24", "10.200.2.0/24"]
  public_subnets  = ["10.200.10.0/24", "10.200.20.0/24"]

  tags = {

    Name = "Proof of Concept"
    Terraform = "true"
  }

}

# End Of Configuration
