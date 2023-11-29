terraform {
  required_version = "1.4.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.51.0"
    }
  }

//  backend "s3" {
//    encrypt = "true"
//    bucket  = var.s3_backend_bucket
//    region  = var.aws_region
//    key     = "${var.app_name}/${var.environment}-${var.aws_region}/terraform.tfstate"
//  }
}


