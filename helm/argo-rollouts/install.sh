helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade argo-rollouts argo/argo-rollouts -f values.yaml -i -n argo-rollouts --create-namespace