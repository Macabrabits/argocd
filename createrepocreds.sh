# curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
# sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
# rm argocd-linux-amd64

pkill kubectl
kubectl port-forward svc/argocd-server 5000:80 -n argocd > /dev/null &
ARGOCD_PASSWORD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
echo $ARGOCD_PASSWORD
argocd login localhost:5000 --username admin --password $ARGOCD_PASSWORD
argocd repocreds add git@github.com:Macabrabits --ssh-private-key-path ~/.ssh/id_rsa --upsert
argocd repo add git@github.com:Macabrabits/argocd --insecure-ignore-host-key
pkill kubectl
