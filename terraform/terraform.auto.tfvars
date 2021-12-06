terraform_org = "invisitr"

project_name        = "DigitalOcean Kubernetes Challenge 2021"
project_description = "Demonstrates a GitOps CI/CD implementation"

cluster_name   = "do-k8s-challenge-2021"
cluster_region = "nyc3"

node_pool_name = "do-k8s-challenge-2021-worker-pool"
node_size      = "s-2vcpu-4gb"
node_count     = 3

argo_url                                    = "https://cd.invisitr.com"
argo_repo_url                               = "git@github.com:aboutflying/DigitalOcean-kubernetes-challenge-2021.git"
argo_applicationset_controller_manifest_url = "https://raw.githubusercontent.com/argoproj-labs/applicationset/v0.2.0/manifests/install.yaml"

route53_region   = "us-east-1"
route53_dns_zone = "invisitr.com"

istio_version          = "1.12.0"
certmanager_version    = "1.6.1"
argo_workflows_version = "0.9.3"
argocd_version         = "3.26.12"