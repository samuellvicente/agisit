resource "kubernetes_namespace" "ingress-controller" {
  metadata {
    name = "ingress-controller"
  }
}

resource "helm_release" "ingress-nginx" {
  name            = "ingress-nginx"
  repository      = "https://kubernetes.github.io/ingress-nginx"
  chart           = "ingress-nginx"
  timeout         = 120
  cleanup_on_fail = true
  force_update    = true
  namespace       = kubernetes_namespace.ingress-controller.metadata.0.name

  values = [
    templatefile("${path.module}/templates/ingress-nginx.tmpl", {
      namespace = kubernetes_namespace.kube-prometheus.metadata.0.name
    })
  ]
  depends_on = [helm_release.kube-prometheus-stack]
}

resource "kubernetes_ingress" "ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "ingress"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    backend {
      service_name = kubernetes_service.vuecalc.metadata.0.name
      service_port = kubernetes_service.vuecalc.spec.0.port.0.port
    }
    rule {
      http {
        path {
          path = "/api/happy/"
          backend {
            service_name = kubernetes_service.happy.metadata.0.name
            service_port = kubernetes_service.happy.spec.0.port.0.port
          }
        }
        path {
          path = "/api/express/"
          backend {
            service_name = kubernetes_service.expressed.metadata.0.name
            service_port = kubernetes_service.expressed.spec.0.port.0.port
          }
        }
        path {
          path = "/api/bootstorage/"
          backend {
            service_name = kubernetes_service.bootstorage.metadata.0.name
            service_port = kubernetes_service.bootstorage.spec.0.port.0.port
          }
        }
      }
    }
  }
  depends_on = [helm_release.ingress-nginx]
}

#resource "kubernetes_namespace" "cert-manager" {
#  metadata {
#    name = "cert-manager"
#  }
#}
#
#resource "helm_release" "cert-manager" {
#  name       = "cert-manager"
#  repository = "https://charts.jetstack.io"
#  chart      = "cert-manager"
#
#  timeout         = 120
#  cleanup_on_fail = true
#  force_update    = true
#  namespace       = kubernetes_namespace.cert-manager.metadata.0.name
#
#  set {
#    name  = "installCRDs"
#    value = "true"
#  }
#}
