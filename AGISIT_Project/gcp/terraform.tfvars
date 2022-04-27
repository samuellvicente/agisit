region       = "europe-west1"
zone         = "b"
project      = ""
credentials  = ""
node_count   = 3
machine_type = "n1-standard-2"
secondary_ip_ranges = {
  "pod_ip_range"      = "10.0.0.0/14"
  "services_ip_range" = "10.4.0.0/19"
}
registry         = "myrepo"
grafana_password = "grafanamonitoring"
