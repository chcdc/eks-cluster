variable "tags" {
  description = "Resource tags"
  type        = map(string)

  default = {
    Terraform  = "true"
    Enviroment = "dev"
    Kubernetes = "true"
  }
}

variable "region" {
  description = "Regiao AWS para criar os recursos"
  type        = string
  default     = "us-east-1"
}

variable "az_region_private" {
  description = "Regiao AWS para criar os recursos"
  type        = string
  default     = "us-east-1a"
}

variable "az_region_public" {
  description = "Regiao AWS para criar os recursos"
  type        = string
  default     = "us-east-1b"
}

variable "cidr_block" {
  description = "Network CIDR "
  type        = string
  default     = "10.10.0.0/16"
}

variable "subnet_cidr_block_public" {
  description = "Subnet Network CIDR "
  type        = string
  default     = "10.10.1.0/24"
}

variable "subnet_cidr_block_private" {
  description = "Subnet Network CIDR "
  type        = string
  default     = "10.10.2.0/24"
}

variable "rtb_cidr" {
  description = "RTB Network CIDR "
  type        = string
  default     = "0.0.0.0/0"
}


variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-cluster"
}

variable "key_name" {
  description = "Chave SSH"
  type        = string
  default     = ""
}

