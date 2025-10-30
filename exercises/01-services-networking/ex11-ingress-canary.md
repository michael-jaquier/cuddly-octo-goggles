# Exercise 11: Ingress Canary (Optional/Advanced)

**Time limit:** 10+ minutes

## Goal
Send ~20% of traffic to a canary version using NGINX-specific annotations.

## Requirements
1. Create two Deployments:
   - `web-stable` with image `hashicorp/http-echo:1.0` args `["-text=Stable"]`
   - `web-canary` with image `hashicorp/http-echo:1.0` args `["-text=Canary"]`
2. Create two Services:
   - `web-stable-svc` on port 5678
   - `web-canary-svc` on port 5678
3. Create two Ingresses:
   - Primary Ingress `web-primary` → `web-stable-svc`
   - Canary Ingress `web-canary` with annotations:
     - `nginx.ingress.kubernetes.io/canary: "true"`
     - `nginx.ingress.kubernetes.io/canary-weight: "20"`

## Success Checks
```bash
# Run multiple requests and observe ~20% canary responses
for i in {1..10}; do
  kubectl run curl-$i --rm -it --image=curlimages/curl -- \
    curl -sS -H 'Host: web.example.com' http://ingress-nginx-controller.ingress-nginx.svc/
done
```

## Why This Matters
Canary deployments allow gradual rollout with traffic splitting.

## Note
This is NGINX-specific and not part of core CKAD—treat as enrichment.

## Documentation
- [NGINX Ingress Canary](https://github.com/kubernetes/ingress-nginx)

## Hints
If stuck, check `hints/ex11-ingress-canary.yaml` for template structure.
