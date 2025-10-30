# Exercise 26: Add Repo, Search, Install with Overrides

**Time limit:** 6-8 minutes

## Goal
Use Helm to add a repository, search for charts, and install with custom values.

## Requirements
1. Add the Bitnami Helm repository:
   ```bash
   helm repo add bitnami https://charts.bitnami.com/bitnami
   helm repo update
   ```
2. Search for `nginx` chart in the Bitnami repo
3. Install `bitnami/nginx` as release name `web` with:
   - `replicaCount=2`

## Success Checks
```bash
# Check Helm release
helm list

# Check deployment has 2 replicas
kubectl get deploy -l app.kubernetes.io/instance=web

# Check pods
kubectl get pods -l app.kubernetes.io/instance=web
```

## Why This Matters
Helm simplifies deploying complex applications with templated manifests.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)
- [Helm Exercises](https://github.com/dgkanatsios/CKAD-exercises/blob/main/h.helm.md)

## Hints
If stuck, check `hints/ex26-helm-add-search-install.sh` for command examples.
