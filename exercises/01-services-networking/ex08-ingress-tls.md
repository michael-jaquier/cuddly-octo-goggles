# Exercise 8: Ingress + TLS Termination

**Time limit:** 7-10 minutes

## Goal
Terminate TLS at the Ingress controller.

## Requirements
1. Generate a self-signed certificate:
   ```bash
   openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
     -keyout shop.key -out shop.crt -subj "/CN=shop.local/O=shop"
   ```
2. Create Secret `shop-tls` with:
   - `tls.crt` from shop.crt
   - `tls.key` from shop.key
3. Create or reuse `shop` Deployment and `shop-svc` from Exercise 7
4. Create Ingress `shop-tls-ing` with:
   - Host: `shop.local`
   - TLS section referencing `shop-tls` Secret

## Success Checks
```bash
# Test HTTPS (ignore cert validation)
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -k -sS -H 'Host: shop.local' https://ingress-nginx-controller.ingress-nginx.svc/

# Verify TLS section in Ingress
kubectl describe ing shop-tls-ing
```

## Why This Matters
TLS termination at Ingress is standard practice for securing HTTP traffic.

## Documentation
- [Kubernetes Ingress TLS](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls)

## Hints
If stuck, check `hints/ex08-ingress-tls.yaml` for template structure.
