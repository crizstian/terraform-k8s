output "service_account_token" {
  value = kubernetes_secret_v1.sa
}

#output "nginx_ingress" {
#  value = data.kubernetes_service.nginx_ingress.status.0.load_balancer.0.ingress[0].ip
#}

#output "helm-charts" {
#  value = [
#    "nginx-ingress",
#    "prometheus"
#  ]
#}
