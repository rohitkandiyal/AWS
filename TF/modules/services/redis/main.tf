############################################
############### Redis Module ###############
############################################

module "smp_redis" {
  source = "cloudposse/elasticache-redis/aws"
  version = "0.49.0"
  availability_zones         = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  namespace                  = "${local.eks_cluster}"
  stage                      = "${var.environment}"
  name                       = "redis-${var.app_name}-${var.environment}"
  zone_id                    = "${local.hosted_zone_id}"
  vpc_id                     = "${data.aws_eks_cluster.eks_cluster_data.vpc_config[0].vpc_id}"
  subnets                    = data.aws_subnets.eks_cluster_private_subnets.ids
  cluster_size               = "${var.cluster_size}"
  instance_type              = "${var.instance_type}"
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = "6.x"
  family                     = "redis6.x"
  at_rest_encryption_enabled = true
  transit_encryption_enabled = false
  replication_group_id = "redis-${var.app_name}-${var.environment}"
  dns_subdomain = "redis-${var.app_name}-${var.environment}"
  allowed_security_group_ids = [data.aws_security_group.worker-node-default-sg.id]
  tags = var.tags
}
