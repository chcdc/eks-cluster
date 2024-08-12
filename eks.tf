resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = aws_iam_role.this.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.this_private.id,
      aws_subnet.this_public.id
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}
