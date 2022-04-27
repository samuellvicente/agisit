resource "kubernetes_service" "expressed" {
  metadata {
    name = "expressed-svc"
    labels = {
      app  = "expressed"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app  = "expressed"
      tier = "backend"
    }
    port {
      port        = 3000
      target_port = 3000
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "expressed" {
  metadata {
    name = "expressed"
    labels = {
      app  = "expressed"
      tier = "backend"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app  = "expressed"
        tier = "backend"
      }
    }
    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = 1
        max_unavailable = 1
      }
    }
    template {
      metadata {
        labels = {
          app  = "expressed"
          tier = "backend"
        }
      }
      spec {
        container {
          image             = format("%s-docker.pkg.dev/%s/%s/expressed:latest", var.region, var.project, var.registry)
          name              = "expressed"
          image_pull_policy = "IfNotPresent"
          port {
            name           = "expressed"
            container_port = 3000
          }
          readiness_probe {
            http_get {
              path   = "/api/express/healthz"
              port   = 3000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          liveness_probe {
            http_get {
              path   = "/api/express/healthz"
              port   = 3000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          startup_probe {
            failure_threshold = 30
            http_get {
              path   = "/api/express/healthz"
              port   = 3000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
        }
      }
    }
  }
}
