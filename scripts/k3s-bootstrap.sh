#!/bin/bash

# k3s-bootstrap.sh - Install K3s and deploy Prometheus + Grafana via Helm

set -e

### Step 1: Install K3s
curl -sfL https://get.k3s.io | sh -

# Wait for K3s to be ready
sleep 15
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

### Step 2: Install Helm (if not available)
if ! command -v helm &> /dev/null; then
  curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
fi

### Step 3: Add Helm repo & update
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

### Step 4: Deploy Prometheus + Grafana
helm upgrade --install monitor prometheus-community/kube-prometheus-stack \
  -f values-prod.yaml

### Step 5: Show Grafana password
kubectl get secret monitor-grafana -o jsonpath="{.data.admin-password}" | base64 -d && echo

### Step 6: Port-forward Grafana (port 3000)
kubectl port-forward svc/monitor-grafana 3000:80

# Done
