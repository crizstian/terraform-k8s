terraform {
  backend "gcs" {
    bucket = "crizstian-terraform"
    prefix = "cristian-citibanamex-k8s"
  }

  required_providers {
    google = {
      source = "hashicorp/google"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${var.gke_endpoint}"
  cluster_ca_certificate = base64decode(var.gke_cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}
