#!/bin/bash

# Add ingress-nginx repository
# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx

# Update repositories
# helm repo update

# Install ingress-nginx
# helm install ingress-nginx ingress-nginx/ingress-nginx \
#   -n ingress-nginx-test \
#   --create-namespace \
#   --set controller.service.type=NodePort

# Wait for deployment
# kubectl wait --namespace ingress-nginx-test \
#   --for=condition=ready pod \
#   --selector=app.kubernetes.io/component=controller \
#   --timeout=300s

# Check release
# helm list -n ingress-nginx-test

# Check pods
# kubectl get pods -n ingress-nginx-test

# Check service
# kubectl get svc -n ingress-nginx-test

# Uninstall when done
# helm uninstall ingress-nginx -n ingress-nginx-test
