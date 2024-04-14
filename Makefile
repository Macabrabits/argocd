#Install all necessary k8s helm charts and manifests
install:
	scripts/install.sh

uninstall:
	scripts/uninstall.sh


#Port Forward
pf-argocd:
	kubectl port-forward svc/argocd-server 5000:80 -n argocd > /dev/null &

pf-grafana:	
	kubectl port-forward svc/grafana 5002:3000 -n istio-system > /dev/null &

pf-rollouts:
	kubectl argo rollouts dashboard > /dev/null &

pf-kill:
	pkill kubectl


get-admin-password:
	ARGOCD_PASSWORD=`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d` && echo $$ARGOCD_PASSWORD
	