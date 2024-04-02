docker build -t argocd-test . --target=production
docker build -t argocd-test . --target=development
docker tag argocd-test macabrabits/argocd-test:1
docker push macabrabits/argocd-test:1
docker run --rm -it argocd-test

docker rm -f $(docker ps | grep node-otel | cut -d' ' -f1)