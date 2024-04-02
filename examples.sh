nest g res api/otel-test
nest g res api/metrics
nest g module winston
nest g provider winston



docker build . -t monitoring-test:latest --rm


TEMPLATE=$(helm template argocd ./helmchart)
kubectl apply -f - $TEMPLATE

kubectl argo rollouts get rollout argocd

kubectl port-forward svc/argocd-server 5000:80 -n argocd > /dev/null &
kubectl port-forward svc/kiali 5001:20001 -n istio-system > /dev/null &
kubectl port-forward svc/grafana 5002:3000 -n istio-system > /dev/null &
kubectl port-forward svc/zipkin 5002:9411 -n istio-system > /dev/null &
kubectl argo rollouts dashboard > /dev/null &

pkill kubectl
jobs -l




istioctl dashboard grafana
istioctl dashboard kiali