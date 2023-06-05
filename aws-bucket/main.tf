terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-2"

  default_tags {
    tags = {
      owner      = "marden"
      managed-by = "terraform"
    }
  }
}
