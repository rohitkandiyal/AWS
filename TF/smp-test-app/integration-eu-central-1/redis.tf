############################################
############### Redis Module ###############
############################################

module "redis" {
  source = "../../../modules/services/redis/"
  app_name = "smp-test-app"
  environment = "integration"
  aws_region = var.aws_region
  cluster_size               = "1"
  instance_type              = "cache.t2.micro"
  tags = {
    OwnedBy     = "SMP"
    ManagedBy   = "Terraform"
    Tribe       = "Cloud-Platform-Engineering"
    Squad       = "APIs-Integration"
    CostCenter  = "15256-10"
    }
}