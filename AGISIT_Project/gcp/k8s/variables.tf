variable "host" {}

variable "client_certificate" {}

variable "client_key" {}

variable "cluster_ca_certificate" {}

variable "region" {
  type        = string
  description = "The region where the cluster will be deployed"
}

variable "project" {
  type        = string
  description = "The project id where the cluster will be deployed"
}

variable "registry" {
  type        = string
  description = "Name of the registry that contains the images"
}

variable "grafana_password" {
  type        = string
  description = "Password for grafana"
}
