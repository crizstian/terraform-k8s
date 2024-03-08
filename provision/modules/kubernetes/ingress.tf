resource "helm_release" "release" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.8.3"

  set {
    name  = "controller.publishService.enabled"
    value = "true"
  }

  set {
    name  = "controller.allowSnippetAnnotations"
    value = "true"
  }
}

data "kubernetes_service" "nginx_ingress" {
  depends_on = [resource.helm_release.release]
  metadata {
    name = "nginx-ingress-ingress-nginx-controller"
  }
}
