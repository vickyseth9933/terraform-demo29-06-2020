###PROVIDER ADDED
provider "aws" {
  version = "~> 2.0"
  region = var.region
  access_key = ""
  secret_key = ""
}

###DATA SOURCE ADDED
data "aws_availability_zones" "azs" {}


###MOUDLE VPC 
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.44.0"
  name = "terraform-vpc-demo"
  cidr = var.vpc_cidr_range

  azs = slice(data.aws_availability_zones.azs.names, 0,2)
  public_subnets = var.public-subnets

  #Database server
  database_subnets = var.database_subnet
  database_subnet_tags = {
    subnet_type = "val-terr"
  }

  tags = {
    Terraform = "true"
    Environment = "dev"
  }


}

