resource "kubernetes_service" "happy" {
  metadata {
    name = "happy-svc"
    labels = {
      app  = "happy"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app  = "happy"
      tier = "backend"
    }
    port {
      port        = 4000
      target_port = 4000
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "happy" {
  metadata {
    name = "happy"
    labels = {
      app  = "happy"
      tier = "backend"
    }
  }
  spec {
    progress_deadline_seconds = 1200 # In case of taking longer than 9 minutes
    replicas                  = 1
    selector {
      match_labels = {
        app = "happy"
      }
    }
    strategy {
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
    }
    template {
      metadata {
        labels = {
          app  = "happy"
          tier = "backend"
        }
      }
      spec {
        container {
          image             = format("%s-docker.pkg.dev/%s/%s/happy:latest", var.region, var.project, var.registry)
          name              = "happy"
          image_pull_policy = "IfNotPresent"
          port {
            name           = "happy"
            container_port = 4000
          }
          readiness_probe {
            failure_threshold = 3
            http_get {
              path   = "/api/happy/healthz"
              port   = 4000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          liveness_probe {
            failure_threshold = 3
            http_get {
              path   = "/api/happy/healthz"
              port   = 4000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          startup_probe {
            failure_threshold = 30
            http_get {
              path   = "/api/happy/healthz"
              port   = 4000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          resources {
            requests = {
              cpu    = "100m"
              memory = "100Mi"
            }
          }
        }
      }
    }
  }
}


