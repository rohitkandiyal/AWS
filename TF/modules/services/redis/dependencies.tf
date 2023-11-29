# This holds the data which is going to be fetched by terraform from cloud resources or state.

#Fetch env and cluster details:

data "aws_eks_cluster" "eks_cluster_data" {
  name = local.eks_cluster
}

data "aws_subnets" "eks_cluster_private_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_eks_cluster.eks_cluster_data.vpc_config[0].vpc_id]
  }
  tags = {
    Name = "*Private Subnet*"
  }
}

data "aws_security_group" "worker-node-default-sg" {
  filter {
    name = "group-name"
    values = [
      "${local.eks_cluster}-default-worker-nodes-sg"]
  }
}