provider "aws" {
  region = "eu-central-1"
}

terraform {
  required_version = "~> 0.14.3"
  backend "s3" {
    encrypt  = "true"
    bucket   = "smp-terraform-modules-examples"
    region   = "eu-central-1"
    key      = "cloudfront-s3-cdn/test-perm/terraform.tfstate"
  }

  required_providers {}
}

module "cdn" {
  source                    = "git::https://github.com/cloudposse/terraform-aws-cloudfront-s3-cdn.git?ref=0.82.4"
  namespace                 = "smp"
  name                      = "crown-jewel-test"
  environment               = "sandbox"
  label_order               = ["namespace", "name", "environment"]
  aliases                   = ["crown-jewel-test.tooling.test.smp-paas.com"]
  parent_zone_id            = "ZZN2DM19IQLNS"
  dns_alias_enabled         = true
  web_acl_id                = ""
  acm_certificate_arn       = "arn:aws:acm:eu-central-1:257652058521:certificate/395a8128-8e47-461d-acf5-9ae96e65bdda"
  allowed_methods           = ["GET", "HEAD", "OPTIONS"] #["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
  cached_methods            = ["GET", "HEAD", "OPTIONS"]
  cors_allowed_headers      = ["*"]
  cors_allowed_methods      = ["GET", "HEAD"]
  cors_allowed_origins      = ["*.tooling.test.smp-paas.com"]
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



