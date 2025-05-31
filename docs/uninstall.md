# 🧹 Uninstall Monitoring Stack (Minikube / K3s)

This guide explains how to **remove the Prometheus + Grafana monitoring stack** installed via Helm, including cleaning up persistent data and custom resources.

> Applies to both **Minikube** and **K3s** deployments

---

## 🔁 Option 1: Auto Cleanup (Recommended)

Use the provided script to uninstall everything safely:

```bash
chmod +x uninstall.sh
./uninstall.sh
```

This will:
- Uninstall the Helm release (`monitor`)
- Delete persistent volume claims (PVC)
- Remove CRDs created by `kube-prometheus-stack`
- Delete ConfigMaps and Secrets with matching labels

---

## 🔧 Option 2: Manual Cleanup

### 1. Uninstall Helm Release
```bash
helm uninstall monitor
```

### 2. Delete Persistent Volume Claims
```bash
kubectl delete pvc -l app.kubernetes.io/instance=monitor
```

### 3. Remove CRDs (Custom Resource Definitions)
```bash
kubectl delete crd alertmanagers.monitoring.coreos.com \
  podmonitors.monitoring.coreos.com \
  prometheuses.monitoring.coreos.com \
  prometheusrules.monitoring.coreos.com \
  servicemonitors.monitoring.coreos.com \
  thanosrulers.monitoring.coreos.com
```

### 4. Optional Cleanup (Advanced)
```bash
kubectl delete cm -l app.kubernetes.io/instance=monitor
kubectl delete secret -l app.kubernetes.io/instance=monitor
```

---

## ✅ Final Result
After cleanup, the monitoring stack and related resources will be fully removed from your cluster.

You can verify by running:
```bash
kubectl get all | grep monitor
```

---

## 📎 Related
- [uninstall.sh](../uninstall.sh): Cleanup script