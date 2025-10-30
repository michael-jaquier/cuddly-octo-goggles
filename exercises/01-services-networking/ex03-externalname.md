# Exercise 3: ExternalName Service

**Time limit:** 3-4 minutes

## Goal
Create a Service that maps to an external DNS name.

## Requirements
1. Create Service named `gh` with:
   - Type: ExternalName
   - ExternalName: `github.com`

## Success Checks
```bash
# Should show CNAME record for github.com
kubectl run dig --rm -it --image=infoblox/dig -- dig gh.default.svc.cluster.local

# Alternative test with busybox
kubectl run busybox --rm -it --image=busybox -- nslookup gh.default.svc.cluster.local
```

## Why This Matters
ExternalName Services allow you to reference external services with internal DNS names.

## Documentation
- [Kubernetes Services - ExternalName](https://kubernetes.io/docs/concepts/services-networking/service/#externalname)

## Hints
If stuck, check `hints/ex03-externalname.yaml` for template structure.
