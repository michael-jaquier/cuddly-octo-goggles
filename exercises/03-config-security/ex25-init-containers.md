# Exercise 25: Init Containers & Readiness Gates

**Time limit:** 7-9 minutes

## Goal
Use an initContainer to perform setup before the main container starts.

## Requirements
1. Create ConfigMap `app-config` with key `ready` value `true`
2. Create Pod `app-with-init` with:
   - InitContainer that waits for ConfigMap `app-config` to exist
     - Use `kubectl` command or simple sleep
     - Image: `busybox:1.36`
   - Main container: `nginx:1.27`

## Success Checks
```bash
# Pod should stay in Init state if ConfigMap doesn't exist
kubectl get pods

# After creating ConfigMap, pod should transition to Running
kubectl get pods
```

## Why This Matters
InitContainers ensure prerequisites are met before the main app starts.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex25-init-containers.yaml` for template structure.
