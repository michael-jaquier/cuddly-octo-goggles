# Exercise 6: Ingress - Path Splitting (Two Backends)

**Time limit:** 6-8 minutes

## Goal
Route different paths to different backend services.

## Requirements
1. Create two Deployments and Services:
   - `api-deploy` with image `hashicorp/http-echo:1.0` args `["-text=API"]`, exposed by `api-svc` on port 8080
   - `web` from Exercise 1 (or create it), exposed by `web-svc` on port 80
2. Create Ingress `split-ing` with:
   - `ingressClassName: nginx`
   - Host: `app.example.com`
   - Path `/api` → `api-svc:8080` (pathType: Prefix)
   - Path `/` → `web-svc:80` (pathType: Prefix)

## Success Checks
```bash
# Test API path
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: app.example.com' http://ingress-nginx-controller.ingress-nginx.svc/api

# Test web path
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: app.example.com' http://ingress-nginx-controller.ingress-nginx.svc/
```

## Why This Matters
Path-based routing is common for microservices architectures.

## Documentation
- [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

## Hints
If stuck, check `hints/ex06-ingress-path-splitting.yaml` for template structure.
