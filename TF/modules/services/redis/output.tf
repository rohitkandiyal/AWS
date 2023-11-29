# one can output sthing from within the module and then us it in the caller tf.
# like we can get the redis endpoint and then create a route 53 entry for it by calling route 53 module in caller tf.
# this we can do in integration and pre-prod. But not in prod as it goes to bcg.com.


//output "eks_cluster" {
//  value = local.eks_cluster
//}
//
//output "vpc_id" {
//  value = data.aws_eks_cluster.eks_cluster_data.vpc_config[0].vpc_id
//}
//
//output "private_subnets" {
//  value = data.aws_subnets.eks_cluster_private_subnets.ids
//}

output "redis-endpoint" {
  value = module.smp_redis.endpoint
}

output "redis-dns" {
  value = module.smp_redis.host
}