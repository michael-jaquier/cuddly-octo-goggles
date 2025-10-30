.PHONY: start stop restart status nodes ingress context verify shell-setup help

help:
	@echo "CKAD Practice Environment"
	@echo "========================="
	@echo ""
	@echo "Available targets:"
	@echo "  make start        - Create cluster and install ingress-nginx"
	@echo "  make stop         - Delete cluster"
	@echo "  make restart      - Delete and recreate cluster"
	@echo "  make context      - Set kubectl context to ckad-practice cluster"
	@echo "  make verify       - Verify required tools are installed"
	@echo "  make shell-setup  - Full environment check (context + connectivity)"
	@echo "  make status       - Show cluster status"
	@echo "  make nodes        - List nodes"
	@echo "  make ingress      - Check ingress controller status"
	@echo "  make help         - Show this help"

start:
	@./setup.sh

stop:
	@./cleanup.sh

restart: stop start

context:
	@echo "Setting kubectl context to ckad-practice cluster..."
	@kubectl config use-context kind-ckad-practice
	@echo ""
	@echo "Current context:"
	@kubectl config current-context

verify:
	@echo "Verifying required tools..."
	@echo ""
	@command -v kind >/dev/null 2>&1 && echo "✓ kind:    $$(kind version | head -1)" || echo "✗ kind not found"
	@command -v kubectl >/dev/null 2>&1 && echo "✓ kubectl: $$(kubectl version --client --short 2>/dev/null | head -1)" || echo "✗ kubectl not found"
	@command -v helm >/dev/null 2>&1 && echo "✓ helm:    $$(helm version --short)" || echo "✗ helm not found"
	@command -v docker >/dev/null 2>&1 && echo "✓ docker:  $$(docker version --format '{{.Client.Version}}' 2>/dev/null)" || echo "✗ docker not found"
	@echo ""
	@echo "Existing kind clusters:"
	@kind get clusters 2>/dev/null || echo "  (none)"

shell-setup:
	@echo "CKAD Practice Shell Environment Check"
	@echo "======================================"
	@echo ""
	@$(MAKE) verify
	@echo ""
	@echo "Cluster existence:"
	@kind get clusters 2>/dev/null | grep -q "^ckad-practice$$" && echo "✓ ckad-practice cluster exists" || (echo "✗ ckad-practice cluster NOT found. Run: make start"; exit 1)
	@echo ""
	@echo "Setting context..."
	@kubectl config use-context kind-ckad-practice >/dev/null 2>&1
	@echo "✓ Context set to: $$(kubectl config current-context)"
	@echo ""
	@echo "Connectivity test:"
	@kubectl cluster-info 2>/dev/null | head -1
	@kubectl get nodes --no-headers 2>/dev/null | wc -l | xargs echo "✓ Nodes reachable:"
	@echo ""
	@echo "Ready for exercises."

status:
	@echo "Cluster status:"
	@kubectl cluster-info 2>/dev/null || echo "Cluster not running"
	@echo ""
	@echo "Context:"
	@kubectl config current-context 2>/dev/null || echo "No context set"

nodes:
	@kubectl get nodes -o wide

ingress:
	@echo "Ingress controller pods:"
	@kubectl get pods -n ingress-nginx
	@echo ""
	@echo "Ingress controller service:"
	@kubectl get svc -n ingress-nginx
