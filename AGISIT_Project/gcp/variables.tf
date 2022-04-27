variable "region" {
  type        = string
  description = "The region where the cluster will be deployed"
}

variable "zone" {
  type        = string
  description = "The zone where the cluster will be deployed"
}

variable "project" {
  type        = string
  description = "The project id where the cluster will be deployed"
}

variable "credentials" {
  type        = string
  description = "Json key file for acessing the google cloud"
}

variable "node_count" {
  type        = number
  description = "Number of worker nodes for the cluster"
}

variable "machine_type" {
  type        = string
  description = "Type of machine to use for the kubernetes nodes"
}

variable "secondary_ip_ranges" {
  type        = map(any)
  description = "Ip address ranges for pods (\"pod_ip_range\") and services (\"services_ip_range\")"
}

variable "registry" {
  type        = string
  description = "Name of the registry that contains the images"
}

variable "grafana_password" {
  type        = string
  description = "Password for grafana"
}
