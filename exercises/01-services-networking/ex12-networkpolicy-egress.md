# Exercise 12: NetworkPolicy with Egress Control

**Time limit:** 8-10 minutes

## Goal
Allow Pods egress only to DNS (UDP/TCP 53) and a database service on port 5432.

## Requirements
1. Create namespace `egress-test`
2. Create NetworkPolicy `allow-egress-dns-db` that:
   - Applies to Pods labeled `app=webapp`
   - Allows egress to:
     - DNS (UDP/TCP port 53) to kube-dns in kube-system namespace
     - TCP port 5432 to Pods labeled `app=db`
   - Blocks all other egress
3. Create test Pods:
   - Pod `db` with label `app=db` running postgres
   - Pod `webapp` with label `app=webapp` running busybox

## Success Checks
```bash
# Should succeed - DNS query
kubectl exec webapp -n egress-test -- nslookup kubernetes.default

# Should succeed - DB connection
kubectl exec webapp -n egress-test -- nc -zv db 5432

# Should fail - arbitrary internet
kubectl exec webapp -n egress-test -- nc -zv google.com 443
```

## Why This Matters
Egress policies prevent data exfiltration and enforce network boundaries.

## Documentation
- [Kubernetes Network Policies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)
- [Declare Network Policy](https://kubernetes.io/docs/tasks/administer-cluster/declare-network-policy/)

## Hints
If stuck, check `hints/ex12-networkpolicy-egress.yaml` for template structure.
