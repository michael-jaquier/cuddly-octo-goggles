# Exercise 23: Pod & Container SecurityContext

**Time limit:** 7-9 minutes

## Goal
Configure security settings to run as non-root with a read-only filesystem.

## Requirements
1. Create Pod `secure-pod` with:
   - Image: `busybox:1.36`
   - SecurityContext:
     - Run as UID: 1000
     - ReadOnlyRootFilesystem: true
     - Drop capability: `NET_RAW`
   - EmptyDir volume mounted at `/tmp` (for writable space)

## Success Checks
```bash
# Check UID
kubectl exec secure-pod -- id

# Try to write to root (should fail)
kubectl exec secure-pod -- touch /test.txt

# Write to /tmp should succeed
kubectl exec secure-pod -- touch /tmp/test.txt

# Check capabilities (NET_RAW should not be present)
kubectl exec secure-pod -- cat /proc/1/status | grep Cap
```

## Why This Matters
SecurityContext reduces attack surface and enforces least-privilege principles.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex23-security-context.yaml` for template structure.
