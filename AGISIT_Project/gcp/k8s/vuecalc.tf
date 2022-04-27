resource "kubernetes_service" "vuecalc" {
  metadata {
    name = "vuecalc-svc"
    labels = {
      app  = "vuecalc"
      tier = "frontend"
    }
  }
  spec {
    selector = {
      app  = "vuecalc"
      tier = "frontend"
    }
    port {
      port        = 2000
      target_port = 2000
    }
    type = "ClusterIP"
  }
}

resource "kubernetes_deployment" "vuecalc" {
  metadata {
    name = "vuecalc"
    labels = {
      app  = "vuecalc"
      tier = "frontend"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app  = "vuecalc"
        tier = "frontend"
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
          app  = "vuecalc"
          tier = "frontend"
        }
      }
      spec {
        container {
          image             = format("%s-docker.pkg.dev/%s/%s/vuecalc:latest", var.region, var.project, var.registry)
          name              = "vuecalc"
          image_pull_policy = "Always"

          env {
            name  = "VUE_APP_EXPRESSED_BASE_URL"
            value = "http://${kubernetes_ingress.ingress.status.0.load_balancer.0.ingress.0.ip}/api/express"
          }
          env {
            name  = "VUE_APP_HAPPY_BASE_URL"
            value = "http://${kubernetes_ingress.ingress.status.0.load_balancer.0.ingress.0.ip}/api/happy"
          }
          env {
            name  = "VUE_APP_BOOTSTORAGE_BASE_URL"
            value = "http://${kubernetes_ingress.ingress.status.0.load_balancer.0.ingress.0.ip}/api/bootstorage"
          }
          port {
            name           = "vuecalc"
            container_port = 2000
          }
          readiness_probe {
            failure_threshold = 3
            http_get {
              path   = "/"
              port   = 2000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          liveness_probe {
            failure_threshold = 3
            http_get {
              path   = "/"
              port   = 2000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          startup_probe {
            failure_threshold = 30
            http_get {
              path   = "/"
              port   = 2000
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
  depends_on = [kubernetes_ingress.ingress]
}
