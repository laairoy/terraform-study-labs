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
    key    = "aws-provisioners/terraform.tfstate"
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

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-remota-state"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
