output "cluster_id" {
  description = "O ID do cluster EKS"
  value       = aws_eks_cluster.this.cluster_id
}

output "endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.this.certificate_authority[0].data
}


#output "kubeconfig" {
#  description = "O kubeconfig do cluster EKS"
#  value       = module.eks.kubeconfig
#}


