variable "cluster_host" {
  type = string
}

variable "cluster_token" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

variable "argo_applicationset_controller_manifest_url" {
  type = string
}

variable "argo_url" {
  type = string
}

variable "route53_credentials_secret_access_key" {
  type      = string
  sensitive = true
}

variable "route53_credentials_access_key_id" {
  type      = string
  sensitive = true
}

variable "route53_hosted_zone_id" {
  type = string
}

variable "route53_region" {
  type = string
}

variable "route53_dns_zone" {
  type = string
}

variable "letsencrypt_email" {
  type = string
}

variable "istio_version" {
  type = string
}

variable "argo_version" {
  type = string
}

variable "certmanager_version" {
  type = string
}

variable "argo_repo_url" {
  type = string
}

variable "ssh_private_key_path" {
  type = string
}

variable "tekton_manifest_url" {
  type = string
}

variable "tekton_dashboard_manifest_url" {
  type = string
}

variable "tekton_triggers_release_manifest_url" {
  type = string
}

variable "tekton_triggers_interceptors_manifest_url" {
  type = string
}