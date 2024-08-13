resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.this.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.this_private.id,
      aws_subnet.this_public.id
    ]
  }

  access_config {
    authentication_mode                         = "API_AND_CONFIG_MAP"
    bootstrap_cluster_creator_admin_permissions = true
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
  ]
}

resource "aws_eks_access_entry" "example" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = aws_iam_role.this.arn
  type          = "STANDARD"
}

# resource "aws_eks_addon" "this" {
#  cluster_name = aws_eks_cluster.this.name
#  addon_name   = "vpc-cni"
#}


