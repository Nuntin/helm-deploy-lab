# 🧠 Helm Deploy Lab – Real Use Case

This project demonstrates how to use **Helm** to deploy a production-grade monitoring stack on a real Kubernetes cluster (K3s on AWS EC2 or Minikube), complete with custom configurations, alert rules, and GitLab CI/CD integration.

> 🎯 **Goal:** To prove that I don’t just run `helm install`, but understand how to integrate, customize, and operate Helm deployments in a real-world DevOps workflow.

---

## 📦 Features

| Capability                  | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| Kubernetes Cluster         | K3s on EC2 or Minikube (Local)                                              |
| Helm Deployment            | Deploy Prometheus, Grafana, Alertmanager                                   |
| Custom Values              | `values-prod.yaml` overrides retention, alert rules, persistence, ports     |
| GitLab CI/CD               | Auto-deploy Helm charts on code push                                       |
| Docs & Dashboard           | Markdown dashboard export + alert flow demo                                |
| Clean Uninstall            | Script to remove release and clean up volumes                              |

---

## 🔧 Project Structure

```bash
helm-deploy-lab/
├── k3s-bootstrap.sh          # Install K3s on EC2 instance
├── values-prod.yaml          # Custom Helm values for Prometheus stack
├── .gitlab-ci.yml            # CI/CD pipeline to deploy via Helm
├── uninstall.sh              # Cleanly uninstall Helm release
├── docs/
│   ├── grafana-dashboards.md # Sample dashboards and usage tips
│   ├── minikube-monitoring.md # Real deployment walkthrough on Minikube
│   └── images/
│       ├── grafana-sli.png
│       └── prometheus-overview.png
├── README.md                 # You're here
```

---

## 🚀 How It Works

1. Provision EC2 and SSH into instance *(or start Minikube locally)*
2. Run `k3s-bootstrap.sh` *(or Minikube instructions in docs)*
3. Add Helm repo + apply custom `values-prod.yaml`
4. Run pipeline or local `helm upgrade --install`
5. Access Grafana on LoadBalancer IP or via `port-forward`

---

## 📊 Monitoring Demo (Minikube)

This project includes a full Helm deployment of kube-prometheus-stack on Minikube.  
Below are real screenshots of Grafana & Prometheus running locally.

👉 [Read full deployment guide](docs/minikube-monitoring.md)

| Grafana Dashboard | Prometheus Overview |
|-------------------|---------------------|
| ![SLI](docs/images/grafana-sli.png) | ![Targets](docs/images/prometheus-overview.png) |

---

## 🧰 K3s Bootstrap

To quickly install K3s and Helm on an EC2 instance, see [k3s-bootstrap.sh](./k3s-bootstrap.sh)

---

## 📍 Why This Matters

> Most DevOps engineers know Helm exists. Fewer know how to:  
> - Customize real values  
> - Structure CI pipelines to auto-deploy  
> - Design dashboard & alert rules that help operations

This repo proves I’ve done it — not in theory, but in my own controlled production-like environment.

---

## 👤 Author – Nuntin Padmadin

Thai DevOps / Infra Engineer – Open to Work (Remote / Contract)

📂 GitHub: [github.com/Nuntin](https://github.com/Nuntin)  
📫 Email: nuntin.p@gmail.com  
💼 LinkedIn: [linkedin.com/in/nuntin-padmadin-97b708145](https://www.linkedin.com/in/nuntin-padmadin-97b708145)
