#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="ckad-practice"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "CKAD Practice Environment Setup"
echo "================================"
echo ""

# Check if cluster already exists
if kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "Cluster '${CLUSTER_NAME}' already exists."
    read -p "Delete and recreate? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Deleting existing cluster..."
        kind delete cluster --name "${CLUSTER_NAME}"
    else
        echo "Aborting setup."
        exit 0
    fi
fi

# Create kind cluster
echo "Creating kind cluster with 1 control-plane + 2 workers..."
kind create cluster --config "${SCRIPT_DIR}/kind-config.yaml"

# Wait for cluster to be ready
echo ""
echo "Waiting for cluster nodes to be ready..."
kubectl wait --for=condition=Ready nodes --all --timeout=300s

# Add ingress-nginx helm repo
echo ""
echo "Adding ingress-nginx Helm repository..."
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update

# Install ingress-nginx
echo ""
echo "Installing ingress-nginx controller..."
helm install ingress-nginx ingress-nginx/ingress-nginx \
    --namespace ingress-nginx \
    --create-namespace \
    --set controller.service.type=NodePort \
    --set controller.service.nodePorts.http=30080 \
    --set controller.service.nodePorts.https=30443 \
    --set controller.nodeSelector."ingress-ready"=true \
    --set controller.tolerations[0].key=node-role.kubernetes.io/control-plane \
    --set controller.tolerations[0].operator=Equal \
    --set controller.tolerations[0].effect=NoSchedule \
    --wait \
    --timeout 5m

# Verify ingress controller is running
echo ""
echo "Verifying ingress-nginx controller..."
kubectl wait --namespace ingress-nginx \
    --for=condition=ready pod \
    --selector=app.kubernetes.io/component=controller \
    --timeout=300s

echo ""
echo "Setup complete!"
echo ""
echo "Cluster info:"
kubectl cluster-info
echo ""
echo "Nodes:"
kubectl get nodes -o wide
echo ""
echo "Ingress controller:"
kubectl get pods -n ingress-nginx
echo ""
echo "Ready for CKAD exercises. See exercises/ directory."
