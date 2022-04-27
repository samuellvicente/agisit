variable "region" {
  type        = string
  description = "The region where the cluster will be deployed"
}

variable "zone" {
  type        = string
  description = "The zone where the cluster will be deployed"
}

variable "credentials" {
  type        = string
  description = "Json key file for acessing the google cloud"
}

variable "project" {
  type        = string
  description = "The project id where the cluster will be deployed"
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
  type = map(any)
}
