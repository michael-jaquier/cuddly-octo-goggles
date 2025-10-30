# Exercise 10: IngressClass and Default Backend

**Time limit:** 6-8 minutes

## Goal
Create an IngressClass and configure a default backend for unmatched requests.

## Requirements
1. Check if IngressClass `nginx` exists (it should from setup). If not, create it:
   ```yaml
   apiVersion: networking.k8s.io/v1
   kind: IngressClass
   metadata:
     name: nginx
   spec:
     controller: k8s.io/ingress-nginx
   ```
2. Create a default backend:
   - Deployment `default-backend` with image `hashicorp/http-echo:1.0` args `["-text=404 Not Found"]`
   - Service `default-backend-svc` on port 5678
3. Create Ingress `with-default-ing` with:
   - `spec.defaultBackend` pointing to `default-backend-svc`
   - One rule for a specific host (e.g., `app.local`)

## Success Checks
```bash
# Request to unmatched host should hit default backend
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: unknown.local' http://ingress-nginx-controller.ingress-nginx.svc/
```

## Why This Matters
Default backends provide a fallback for unmatched requests.

## Documentation
- [Kubernetes IngressClass](https://kubernetes.io/blog/2020/04/02/improvements-to-the-ingress-api-in-kubernetes-1.18/)

## Hints
If stuck, check `hints/ex10-ingressclass-default-backend.yaml` for template structure.
