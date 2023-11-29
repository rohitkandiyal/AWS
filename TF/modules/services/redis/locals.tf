# this will have vars which are used in this module but are not going to be changed by each caller tf.
# locals can't be changed by caller terraform

locals {
  int    = var.environment == "integration" ? "smp-core-infra-integration-instance" : ""
  preprod    = var.environment == "preproduction" ? "protected-preproduction-shared-instance" : ""
  prod    = var.environment == "production" ? "protected-production-shared-instance" : ""
  eks_cluster = coalesce(local.int, local.preprod, local.prod)
}

locals {
  int_zone    = var.environment == "integration" ? "Z1X2M9M7OQVSC6" : ""
  preprod_zone    = var.environment == "preproduction" ? "Z10GNSQOBW3WK1" : ""
  prod_zone    = var.environment == "production" ? "Z3QARYF4LYQ9IR" : ""
  hosted_zone_id = coalesce(local.int_zone, local.preprod_zone, local.prod_zone)
}