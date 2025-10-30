# Exercise 27: Upgrade with Values Files

**Time limit:** 7-9 minutes

## Goal
Create a values file and use it to upgrade a Helm release.

## Requirements
1. Use the `web` release from Exercise 26 (or install it first)
2. Create `custom-values.yaml` that sets:
   - `replicaCount: 3`
   - Custom environment variable
   - Resource requests/limits
3. Run `helm upgrade` with the values file
4. Verify a new ReplicaSet was created

## Success Checks
```bash
# Check revision history
helm history web

# Check new ReplicaSet
kubectl get rs -l app.kubernetes.io/instance=web -o wide

# Verify replica count
kubectl get deploy -l app.kubernetes.io/instance=web
```

## Why This Matters
Values files allow declarative configuration management for Helm releases.

## Documentation
- [Helm Exercises](https://github.com/dgkanatsios/CKAD-exercises/blob/main/h.helm.md)

## Hints
If stuck, check `hints/ex27-helm-upgrade-values-file.yaml` for values file structure.
