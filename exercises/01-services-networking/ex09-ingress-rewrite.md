# Exercise 9: Ingress - Rewrite Base Path

**Time limit:** 8-10 minutes

## Goal
Rewrite URL paths so that requests to `/store/*` hit the backend at its root `/`.

## Requirements
1. Create Deployment `store` with image `nginx:1.27`, exposed by `store-svc` on port 80
2. Create Ingress `store-rewrite-ing` with:
   - `ingressClassName: nginx`
   - Host: `store.example.com`
   - Path: `/store(/|$)(.*)` with annotation for rewrite
   - Annotations:
     - `nginx.ingress.kubernetes.io/rewrite-target: /$2`
     - `nginx.ingress.kubernetes.io/use-regex: "true"`

## Success Checks
```bash
# Request to /store/index.html should serve /index.html from backend
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: store.example.com' \
  http://ingress-nginx-controller.ingress-nginx.svc/store/
```

## Why This Matters
Path rewriting is essential when backend services don't match your URL structure.

## Documentation
- [NGINX Ingress Rewrite Examples](https://github.com/kubernetes/ingress-nginx/blob/main/docs/examples/rewrite/README.md)
- [NGINX Ingress Path Matching](https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/ingress-path-matching.md)

## Hints
If stuck, check `hints/ex09-ingress-rewrite.yaml` for template structure.
