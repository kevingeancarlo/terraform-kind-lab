variable "cluster_name" {
  type        = string
  description = "Nombre del clúster kind"
  default     = "lab"
}

variable "replicas" {
  type        = number
  description = "Réplicas del despliegue hello"
  default     = 1
}
