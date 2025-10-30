# Exercise 24: ServiceAccount Usage

**Time limit:** 5-7 minutes

## Goal
Create a ServiceAccount and use it in a Deployment.

## Requirements
1. Create ServiceAccount `app-sa`
2. Create Deployment `app-with-sa` that:
   - Uses `serviceAccountName: app-sa`
   - Disables automatic token mounting (`automountServiceAccountToken: false`)
   - Image: `busybox:1.36`

## Success Checks
```bash
# Verify ServiceAccount is used
kubectl get pod <pod-name> -o jsonpath='{.spec.serviceAccountName}'

# Verify token is NOT auto-mounted
kubectl exec <pod-name> -- ls /var/run/secrets/kubernetes.io/serviceaccount/ 2>&1 | grep "No such file"
```

## Why This Matters
ServiceAccounts provide pod identity for RBAC and API authentication.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex24-serviceaccount.yaml` for template structure.
