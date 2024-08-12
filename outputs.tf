output "cluster_id" {
  description = "O ID do cluster EKS"
  value       = aws_eks_cluster.this.cluster_id
}

#output "kubeconfig" {
#  description = "O kubeconfig do cluster EKS"
#  value       = module.eks.kubeconfig
#}


