output "connectors" {
  value = module.harness_connectors.all
}
output "ingress" {
  value = module.kubernets_harness.nginx-ingress
}
