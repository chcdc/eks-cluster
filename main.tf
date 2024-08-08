module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.30"

  vpc_id     = var.vpc_id
  subnet_ids = var.vpc_private_subnets

  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true


  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1

      instance_type = ["t3.micro", "t3.small"]
      capacity_type = "SPOT"

      k8s_labels = {
        Environment = "dev"
      }

      key_name = var.key_name

      additional_tags = {
        Name = var.cluster_name
      }

      update_config = {
        max_unavailable_percentage = 50
      }
    }
  }

  tags = {
    Name       = var.cluster_name
    Enviroment = "dev"
    Terraform  = "true"
  }
}
