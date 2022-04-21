provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_version = "~> 0.14.3"
  backend "s3" {
    encrypt  = "true"
    bucket   = "business-service-integration-terraform-backends"
    region   = "eu-central-1"
    key      = "cloudfront-s3-cdn/safeatwork/terraform.tfstate"
  }

  required_providers {}
}

module "cdn" {
  source                    = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=0.40.0"
  namespace                 = "smp"
  name                      = "safe-at-work-pwa"
  environment               = "integ"
  stage                     = ""
  label_order               = ["namespace", "name", "environment", "stage"]
  aliases                   = ["safeatwork-pwa.integration.smp.bcg.com"]
  parent_zone_id            = "Z1ZMS3NQN36LGI"
  dns_alias_enabled         = true
  web_acl_id                = ""
  acm_certificate_arn       = "arn:aws:acm:us-east-1:068874145936:certificate/006f829d-21b1-4b59-b548-61d3f7e5ee12"
  allowed_methods           = ["GET", "HEAD", "OPTIONS"] #["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cached_methods            = ["GET", "HEAD", "OPTIONS"]
  cors_allowed_headers      = ["*"]
  cors_allowed_methods      = ["GET", "HEAD"]
  cors_allowed_origins      = ["*.integration.smp.bcg.com"]
  cors_expose_headers       = ["ETag"]
  encryption_enabled        = true
  forward_header_values     = ["Access-Control-Request-Headers", "Access-Control-Request-Method", "Access-Control-Allow-Origin", "Origin"]
  forward_query_string      = false
  geo_restriction_locations = []
  geo_restriction_type      = "none" # whitelist or blacklist
  origin_ssl_protocols      = ["TLSv1", "TLSv1.1", "TLSv1.2"]
  custom_error_response     = [{
    error_caching_min_ttl = "300"
    error_code            = "404"
    response_code         = "200"
    response_page_path    = "/index.html"
  }]
  logging_enabled           = false
  versioning_enabled        = false
  comment                   = "Managed by Terraform"
  tags = map("CostCenter","15998-41")
}



