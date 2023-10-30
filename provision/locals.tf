locals {

  harness_platform_kubernetes_connectors = {
    "${var.gke_cluster_name}" = {
      enable             = true
      description        = "terraform generated k8s connector"
      tags               = var.tags
      project_id         = "" # harness project_id
      org_id             = "" # harness org_id
      delegate_selectors = []
      service_account = {
        credentials = {
          master_url                = "https://${var.gke_endpoint}"
          service_account_token_ref = "account.${lower(replace("${var.gke_cluster_name}_service_account_token", "/[\\s-.]/", "_"))}"
        }
      }
    }
  }
  kubernetes_ccm_connector = {
    "${var.gke_cluster_name}" = {
      enable_ccm_connector = true
      description          = "terraform generated k8s connector"
      tags                 = var.tags
      project_id           = ""
      org_id               = ""
      delegate_selectors   = []
      features_enabled     = ["VISIBILITY", "OPTIMIZATION"]
    }
  }
}
