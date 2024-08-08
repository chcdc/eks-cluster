variable "region" {
  description = "Regiao AWS para criar os recursos"
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "Nome do cluster EKS"
  default     = "eks-cluster"
}

variable "key_name" {
  description = "Chave SSH"
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "ID da Rede"
  type        = string
  default     = "vpc-07e752d11f3be0cf8"
}

variable "vpc_private_subnets" {
  description = "ID da Subnet"
  type        = list(string)
  default     = ["subnet-0fbf1f535dc9afe40", "subnet-024c85b8a0f00a371"]
}
