//output "eks_cluster" {
//  value = module.redis.eks_cluster
//}
//
//output "vpc_id" {
//  value = module.redis.vpc_id
//}

output "redis-endpoint" {
  value = module.redis.redis-endpoint
}

output "redis-dns" {
  value = module.redis.redis-dns
}