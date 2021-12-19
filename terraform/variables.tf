variable "terraform_org" {
  type = string
}

variable "do_token" {
  type      = string
  sensitive = true
}

variable "project_name" {
  type        = string
  description = "The name of the DO project"
}

variable "project_description" {
  type        = string
  description = "Description of the DO project"
}

variable "cluster_name" {
  type        = string
  description = "A name for the Kubernetes cluster"
}

variable "cluster_region" {
  type        = string
  description = "The slug identifier for the region where the Kubernetes cluster will be created"
}

variable "node_pool_name" {
  type        = string
  description = "A name for the node pool"
}

variable "node_size" {
  type        = string
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool"
}

variable "node_count" {
  type        = number
  description = "The number of Droplet instances in the node pool"
}

variable "argo_url" {
  type        = string
  description = "Argo CD's externally facing base URL (optional)"
  default     = ""
}

variable "argo_applicationset_controller_manifest_url" {
  type        = string
  description = "URL to the Argo CD ApplicationSet Controller manifest"
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
  type      = string
  sensitive = true
}

variable "route53_region" {
  type = string
}

variable "route53_dns_zone" {
  type = string
}

variable "letsencrypt_email" {
  type      = string
  sensitive = true
}

variable "istio_version" {
  type = string
}

variable "istio_prometheus_manifest_url" {
  type = string
}

variable "argo_workflows_version" {
  type = string
}

variable "argo_rollouts_version" {
  type = string
}

variable "argocd_version" {
  type = string
}

variable "argocd_image_updater_version" {
  type = string
}

variable "certmanager_version" {
  type = string
}

variable "argo_repo_url" {
  type = string
}

variable "ssh_private_key" {
  type      = string
  sensitive = true
}

variable "github_webhook_secret" {
  type      = string
  sensitive = true
}

variable "dockerhub_api_key" {
  type      = string
  sensitive = true
}