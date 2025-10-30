#!/bin/bash

# Uninstall a release
# helm uninstall <release-name> -n <namespace>

# Example with web release
# helm uninstall web

# Example with ingress-nginx
# helm uninstall ingress-nginx -n ingress-nginx-test

# Verify release is gone
# helm list -A

# Check pods are deleted
# kubectl get pods -n <namespace>

# Check all resources
# kubectl get all -n <namespace>

# Delete namespace if desired
# kubectl delete namespace <namespace>

# Note: CRDs are NOT removed automatically
# To remove CRDs (be careful!):
# kubectl get crd | grep <chart-name>
# kubectl delete crd <crd-name>
