# Exercise 19: DaemonSet for Node-Local Agent

**Time limit:** 6-8 minutes

## Goal
Run a pod on every node using a DaemonSet.

## Requirements
1. Create DaemonSet named `log-collector` with:
   - Image: `busybox:1.36`
   - Command: `tail -f /var/log/containers/*.log` (or just `sleep 3600` for simplicity)
   - HostPath volume mount:
     - Name: `logs`
     - HostPath: `/var/log/containers`
     - MountPath: `/var/log/containers`
     - ReadOnly: true

## Success Checks
```bash
# Should see one pod per node
kubectl get daemonset log-collector
kubectl get pods -l app=log-collector -o wide

# Verify pods are on different nodes
kubectl get nodes
```

## Why This Matters
DaemonSets ensure system-level agents run on every node.

## Documentation
- [CKAD Domains](https://training.linuxfoundation.org/certification/certified-kubernetes-application-developer-ckad/)

## Hints
If stuck, check `hints/ex19-daemonset-node-agent.yaml` for template structure.
