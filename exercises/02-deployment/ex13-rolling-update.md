# Exercise 13: Create & Roll Out a Deployment (Rolling Update)

**Time limit:** 6-8 minutes

## Goal
Create a Deployment with rolling update strategy and verify zero-downtime updates.

## Requirements
1. Create Deployment `api` with:
   - Image: `ghcr.io/nginxdemos/hello:plain-text`
   - 3 replicas
   - Strategy: RollingUpdate
   - `maxUnavailable: 1`
   - `maxSurge: 1`
2. Update the image to a different tag (e.g., `ghcr.io/nginxdemos/hello:0.3-plain-text`)
3. Verify the rollout with zero downtime

## Success Checks
```bash
# Check rollout status
kubectl rollout status deploy/api

# View rollout history
kubectl rollout history deploy/api

# Verify new pods are running
kubectl get pods -l app=api
```

## Why This Matters
Rolling updates are the standard way to update applications without downtime.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex13-rolling-update.yaml` for template structure.
