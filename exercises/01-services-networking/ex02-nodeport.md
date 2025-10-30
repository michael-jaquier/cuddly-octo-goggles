# Exercise 2: NodePort for Quick Host Access

**Time limit:** 3-4 minutes

## Goal
Make the `web` Deployment reachable from nodes.

## Requirements
1. Use the existing `web` Deployment from Exercise 1 (or create it if you haven't)
2. Create or modify a Service named `web-nodeport` with:
   - Type: NodePort
   - Port: 80
   - TargetPort: 80
   - NodePort: any valid port (let Kubernetes assign or choose 30000-32767)
   - Selector: `app=web`

## Success Checks
```bash
# Should show NodePort type and assigned nodePort
kubectl get svc web-nodeport -o wide

# Test from your host machine (get the nodePort first)
NODE_PORT=$(kubectl get svc web-nodeport -o jsonpath='{.spec.ports[0].nodePort}')
curl localhost:$NODE_PORT
```

## Why This Matters
NodePort Services expose applications directly on cluster nodes.

## Documentation
- [Kubernetes Services - NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport)

## Hints
If stuck, check `hints/ex02-nodeport.yaml` for template structure.
