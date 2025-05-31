# ⚙️ Minikube Bootstrap Guide

This guide provides a real-world, step-by-step bootstrap process for deploying the **kube-prometheus-stack** on a local Minikube cluster.
It's designed for DevOps engineers who want to demonstrate monitoring skills without needing any cloud infrastructure.

> Author: **Nuntin Padmadin**

---

## 🧰 Prerequisites (Confirmed Working on Windows)

| Tool     | Version Recommended   | Description                    |
| -------- | --------------------- | ------------------------------ |
| Minikube | v1.33.1+              | Local Kubernetes cluster       |
| Helm     | v3.14+                | Kubernetes package manager     |
| kubectl  | v1.29+                | Kubernetes CLI                 |
| Docker   | Docker Desktop or CLI | Required for container runtime |

Ensure all tools are added to your `PATH` environment variable.

---

## 🚀 Step-by-Step Bootstrap

### 1️⃣ Start Minikube

```bash
minikube start --memory=4096 --cpus=2
```

> You can adjust memory/CPU based on your machine.

### 2️⃣ Add Prometheus Helm Repo

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

### 3️⃣ Clone the Lab Repo

```bash
git clone https://github.com/Nuntin/helm-deploy-lab.git
cd helm-deploy-lab
```

### 4️⃣ Deploy Monitoring Stack

```bash
helm upgrade --install monitor prometheus-community/kube-prometheus-stack \
  -f values-prod.yaml
```

> Takes \~2 minutes. Ensure pods are running via:

```bash
kubectl get pods
```

### 5️⃣ Access Grafana Dashboard

```bash
kubectl port-forward svc/monitor-grafana 3000:80
```

Then open: [http://localhost:3000](http://localhost:3000)

Get password:

```bash
kubectl get secret monitor-grafana -o jsonpath="{.data.admin-password}" | kubectl neat | powershell -Command "[System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String((Get-Content -)))"
```

Login:

```
Username: admin
Password: SuperSecure123 (or your decoded result)
```

---

## ✅ Next Steps

* 🧹 To uninstall: see `docs/uninstall.sh`
* 📊 For dashboard usage: see `docs/grafana-dashboards.md`
* 📎 To update this stack: run `helm upgrade` again with new values

---

🛡️ Built and tested on **Minikube with Windows + Docker Desktop**

---

> 💬 For questions, contact [Nuntin Padmadin](https://github.com/Nuntin)
