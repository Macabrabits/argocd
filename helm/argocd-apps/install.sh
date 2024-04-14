helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade argocd-apps argo/argocd-apps -f values.yaml -i -n argocd --create-namespace --version 2.0.0


