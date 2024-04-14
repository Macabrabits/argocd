helm repo add argo https://argoproj.github.io/argo-helm
helm upgrade argocd argo/argo-cd -f values.yaml -i -n argocd --create-namespace --version 6.7.11
ARGOCD_PASSWORD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`