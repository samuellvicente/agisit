output "client_certificate" {
  value     = google_container_cluster.vpc_native_cluster.master_auth.0.client_certificate
  sensitive = true
}

output "client_key" {
  value     = google_container_cluster.vpc_native_cluster.master_auth.0.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = google_container_cluster.vpc_native_cluster.master_auth.0.cluster_ca_certificate
  sensitive = true
}

output "host" {
  value     = google_container_cluster.vpc_native_cluster.endpoint
  sensitive = true
}

resource "local_file" "kubectl" {
  content = templatefile("${path.module}/templates/kubectl.tmpl", {
    cluster = google_container_cluster.vpc_native_cluster.name
    zone    = format("%s-%s", var.region, var.zone)
    project = var.project
  })
  filename = "kubectl.sh"
}
