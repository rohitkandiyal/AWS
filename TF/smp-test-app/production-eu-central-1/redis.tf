############################################
############### Redis Module ###############
############################################

module "redis" {
  source = "cloudposse/elasticache-redis/aws"
  version = "0.49.0"
  availability_zones         = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  namespace                  = "protected-production-shared-instance"
  stage                      = "${local.environment}"
  name                       = "redis-${local.app_name}-${local.environment}"
  zone_id                    = "Z3QARYF4LYQ9IR"
  vpc_id                     = "vpc-053d67f38fdcd1998"
  subnets                    = ["subnet-086fabc7f0aa6eaec", "subnet-0b61d4a26cfded47d", "subnet-0ec09f8793ba0a5c3"]
  cluster_size               = "1"
  instance_type              = "cache.t2.medium"
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = "6.x"
  family                     = "redis6.x"
  at_rest_encryption_enabled = true
  transit_encryption_enabled = false
  replication_group_id = "redis-${local.app_name}-${local.environment}"
  dns_subdomain = "redis-${local.app_name}-${local.environment}"
  allowed_security_group_ids = [data.aws_security_group.worker-node-default-sg.id]
  tags = local.tags

  //  parameter = [
  //    {
  //      name  = "notify-keyspace-events"
  //      value = "lK"
  //    }
  //  ]
}