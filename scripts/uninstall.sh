ORIGIN=$(pwd)
chmod +x $ORIGIN/helm/argo-rollouts/*.sh
chmod +x $ORIGIN/helm/argocd/*.sh
chmod +x $ORIGIN/helm/argocd-apps/*.sh
chmod +x $ORIGIN/helm/istio/*.sh
echo $ORIGIN

cd helm/argocd-apps && ./uninstall.sh || true && cd $ORIGIN
cd helm/argo-rollouts && ./uninstall.sh || true && cd $ORIGIN
cd helm/argocd && ./uninstall.sh || true && cd $ORIGIN
cd helm/istio && ./uninstall.sh || true && cd $ORIGIN
kubectl delete -f k8s/addons

kubectl delete replicasets $(kubectl get replicasets | grep argocd | cut -d ' ' -f 1)

kubectl delete namespaces argo-rollouts argocd istio-system istio-ingress prometheus

