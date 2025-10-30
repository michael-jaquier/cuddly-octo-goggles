#!/bin/bash

# Add Bitnami repository
# helm repo add bitnami https://charts.bitnami.com/bitnami

# Update repositories
# helm repo update

# Search for nginx chart
# helm search repo nginx

# Install with overrides
# helm install web bitnami/nginx --set replicaCount=2

# Check release
# helm list

# Check deployment
# kubectl get deploy -l app.kubernetes.io/instance=web

# Uninstall when done
# helm uninstall web
