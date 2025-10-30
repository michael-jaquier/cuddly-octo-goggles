# Exercise 28: Find Pending Helm Deployments & Rollback

**Time limit:** 6-8 minutes

## Goal
Detect a stuck Helm upgrade and rollback to a previous revision.

## Requirements
1. Install a chart (e.g., `bitnami/nginx`) as release `test-release`
2. Trigger an upgrade that will fail or get stuck:
   - Use an invalid image tag
   - Or set `progressDeadlineSeconds` very low
3. Use `helm list -A` to find stuck releases
4. Use `helm rollback` to revert to a healthy revision

## Success Checks
```bash
# List releases (should show failed/pending status)
helm list -A

# Check pods (some may be failing)
kubectl get pods

# After rollback
helm history test-release
kubectl get pods  # Should be healthy
```

## Why This Matters
Rollback capability is essential for production environments.

## Documentation
- [Helm Exercises](https://github.com/dgkanatsios/CKAD-exercises/blob/main/h.helm.md)

## Hints
If stuck, check `hints/ex28-helm-find-pending-rollback.sh` for command examples.
