# Exercise 15: Recreate Strategy (Intentional Disruption)

**Time limit:** 5-6 minutes

## Goal
Switch a Deployment to Recreate strategy and observe the behavior.

## Requirements
1. Use the `api` Deployment from previous exercises
2. Change strategy type to `Recreate`
3. Trigger an update
4. Observe that old pods are terminated before new ones start

## Success Checks
```bash
# Watch pods during update (should see all old pods terminate first)
kubectl get pods -l app=api -w

# Verify strategy
kubectl get deploy api -o jsonpath='{.spec.strategy.type}'
```

## Why This Matters
Recreate strategy is useful when you cannot have multiple versions running simultaneously.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex15-recreate-strategy.yaml` for template structure.
