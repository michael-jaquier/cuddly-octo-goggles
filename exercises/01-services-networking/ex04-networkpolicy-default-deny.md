# Exercise 4: Default-Deny NetworkPolicy (Ingress)

**Time limit:** 6-8 minutes

## Goal
Block all ingress traffic to Pods in a namespace, then create a specific allow rule.

## Requirements
1. Create namespace `netpol`
2. Create a default-deny ingress NetworkPolicy:
   - Name: `default-deny-ingress`
   - Empty `podSelector: {}` (applies to all pods)
   - `policyTypes: ["Ingress"]`
3. Create allow rule NetworkPolicy:
   - Name: `allow-frontend-to-backend`
   - Allow Pods labeled `role=frontend` to reach Pods labeled `role=backend`
   - On TCP port 6379
4. Create test Pods:
   - Pod `backend` with label `role=backend` running redis
   - Pod `frontend` with label `role=frontend` running busybox
   - Pod `other` with no role label

## Success Checks
```bash
# From frontend pod - should succeed
kubectl exec frontend -n netpol -- nc -zv backend 6379

# From other pod - should fail/timeout
kubectl exec other -n netpol -- nc -zv backend 6379
```

## Why This Matters
NetworkPolicies are essential for securing pod-to-pod communication.

## Documentation
- [Kubernetes NetworkPolicies](https://kubernetes.io/docs/concepts/services-networking/network-policies/)

## Hints
If stuck, check `hints/ex04-networkpolicy-default-deny.yaml` for template structure.
