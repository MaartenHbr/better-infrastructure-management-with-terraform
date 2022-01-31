terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.46.0"
    }
  }
  backend "s3" {
    // TO DO: configure this correctly after setting up the remote backend
    bucket = "better-infrastructure-management-with-terraform-151"
    key    = "terraform.tfstate"
    region = "eu-west-1"
    profile = "academy"
    dynamodb_table = "app-state-151"
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = "eu-west-1"
  profile = "academy"
}


