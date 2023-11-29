output "redis-endpoint" {
  value = module.redis.endpoint
}

output "dns" {
  value = module.redis.host
}