helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm upgrade istio-base istio/base -i -n istio-system --create-namespace --set defaultRevision=default --version 1.21.1
helm install istiod istio/istiod -n istio-system --wait --version 1.21.1
helm upgrade -i istio-ingressgateway istio/gateway -n istio-system --create-namespace --wait -f ingressgateway-values.yaml --version 1.21.1