variable "region" {
  type        = string
  description = "The region where the cluster will be deployed"
}

variable "project" {
  type        = string
  description = "The project id where the cluster will be deployed"
}

variable "credentials" {
  type        = string
  description = "Json key file for acessing the google cloud"
}

variable "registry" {
  type        = string
  description = "The repository id"
}

