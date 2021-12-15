terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.7.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"

    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.13.1"
    }
  }
}

provider "kubernetes" {
  host                   = var.cluster_host
  token                  = var.cluster_token
  cluster_ca_certificate = var.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = var.cluster_host
    token                  = var.cluster_token
    cluster_ca_certificate = var.cluster_ca_certificate
  }

  experiments {
    manifest = true
  }
}

provider "kubectl" {
  host                   = var.cluster_host
  token                  = var.cluster_token
  cluster_ca_certificate = var.cluster_ca_certificate

  load_config_file  = false
  apply_retry_count = 2
}