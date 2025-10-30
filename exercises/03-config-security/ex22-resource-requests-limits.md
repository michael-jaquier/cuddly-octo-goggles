# Exercise 22: Resource Requests/Limits & OOMKill Drill

**Time limit:** 8-10 minutes

## Goal
Set resource requests and limits, then observe OOMKill behavior.

## Requirements
1. Create Deployment `resource-test` with:
   - Image: `polinux/stress`
   - Resource requests: `cpu: 50m, memory: 64Mi`
   - Resource limits: `cpu: 100m, memory: 128Mi`
2. Stress the container to trigger OOMKill:
   ```bash
   kubectl exec <pod> -- stress --vm 1 --vm-bytes 150M --vm-hang 1
   ```
3. Observe OOMKill event
4. Adjust limits to allow the workload to run

## Success Checks
```bash
# Check OOMKill event
kubectl describe pod <pod-name> | grep -i oom

# Verify resource settings
kubectl get pod <pod-name> -o jsonpath='{.spec.containers[0].resources}'
```

## Why This Matters
Resource management prevents resource starvation and cluster instability.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex22-resource-requests-limits.yaml` for template structure.
