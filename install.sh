# ATTENTION, dont forget to create repository on argocd:
# name: argocd
# repository: git@github.com:Macabrabits/argocd.git
# private-key: cat ~/.ssh/id_rsa



ORIGIN=$(pwd)
chmod +x $ORIGIN/helm/argo-rollouts/*.sh
chmod +x $ORIGIN/helm/argocd/*.sh
chmod +x $ORIGIN/helm/argocd-apps/*.sh
chmod +x $ORIGIN/helm/istio/*.sh

cd helm/argocd && ./install.sh && cd $ORIGIN
cd helm/argocd-apps && ./install.sh && cd $ORIGIN
cd helm/argo-rollouts && ./install.sh && cd $ORIGIN
cd helm/istio && ./install.sh && cd $ORIGIN

k apply -f k8s/addons/prometheus.yaml
k apply -f k8s/addons/grafana.yaml
     
