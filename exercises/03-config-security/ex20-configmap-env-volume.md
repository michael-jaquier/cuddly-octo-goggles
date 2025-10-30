# Exercise 20: ConfigMap → Env & Volume

**Time limit:** 7-9 minutes

## Goal
Create a ConfigMap and consume it as both environment variables and mounted files.

## Requirements
1. Create ConfigMap `app-config` with:
   - Key: `APP_COLOR` value: `blue`
   - Key: `banner.txt` value: `Welcome to CKAD!`
2. Create Deployment `app` that:
   - Injects `APP_COLOR` as environment variable
   - Mounts `banner.txt` at `/etc/banner/banner.txt`

## Success Checks
```bash
# Check env variable
kubectl exec <pod-name> -- env | grep APP_COLOR

# Check mounted file
kubectl exec <pod-name> -- cat /etc/banner/banner.txt
```

## Why This Matters
ConfigMaps separate configuration from application code.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex20-configmap-env-volume.yaml` for template structure.
