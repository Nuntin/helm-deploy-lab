#!/bin/bash

# Uninstall Helm release for Prometheus stack
helm uninstall monitor

# Delete persistent volume claims (PVCs)
kubectl delete pvc -l app.kubernetes.io/instance=monitor

# Delete remaining CRDs created by kube-prometheus-stack
kubectl delete crd alertmanagers.monitoring.coreos.com \
  podmonitors.monitoring.coreos.com \
  prometheuses.monitoring.coreos.com \
  prometheusrules.monitoring.coreos.com \
  servicemonitors.monitoring.coreos.com \
  thanosrulers.monitoring.coreos.com

# Optional: Delete configmaps and secrets (advanced cleanup)
kubectl delete cm -l app.kubernetes.io/instance=monitor
kubectl delete secret -l app.kubernetes.io/instance=monitor

# Optional: Delete service account and role bindings
# kubectl delete sa monitor-grafana
# kubectl delete clusterrolebinding monitor-prometheus

# Done
printf "\n✅ Monitoring stack removed successfully.\n"
