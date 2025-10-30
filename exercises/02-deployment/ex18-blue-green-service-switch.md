# Exercise 18: Blue/Green via Service Selector Switch

**Time limit:** 7-9 minutes

## Goal
Implement blue/green deployment by switching Service selectors.

## Requirements
1. Create two Deployments:
   - `api-blue` with label `version=blue`, image `hashicorp/http-echo:1.0` args `["-text=Blue"]`
   - `api-green` with label `version=green`, image `hashicorp/http-echo:1.0` args `["-text=Green"]`
2. Create Service `api-svc` initially pointing to `version=blue`
3. Test the service
4. Switch to green by changing the Service selector to `version=green`
5. Verify the switch without recreating the Service

## Success Checks
```bash
# Check initial endpoints
kubectl get endpoints api-svc

# After selector change, endpoints should point to green pods
kubectl get endpoints api-svc

# Test from curl pod
kubectl run curl --rm -it --image=curlimages/curl -- curl -sS api-svc:8080
```

## Why This Matters
Blue/green deployments enable instant rollback and zero-downtime deployments.

## Documentation
- [Kubernetes Services](https://kubernetes.io/docs/concepts/services-networking/service/)

## Hints
If stuck, check `hints/ex18-blue-green-service-switch.yaml` for template structure.
