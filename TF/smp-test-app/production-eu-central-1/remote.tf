data "aws_security_group" "worker-node-default-sg" {
  filter {
    name = "group-name"
    values = [
      "protected-production-shared-instance-default-worker-nodes-sg"]
  }
}