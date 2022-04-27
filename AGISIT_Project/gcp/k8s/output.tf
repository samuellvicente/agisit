resource "local_file" "ingressIP" {
  content = templatefile("${path.module}/templates/ingressIP.tmpl", {
    ip = kubernetes_ingress.ingress.status.0.load_balancer.0.ingress.0.ip
  })
  filename = "ingressIP.md"
}
