# Exercise 1: ClusterIP Basics (Labels & Selectors)

**Time limit:** 4-6 minutes

## Goal
Expose a 3-replica nginx Deployment internally on port 80.

## Requirements
1. Create Deployment named `web` with:
   - Image: `nginx:1.27`
   - Label: `app=web`
   - 3 replicas
2. Create Service named `web-svc` with:
   - Type: ClusterIP
   - Port: 80
   - TargetPort: 80
   - Selector: `app=web`

## Success Checks
```bash
# Should show 3 endpoint addresses
kubectl get endpoints web-svc

# From a curl pod - should return HTML
kubectl run curl --rm -it --image=curlimages/curl -- curl -sS web-svc
```

## Why This Matters
Understanding the Service model and EndpointSlices is fundamental for CKAD.

## Documentation
- [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/)

## Hints
If stuck, check `hints/ex01-clusterip-basics.yaml` for template structure.
