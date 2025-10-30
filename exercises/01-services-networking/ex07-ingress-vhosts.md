# Exercise 7: Ingress - Host-Based Virtual Hosts

**Time limit:** 6-8 minutes

## Goal
Route different hosts to different backend services.

## Requirements
1. Create two Deployments and Services:
   - `shop` with image `hashicorp/http-echo:1.0` args `["-text=Shop"]`, exposed by `shop-svc` on port 5678
   - `blog` with image `hashicorp/http-echo:1.0` args `["-text=Blog"]`, exposed by `blog-svc` on port 5678
2. Create Ingress `vhost-ing` with two rules:
   - Host `shop.local` → `shop-svc:5678`
   - Host `blog.local` → `blog-svc:5678`

## Success Checks
```bash
# Test shop host
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: shop.local' http://ingress-nginx-controller.ingress-nginx.svc/

# Test blog host
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: blog.local' http://ingress-nginx-controller.ingress-nginx.svc/
```

## Why This Matters
Virtual hosting allows multiple domains to be served from one Ingress controller.

## Documentation
- [Kubernetes Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/)

## Hints
If stuck, check `hints/ex07-ingress-vhosts.yaml` for template structure.
