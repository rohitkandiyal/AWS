terraform {
//  required_version = "1.0.0"
//
//  required_providers {
//    aws = {
//      source  = "hashicorp/aws"
//      version = "3.46.0"
//    }
//  }

  backend "s3" {
    encrypt = "true"
    bucket  = "business-service-integration-terraform-backends"
    region  = "eu-central-1"
    key     = "smp-test-app/integration-eu-central-1/terraform.tfstate"
  }
}

provider "aws" {
  region = "${var.aws_region}"
}