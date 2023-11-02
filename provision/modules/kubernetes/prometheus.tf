resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "52.1.0"
}

# data "kubernetes_service" "prometheus_ingress" {
#   depends_on = [resource.helm_release.prometheus]
#   metadata {
#     name = "nginx-ingress-ingress-nginx-controller"
#   }
# }