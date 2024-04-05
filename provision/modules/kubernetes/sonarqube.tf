resource "helm_release" "sonarqube" {
  name       = "prometheus"
  repository = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart      = "sonarqube"
  version    = "1.29"
}
