terraform {

  required_providers {
    google = {
      source = "hashicorp/aws"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    harness = {
      source = "harness/harness"
    }
  }
}

provider "aws" {}

data "aws_eks_cluster" "example" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "example" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.example.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.example.token
  alias                  = "aws"
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.example.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.example.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.example.token
  }
  alias = "aws"
}
