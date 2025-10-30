# Exercise 30: Uninstall Cleanly

**Time limit:** 4-5 minutes

## Goal
Remove a Helm release and verify all resources are cleaned up.

## Requirements
1. Use any Helm release you've installed in previous exercises
2. Run `helm uninstall <release-name> -n <namespace>`
3. Verify all Pods, Services, Deployments are removed
4. Note: CRDs are NOT removed by default

## Success Checks
```bash
# After uninstall
helm list -n <namespace>  # Should not show the release

# Check pods
kubectl get pods -n <namespace>  # Should be empty or no matching pods

# Check all resources
kubectl get all -n <namespace>
```

## Why This Matters
Clean uninstallation prevents resource leaks and namespace pollution.

## Documentation
- [Helm Exercises](https://github.com/dgkanatsios/CKAD-exercises/blob/main/h.helm.md)

## Hints
If stuck, check `hints/ex30-helm-uninstall-cleanly.sh` for command examples.
