resource "kubernetes_namespace" "kube-prometheus" {
  metadata {
    name = "kube-prometheus"
  }
}

resource "helm_release" "kube-prometheus-stack" {
  name            = "kube-prometheus"
  repository      = "https://prometheus-community.github.io/helm-charts"
  chart           = "kube-prometheus-stack"
  timeout         = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.kube-prometheus.metadata.0.name

  values = [
    templatefile("${path.module}/templates/kube-prometheus-stack.tmpl", {
      grafana_adminPassword = var.grafana_password
      storage_class_name    = kubernetes_storage_class.gceStorage.metadata.0.name
    })
  ]
}


resource "kubernetes_config_map" "nginxdash" {
  metadata {
    name = "nginx-ingress-dashboard"
    labels = {
      grafana_dashboard = "1"
    }
  }
  data = {
    "nginx.json" = file("${path.module}/resources/nginxdash.json")
  }
}
