variable "location" {
  description = "Azure region"
  default     = "Canada Central"
}

variable "resource_group_name" {
  description = "Resource group name"
  default     = "aks-resource-group"
}

variable "kubernetes_cluster_name" {
  description = "AKS cluster name"
  default     = "aks-cluster"
}