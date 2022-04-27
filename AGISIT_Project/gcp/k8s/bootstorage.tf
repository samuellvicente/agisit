resource "kubernetes_service" "bootstorage" {
  metadata {
    name = "bootstorage-svc"
    labels = {
      app  = "bootstorage"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app  = "bootstorage"
      tier = "backend"
    }
    port {
      port        = 5000
      target_port = 5000
    }
    type = "ClusterIP"
  }
}


resource "kubernetes_deployment" "bootstorage" {
  metadata {
    name = "bootstorage"
    labels = {
      app  = "bootstorage"
      tier = "backend"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "bootstorage"
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
          app  = "bootstorage"
          tier = "backend"
        }
      }
      spec {
        container {
          image             = format("%s-docker.pkg.dev/%s/%s/bootstorage:latest", var.region, var.project, var.registry)
          name              = "bootstorage"
          image_pull_policy = "IfNotPresent"
          env {
            name = "REDIS_HOST"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.bootstorage-env.metadata.0.name
                key  = "redis_host"
              }
            }
          }
          env {
            name = "REDIS_PORT"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.bootstorage-env.metadata.0.name
                key  = "redis_port"
              }
            }
          }
          env {
            name = "REDIS_PASSWORD"
            value_from {
              secret_key_ref {
                name = kubernetes_secret.bootstorage-env.metadata.0.name
                key  = "redis_password"
              }
            }
          }
          port {
            name           = "bootstorage"
            container_port = 5000
          }
          readiness_probe {
            failure_threshold = 3
            http_get {
              path   = "/api/bootstorage/healthz"
              port   = 5000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          liveness_probe {
            failure_threshold = 3
            http_get {
              path   = "/api/bootstorage/healthz"
              port   = 5000
              scheme = "HTTP"
            }
            period_seconds    = 10
            success_threshold = 1
            timeout_seconds   = 1
          }
          startup_probe {
            failure_threshold = 30
            http_get {
              path   = "/api/bootstorage/healthz"
              port   = 5000
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

resource "kubernetes_secret" "bootstorage-env" {
  metadata {
    name = "bootstorage-env"
    labels = {
      app  = "bootstorage-env"
      tier = "backend"
    }
  }
  data = {
    redis_password = "calculator"
    redis_host     = "redis"
    redis_port     = "6379"
  }
}
