#!/bin/bash

set -e

# Start Minikube
minikube start --memory=4096 --cpus=2

# Add repo and update
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Deploy
helm upgrade --install monitor prometheus-community/kube-prometheus-stack \
  -f values-prod.yaml

# Port forward
kubectl port-forward svc/monitor-grafana 3000:80
