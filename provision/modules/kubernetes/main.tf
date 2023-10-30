resource "kubernetes_service_account_v1" "sa" {
  metadata {
    name      = "harness-key"
    namespace = "default"
  }
}

resource "kubernetes_cluster_role_binding" "role_binding" {
  metadata {
    name = "harness-admin"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "harness-key"
    namespace = "default"
  }
}

resource "kubernetes_secret_v1" "sa" {
  metadata {
    name = "harness-key-token"
    annotations = {
      "kubernetes.io/service-account.name" = "harness-key"
    }
  }
  type = "kubernetes.io/service-account-token"
}