resource "kubernetes_service" "redis" {
  metadata {
    name = "redis"
    labels = {
      app  = "redis"
      tier = "backend"
    }
  }
  spec {
    selector = {
      app  = "redis"
      tier = "backend"
    }
    port {
      port = 6379
    }
    cluster_ip = "None"
    type       = "ClusterIP"
  }
}

resource "kubernetes_deployment" "redis" {
  metadata {
    name = "redis"
    labels = {
      app  = "redis"
      tier = "backend"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "redis"
      }
    }
    template {
      metadata {
        labels = {
          app  = "redis"
          tier = "backend"
        }
      }
      spec {
        container {
          image             = "redis:6.2-alpine"
          name              = "redis"
          image_pull_policy = "IfNotPresent"
          args              = ["--requirepass", "calculator", "--appendonly", "yes", "--save", "900", "1", "--save", "30", "2"]
          port {
            container_port = 6379
            name           = "redis"
          }
          volume_mount {
            name       = "redis-volume"
            mount_path = "/data"
          }
        }
        volume {
          name = "redis-volume"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.redis.metadata.0.name
          }
        }
      }
    }
  }
}


