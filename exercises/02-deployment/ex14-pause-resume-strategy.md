# Exercise 14: Pause, Patch, Resume Strategy

**Time limit:** 5-7 minutes

## Goal
Pause a Deployment, change its update strategy, then resume and roll out.

## Requirements
1. Use the `api` Deployment from Exercise 13 (or create a new one)
2. Pause the deployment
3. Change `maxSurge` to 2 and `maxUnavailable` to 0
4. Resume the deployment
5. Trigger an update by changing the image or environment variable

## Success Checks
```bash
# Verify paused state
kubectl rollout status deploy/api

# Verify resumed state and new ReplicaSet creation
kubectl rollout status deploy/api
kubectl get rs -l app=api
```

## Why This Matters
Pausing deployments allows you to make multiple changes before triggering a rollout.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex14-pause-resume-strategy.yaml` for command examples.
