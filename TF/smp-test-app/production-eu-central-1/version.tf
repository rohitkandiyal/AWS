terraform {
  required_version = "1.3.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.51.0"
    }
  }

  backend "s3" {
    encrypt = "true"
    bucket  = "business-service-production-terraform-backends"
    region  = "eu-central-1"
    key     = "notification-hub-api/production-eu-central-1/terraform.tfstate"
  }
}