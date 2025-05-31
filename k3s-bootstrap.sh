#!/bin/bash

# 📦 Install K3s (lightweight Kubernetes)
# This script sets up a single-node K3s cluster on Linux for local testing
# Author: Nuntin Padmadin

set -e

# 1. Update system
sudo apt update && sudo apt upgrade -y

# 2. Install K3s via official script
curl -sfL https://get.k3s.io | sh -

# 3. Check service
sudo systemctl status k3s

# 4. Set KUBECONFIG environment variable
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

echo "✅ K3s installed and configured. Run 'kubectl get nodes' to check cluster status."

echo "💡 TIP: You may need to copy /etc/rancher/k3s/k3s.yaml to ~/.kube/config on non-root users."
