provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
  zone        = var.region
}

module "gke" {
  source              = "./gke"
  project             = var.project
  region              = var.region
  zone                = var.zone
  node_count          = var.node_count
  credentials         = var.credentials
  machine_type        = var.machine_type
  secondary_ip_ranges = var.secondary_ip_ranges
}

module "k8s" {
  source                 = "./k8s"
  host                   = module.gke.host
  client_certificate     = module.gke.client_certificate
  client_key             = module.gke.client_key
  cluster_ca_certificate = module.gke.cluster_ca_certificate

  project          = var.project
  region           = var.region
  registry         = var.registry
  grafana_password = var.grafana_password
}
