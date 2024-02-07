variable "gcp_project_id" {}
variable "gcp_region" {}

variable "gke_cluster_name" {}
variable "gke_endpoint" {}
variable "gke_cluster_ca_certificate" {}

variable "harness_account_id" {}
variable "harness_autostopping_token" {
  description = "ccm token"
}

variable "tags" {
  default = []
  description = "trigger demo"
}
