locals {

  harness_platform_kubernetes_connectors = {
    "${var.gke_cluster_name}" = {
      description        = "terraform generated k8s connector"
      tags               = var.tags
      project_id         = "" # harness project_id
      org_id             = "" # harness org_id
      delegate_selectors = []
      service_account = {
        credentials = {
          master_url                = "https://${var.gke_endpoint}"
          service_account_token_ref = "${var.gke_cluster_name}_service_account_token"
        }
      }
      username_password     = {}
      inherit_from_delegate = {}
    }
  }
  kubernetes_ccm_connector = {
    "${var.gke_cluster_name}" = {
      description        = "terraform generated k8s connector"
      tags               = var.tags
      project_id         = ""
      org_id             = ""
      delegate_selectors = []
      features_enabled   = ["VISIBILITY", "OPTIMIZATION"]
    }
  }
}