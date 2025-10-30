# Exercise 21: Secrets (Env & Mounted) + Image Pull Secret

**Time limit:** 8-10 minutes

## Goal
Work with Secrets for sensitive data and image pull authentication.

## Requirements
1. Create Secret `db-secret` with:
   - `username`: `admin`
   - `password`: `supersecret`
2. Create Deployment `db-client` that:
   - Injects `username` and `password` as env vars
   - Mounts the secret under `/etc/db/`
3. Create a dummy imagePullSecret `regcred` and add to Pod spec

## Success Checks
```bash
# Check env vars
kubectl exec <pod-name> -- env | grep -i username

# Check mounted files
kubectl exec <pod-name> -- ls /etc/db/

# Verify imagePullSecret in pod spec
kubectl get pod <pod-name> -o jsonpath='{.spec.imagePullSecrets}'
```

## Why This Matters
Secrets manage sensitive data like passwords and registry credentials.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex21-secrets-env-volume.yaml` for template structure.
