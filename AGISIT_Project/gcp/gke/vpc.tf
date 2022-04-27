resource "google_compute_network" "net" {
  name                    = "net"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet"
  ip_cidr_range = "10.5.0.0/20"
  network       = google_compute_network.net.id

  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = var.secondary_ip_ranges.services_ip_range
  }

  secondary_ip_range {
    range_name    = "pod-ranges"
    ip_cidr_range = var.secondary_ip_ranges.pod_ip_range
  }
}
