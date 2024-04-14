ORIGIN=$(pwd)
chmod +x $ORIGIN/helm/argo-rollouts/*.sh
chmod +x $ORIGIN/helm/argocd/*.sh
chmod +x $ORIGIN/helm/argocd-apps/*.sh
chmod +x $ORIGIN/helm/istio/*.sh

cd helm/argocd && ./install.sh && cd $ORIGIN
cd helm/argocd-apps && ./install.sh && cd $ORIGIN
cd helm/argo-rollouts && ./install.sh && cd $ORIGIN
cd helm/istio && ./install.sh && cd $ORIGIN
scripts/createrepocreds.sh

kubectl apply -f k8s/addons/prometheus.yaml
kubectl apply -f k8s/addons/grafana.yaml

ARGOCD_PASSWORD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`

echo ' '
echo USERNAME: admin
echo PASSWORD: $ARGOCD_PASSWORD