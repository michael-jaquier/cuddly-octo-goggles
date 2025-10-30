# Exercise 16: Probes Save the Day

**Time limit:** 8-10 minutes

## Goal
Add readiness and liveness probes to prevent traffic to unhealthy pods.

## Requirements
1. Create Deployment `webapp` with image `hashicorp/http-echo:1.0` (or nginx)
2. Add readiness probe:
   - HTTP GET `/healthz` on port 8080
   - InitialDelaySeconds: 5
   - PeriodSeconds: 5
3. Add liveness probe:
   - HTTP GET `/alive` on port 8080
   - InitialDelaySeconds: 10
   - PeriodSeconds: 10
4. Create a Service for the deployment
5. Simulate failure by having the probe endpoints fail

## Success Checks
```bash
# Check pod status (should show not ready if probe fails)
kubectl get pods

# Check endpoints (should not include unhealthy pods)
kubectl get endpoints

# Describe pod to see probe failures
kubectl describe pod <pod-name>
```

## Why This Matters
Probes ensure traffic is only routed to healthy pods and unhealthy pods are restarted.

## Documentation
- [Kubernetes Probes](https://kubernetes.io/docs/concepts/services-networking/service/)

## Hints
If stuck, check `hints/ex16-probes-readiness-liveness.yaml` for template structure.
