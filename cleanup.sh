#!/usr/bin/env bash
set -euo pipefail

CLUSTER_NAME="ckad-practice"
FORCE="${1:-}"

echo "CKAD Practice Environment Cleanup"
echo "=================================="
echo ""

# Check if cluster exists
if ! kind get clusters 2>/dev/null | grep -q "^${CLUSTER_NAME}$"; then
    echo "Cluster '${CLUSTER_NAME}' does not exist. Nothing to clean up."
    exit 0
fi

# Confirm deletion unless forced
if [ "$FORCE" != "--force" ]; then
    # Check if running interactively
    if [ -t 0 ]; then
        read -p "Delete cluster '${CLUSTER_NAME}'? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            echo "Cleanup cancelled."
            exit 0
        fi
    else
        echo "Running non-interactively without --force flag. Aborting."
        exit 1
    fi
fi

echo "Deleting cluster '${CLUSTER_NAME}'..."
kind delete cluster --name "${CLUSTER_NAME}"

echo ""
echo "Cleanup complete!"
