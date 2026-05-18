module "eks" {

  source = "terraform-aws-modules/eks/aws"

  cluster_name = "${var.environment}-eks-cluster"

  cluster_version = "1.29"

  subnet_ids = var.private_subnets

  vpc_id = var.vpc_id

  eks_managed_node_groups = {

    default = {
      desired_size = 2
      max_size     = 4
      min_size     = 2

      instance_types = ["t3.medium"]
    }
  }
}