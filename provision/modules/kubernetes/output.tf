output "service_account_token" {
  value = kubernetes_secret_v1.sa
}

output "nginx-ingress" {
  value = data.kubernetes_service.nginx_ingress
}
