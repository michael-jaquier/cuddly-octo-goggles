#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="ckad-practice"

echo "CKAD Practice Environment Cleanup"
echo "=================================="
echo ""

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "Cluster '${CLUSTER_NAME}' does not exist. Nothing to clean up."
    exit 0
fi

# Confirm deletion
read -p "Delete cluster '${CLUSTER_NAME}'? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Cleanup cancelled."
    exit 0
fi

echo "Deleting cluster '${CLUSTER_NAME}'..."
kind delete cluster --name "${CLUSTER_NAME}"

echo ""
echo "Cleanup complete!"
