project_name        = "DigitalOcean Kubernetes Challenge 2021"
project_description = "Demonstrates a GitOps CI/CD implementation"

cluster_name   = "do-k8s-challenge-2021"
cluster_region = "nyc3"

node_pool_name = "do-k8s-challenge-2021-worker-pool"
node_size      = "s-2vcpu-4gb"
node_count     = 3

argo_url                                    = "https://argo.invisitr.com"
argo_applicationset_controller_manifest_url = "https://raw.githubusercontent.com/argoproj-labs/applicationset/v0.2.0/manifests/install.yaml"