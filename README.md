# CKAD Practice Environment

Exam-focused practice exercises for the Certified Kubernetes Application Developer (CKAD) certification, targeting weak areas: Services & Networking, Application Deployment, and Application Environment/Config/Security.

## Quick Start

```bash
# Start the cluster and install prerequisites
make start

# Verify shell environment
make shell-setup

# Start practicing (see exercises/ directory)
cd exercises/01-services-networking
cat ex01-clusterip-basics.md
```

## Prerequisites

Required tools (verified by `make verify`):
- kind v0.29.0+
- kubectl v1.32.0+
- helm v3.17.0+
- docker (running)

## Cluster Setup

The cluster is configured with:
- 1 control-plane node + 2 worker nodes
- NGINX Ingress Controller pre-installed
- Ports 30080/30443 exposed for Ingress testing

### Management Commands

```bash
make start        # Create cluster with ingress-nginx
make stop         # Delete cluster
make restart      # Recreate cluster
make context      # Set kubectl context to ckad-practice
make verify       # Check required tools
make shell-setup  # Full environment check
make status       # Show cluster status
make nodes        # List nodes
make ingress      # Check ingress controller
```

## Exercise Structure

30 exercises organized by domain:

### 1. Services & Networking (12 exercises)
Focus on Service types, Ingress routing, and NetworkPolicies.

| Exercise | Topic | Time | Path |
|----------|-------|------|------|
| 01 | ClusterIP basics | 4-6 min | `01-services-networking/ex01-clusterip-basics.md` |
| 02 | NodePort | 3-4 min | `01-services-networking/ex02-nodeport.md` |
| 03 | ExternalName | 3-4 min | `01-services-networking/ex03-externalname.md` |
| 04 | NetworkPolicy default-deny | 6-8 min | `01-services-networking/ex04-networkpolicy-default-deny.md` |
| 05 | Ingress single backend | 5-7 min | `01-services-networking/ex05-ingress-single-backend.md` |
| 06 | Ingress path splitting | 6-8 min | `01-services-networking/ex06-ingress-path-splitting.md` |
| 07 | Ingress vhosts | 6-8 min | `01-services-networking/ex07-ingress-vhosts.md` |
| 08 | Ingress TLS | 7-10 min | `01-services-networking/ex08-ingress-tls.md` |
| 09 | Ingress rewrite | 8-10 min | `01-services-networking/ex09-ingress-rewrite.md` |
| 10 | IngressClass & default backend | 6-8 min | `01-services-networking/ex10-ingressclass-default-backend.md` |
| 11 | Ingress canary (advanced) | 10+ min | `01-services-networking/ex11-ingress-canary.md` |
| 12 | NetworkPolicy egress | 8-10 min | `01-services-networking/ex12-networkpolicy-egress.md` |

### 2. Application Deployment (7 exercises)
Focus on Deployments, update strategies, and workload types.

| Exercise | Topic | Time | Path |
|----------|-------|------|------|
| 13 | Rolling update | 6-8 min | `02-deployment/ex13-rolling-update.md` |
| 14 | Pause/resume strategy | 5-7 min | `02-deployment/ex14-pause-resume-strategy.md` |
| 15 | Recreate strategy | 5-6 min | `02-deployment/ex15-recreate-strategy.md` |
| 16 | Probes (readiness/liveness) | 8-10 min | `02-deployment/ex16-probes-readiness-liveness.md` |
| 17 | Jobs & CronJobs | 6-8 min | `02-deployment/ex17-jobs-cronjobs.md` |
| 18 | Blue/Green deployment | 7-9 min | `02-deployment/ex18-blue-green-service-switch.md` |
| 19 | DaemonSet | 6-8 min | `02-deployment/ex19-daemonset-node-agent.md` |

### 3. App Environment, Config & Security (6 exercises)
Focus on ConfigMaps, Secrets, SecurityContext, and ServiceAccounts.

| Exercise | Topic | Time | Path |
|----------|-------|------|------|
| 20 | ConfigMap env & volume | 7-9 min | `03-config-security/ex20-configmap-env-volume.md` |
| 21 | Secrets & imagePullSecret | 8-10 min | `03-config-security/ex21-secrets-env-volume.md` |
| 22 | Resource requests/limits | 8-10 min | `03-config-security/ex22-resource-requests-limits.md` |
| 23 | SecurityContext | 7-9 min | `03-config-security/ex23-security-context.md` |
| 24 | ServiceAccount | 5-7 min | `03-config-security/ex24-serviceaccount.md` |
| 25 | Init containers | 7-9 min | `03-config-security/ex25-init-containers.md` |

### 4. Helm (5 exercises)
Focus on installing, upgrading, and managing Helm releases.

| Exercise | Topic | Time | Path |
|----------|-------|------|------|
| 26 | Add repo, search, install | 6-8 min | `04-helm/ex26-helm-add-search-install.md` |
| 27 | Upgrade with values file | 7-9 min | `04-helm/ex27-helm-upgrade-values-file.md` |
| 28 | Find pending & rollback | 6-8 min | `04-helm/ex28-helm-find-pending-rollback.md` |
| 29 | Install ingress-nginx | 7-9 min | `04-helm/ex29-helm-install-ingress-nginx.md` |
| 30 | Uninstall cleanly | 4-5 min | `04-helm/ex30-helm-uninstall-cleanly.md` |

## Exercise Workflow

Each exercise includes:
1. Problem statement with requirements
2. Time-box suggestion
3. Success validation commands
4. Relevant documentation links
5. Hints directory with template YAML/scripts

### Example Workflow

```bash
# 1. Read the problem
cat exercises/01-services-networking/ex01-clusterip-basics.md

# 2. Attempt the exercise (time yourself)
kubectl create deployment web --image=nginx:1.27 ...

# 3. Verify success
kubectl get endpoints web-svc

# 4. If stuck, check hints
cat exercises/01-services-networking/hints/ex01-clusterip-basics.yaml

# 5. Clean up before next exercise
kubectl delete deploy web
kubectl delete svc web-svc
```

## Ingress Testing Tips

All Ingress exercises can be tested from inside the cluster:

```bash
# Test from a temporary curl pod
kubectl run curl --rm -it --image=curlimages/curl -- \
  curl -sS -H 'Host: web.example.com' http://ingress-nginx-controller.ingress-nginx.svc/

# Or from the host (if using NodePort)
curl -H 'Host: web.example.com' http://localhost:30080/
```

## Troubleshooting

### Context Not Set
```bash
make context
# Or manually:
kubectl config use-context kind-ckad-practice
```

### Ingress Not Working
```bash
# Check controller is running
make ingress

# Verify ingress rules
kubectl get ingress -A
kubectl describe ingress <name>

# Check service endpoints
kubectl get endpoints <service-name>
```

### NetworkPolicy Not Working
NetworkPolicy requires a network plugin that supports it. Kind uses kindnet, which does NOT support NetworkPolicies by default. To test NetworkPolicies in a real environment, consider using:
- Calico
- Cilium
- Weave Net

For CKAD exam purposes, focus on understanding NetworkPolicy syntax and semantics.

## Exam Tips

1. Use imperative commands with `--dry-run=client -oyaml` to generate templates quickly
2. Memorize common shortcuts:
   - `kubectl create deployment`
   - `kubectl expose`
   - `kubectl create configmap`
   - `kubectl create secret generic`
3. Practice without hints first
4. Time yourself strictly
5. Clean up resources between exercises to simulate exam conditions

## Additional Resources

- [CKAD Curriculum](https://github.com/cncf/curriculum)
- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [NGINX Ingress Controller Docs](https://kubernetes.github.io/ingress-nginx/)
- [Helm Documentation](https://helm.sh/docs/)
- [CKAD Exercises (dgkanatsios)](https://github.com/dgkanatsios/CKAD-exercises)

## Cleanup

```bash
# Stop the cluster
make stop

# Remove all local state
kind delete cluster --name ckad-practice
```
