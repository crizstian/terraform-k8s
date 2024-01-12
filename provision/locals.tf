locals {

  harness_platform_kubernetes_connectors = {
    "${var.cluster_name}" = {
      enable             = true
      description        = "terraform generated k8s connector"
      tags               = var.tags
      project_id         = "" # harness project_id
      org_id             = "" # harness org_id
      delegate_selectors = []
      service_account = {
        credentials = {
          master_url                = data.aws_eks_cluster.example.endpoint
          service_account_token_ref = "account.${lower(replace("${var.cluster_name}_service_account_token", "/[\\s-.]/", "_"))}"
        }
      }
    }
  }
  kubernetes_ccm_connector = {
    "${var.cluster_name}" = {
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
