# 🚀 Local Deployment Guide (Minikube)

This document walks through deploying the monitoring stack locally on Minikube, intended for demonstration, testing, and portfolio building without requiring any cloud budget.

> Author: **Nuntin Padmadin**

---

## ⚙️ Prerequisites

* ✅ Docker Desktop (or Hyper-V)
* ✅ [Minikube installed](https://minikube.sigs.k8s.io/docs/start/)
* ✅ Helm 3.x
* ✅ kubectl installed and configured

---

## 🛠️ Steps

### 1. Start Minikube

```bash
minikube start --memory=4096 --cpus=2
```

### 2. Add Helm Chart Repo

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

### 3. Deploy the Monitoring Stack

```bash
helm upgrade --install monitor prometheus-community/kube-prometheus-stack \
  -f values-prod.yaml
```

### 4. Forward Grafana Port

```bash
kubectl port-forward svc/monitor-grafana 3000:80
```

Access Grafana at: [http://localhost:3000](http://localhost:3000)

Get the password:

```bash
kubectl get secret monitor-grafana -o jsonpath="{.data.admin-password}" | base64 -d
```

Username: `admin`

---

## 📜 Automation Script

To make deployment faster:

```bash
bash scripts/deploy-local.sh
```

This script handles all steps above, including Helm install and port-forward.

---

## 🧪 Verified Environments

| Platform           | Status     | Note                             |
| ------------------ | ---------- | -------------------------------- |
| Windows + Minikube | ✅ OK       | Verified with Docker Desktop     |
| macOS + Minikube   | ✅ OK       | Native Minikube supported        |
| Linux (K3s)        | 🟡 Pending | Separate guide in `bootstrap.md` |

---

## ✅ Outcome

* Prometheus and Grafana running locally
* Ready-to-show Grafana dashboards
* Fully documented for portfolio / job application

---

## 🔗 Related

* [bootstrap.md](./bootstrap.md) – K3s deployment
* [minikube-monitoring.md](./minikube-monitoring.md) – Minikube deep dive
* [scenarios.md](./scenarios.md) – Use cases
* [grafana-dashboards.md](./grafana-dashboards.md) – Dashboard views
