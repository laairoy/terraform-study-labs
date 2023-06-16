terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }

  backend "s3" {
    bucket = "my-remota-state"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-2"
  }

}

provider "aws" {
  # Configuration options
  region = var.region

  default_tags {
    tags = local.common_tags
  }
}

module "network" {
  source = "./network"

  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.1.0/24"
  environment = "dev"
}
