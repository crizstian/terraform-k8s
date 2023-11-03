resource "helm_release" "artifactory" {
  name       = "artifactory"
  repository = "https://charts.jfrog.io"
  chart      = "artifactory-oss"
  version    = "107.71.3"
  set {
    name  = "artifactory.nginx.enabled"
    value = "true"
  }

  set {
    name  = "artifactory.ingress.enabled"
    value = "false"
  }
}

# data "kubernetes_service" "prometheus_ingress" {
#   depends_on = [resource.helm_release.prometheus]
#   metadata {
#     name = "nginx-ingress-ingress-nginx-controller"
#   }
# }
