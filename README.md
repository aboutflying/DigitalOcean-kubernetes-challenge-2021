# **[DigitalOcean Kubernetes Challenge 2021](https://www.digitalocean.com/community/pages/kubernetes-challenge)**

## **Challenge: Deploy a GitOps CI/CD implementation**

### **Highlights**

- [Argo](https://argoproj.github.io/)-based [CI/CD](https://en.wikipedia.org/wiki/CI/CD) solution - [ArgoCD](https://argoproj.github.io/cd) (feat. [ApplicationSets](https://argocd-applicationset.readthedocs.io/en/stable/) & [Image Updater](https://argocd-image-updater.readthedocs.io/en/stable/)), [Workflows](https://argoproj.github.io/argo-workflows/), [Rollouts](https://argoproj.github.io/argo-rollouts/)
    - CI workflow utilzing [jq](https://stedolan.github.io/jq/) and [BuildKit](https://github.com/moby/buildkit)
- [DigitalOcean](https://www.digitalocean.com) Kubernetes cluster & Argo platform bootstrapped with [Terraform](https://terraform.io)
    - Implements [cert-manager](https://cert-manager.io/) and [Istio](https://istio.io/) mainly for ingress

### **Links**
- https://ci.invisitr.com - Argo Workflows - DM **@reverse** in the Discord channel if you'd like access to poke around and break things
- https://cd.invisitr.com - ArgoCD
- https://node-demo-app.invisitr.com - Node.js-based app - targets **blue** during blue/green deploy
  - https://node-demo-app-vnext.invisitr.com - targets **green**

### **CI/CD workflow**

![if you're frustrated, it's because you're doing it wrong](/img/cicd.drawio.png)

1. Git commit and push to main with ```*build*``` in commit message
2. Argo Workflow execution
3. Container image build and publish to DockerHub
4. Argo Image Updater polls DockerHub for image updates
5. Argo Image Updater commits image version to main branch
6. ArgoCD polls main branch and syncs workloads
7. Argo Rollout is updated with new image version
8. Rollout to green
9. Rollout to blue

### **References**

- https://argoproj.github.io/
- https://terraform.io/language/
- https://github.com/terraform-docs/
- https://github.com/moby/buildkit/
- https://stedolan.github.io/jq/
- https://stackoverflow.com/