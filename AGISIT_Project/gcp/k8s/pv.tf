resource "kubernetes_persistent_volume_claim" "redis" {
  metadata {
    name = "redis-pvc"
  }
  spec {
    storage_class_name = kubernetes_storage_class.gceStorage.metadata.0.name
    access_modes       = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}

resource "kubernetes_storage_class" "gceStorage" {
  metadata {
    name = "gce-storage"
  }
  storage_provisioner    = "kubernetes.io/gce-pd"
  reclaim_policy         = "Retain"
  allow_volume_expansion = "true"
  parameters = {
    type = "pd-ssd"
  }
}
