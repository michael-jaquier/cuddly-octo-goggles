# Exercise 29: Install ingress-nginx via Helm

**Time limit:** 7-9 minutes

## Goal
Install the NGINX Ingress Controller using Helm (practice for Ingress exercises).

## Requirements
1. Add the ingress-nginx Helm repository:
   ```bash
   helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
   helm repo update
   ```
2. Install ingress-nginx in namespace `ingress-nginx-test`:
   ```bash
   helm install ingress-nginx ingress-nginx/ingress-nginx \
     -n ingress-nginx-test --create-namespace
   ```
3. Verify the controller pods are running
4. Check the Service type (LoadBalancer or NodePort)

## Success Checks
```bash
# Check Helm release
helm list -n ingress-nginx-test

# Check controller pods
kubectl get pods -n ingress-nginx-test

# Check service
kubectl get svc -n ingress-nginx-test
```

## Why This Matters
This provides the target for your Ingress exercises and demonstrates Helm chart installation.

## Documentation
- [Artifact Hub - ingress-nginx](https://artifacthub.io/packages/helm/ingress-nginx/ingress-nginx)

## Hints
If stuck, check `hints/ex29-helm-install-ingress-nginx.sh` for command examples.
