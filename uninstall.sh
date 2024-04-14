ORIGIN=$(pwd)
chmod +x $ORIGIN/helm/argo-rollouts/*.sh
chmod +x $ORIGIN/helm/argocd/*.sh
chmod +x $ORIGIN/helm/argocd-apps/*.sh
chmod +x $ORIGIN/helm/istio/*.sh

cd helm/argocd-apps && ./uninstall.sh && cd $ORIGIN
cd helm/argo-rollouts && ./uninstall.sh && cd $ORIGIN
cd helm/argocd && ./uninstall.sh && cd $ORIGIN
cd helm/istio && ./uninstall.sh && cd $ORIGIN
kubectl delete -f k8s/addons

k delete replicasets $(k get replicasets | grep argocd | cut -d ' ' -f 1)

kubectl delete namespaces argo-rollouts argocd istio-system istio-ingress prometheus

