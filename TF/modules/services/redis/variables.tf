variable "app_name" { type = string }
variable "aws_region" { type = string }
variable "tags" { type = map(any) }
variable "environment" {
  type = string
  validation {
    condition     = can(regex("^(integration|preproduction|production)$", var.environment))
    error_message = "Must be integration|preproduction|production"
  }
}
variable "cluster_size" { type = string }
variable "instance_type" { type = string }


# ToDos
# Version the module
# based on the env we set cluster name and check if it exists, then fetch its vpc and then subnets(fetch dynamically and then it can be >=1 (ARRAY) )
#

