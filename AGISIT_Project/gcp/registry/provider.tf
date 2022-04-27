terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.0.0"
    }
  }
}

provider "google-beta" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}
