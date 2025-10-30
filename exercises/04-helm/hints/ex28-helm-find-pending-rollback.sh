#!/bin/bash

# Install initial release
# helm install test-release bitnami/nginx

# Trigger a failed upgrade (invalid image)
# helm upgrade test-release bitnami/nginx --set image.tag=invalid-tag-999

# List all releases (look for failed/pending)
# helm list -A

# Check pod status
# kubectl get pods -l app.kubernetes.io/instance=test-release

# View history
# helm history test-release

# Rollback to previous revision (e.g., revision 1)
# helm rollback test-release 1

# Verify rollback
# helm history test-release
# kubectl get pods -l app.kubernetes.io/instance=test-release

# Cleanup
# helm uninstall test-release
