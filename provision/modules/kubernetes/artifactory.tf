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

