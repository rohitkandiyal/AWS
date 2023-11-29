# provider
provider "aws" {
  region = local.aws_region
}

### locals
locals {
  aws_region  = var.aws_region
  app_name    = var.app_name
  environment = var.environment
  tags        = var.tags
}
