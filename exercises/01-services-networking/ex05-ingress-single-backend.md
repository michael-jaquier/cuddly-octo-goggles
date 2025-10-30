# Exercise 5: Ingress 101 - Single Host, Single Backend

**Time limit:** 5-7 minutes

## Goal
Publish the `web` service via Ingress.

## Requirements
1. Ensure Service `web-svc` exists (from Exercise 1)
2. Create Ingress named `web-ing` with:
   - `ingressClassName: nginx`
   - Host: `web.example.com`
   - Path: `/` with `pathType: Prefix`
   - Backend: `web-svc` on port 80

## Success Checks
```bash
# From a curl pod - should return HTML
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: web.example.com' http://ingress-nginx-controller.ingress-nginx.svc/
```

## Why This Matters
Core Ingress behavior - routing HTTP traffic to Services.

## Documentation
- [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)
- [Ingress Path Types](https://kubernetes.io/docs/concepts/services-networking/ingress/#path-types)

## Hints
If stuck, check `hints/ex05-ingress-single-backend.yaml` for template structure.
