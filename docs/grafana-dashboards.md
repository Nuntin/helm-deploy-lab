# 📊 Grafana Dashboards

This document showcases example Grafana dashboards that can be used with the **Helm-based Prometheus-Grafana monitoring stack** deployed on Minikube.

> Author: **Nuntin Padmadin**

---

## 🎯 Dashboard Goals

These dashboards aim to help visualize:

* **Kubernetes node health** (CPU, memory, disk)
* **Pod resource usage** and throttling
* **Service latency / availability (SLI/SLO)**
* **Prometheus TSDB performance**
* **Custom alerts and thresholds**

---

## 📌 Recommended Dashboards

| Name                                       | Description                               |
| ------------------------------------------ | ----------------------------------------- |
| Kubernetes / Compute Resources / Cluster   | Node-level CPU/Memory/Disk overview       |
| Kubernetes / Compute Resources / Namespace | Namespaced pod usage breakdown            |
| Node Exporter Full                         | Physical machine metrics (Node Exporter)  |
| Prometheus Stats                           | Performance of the Prometheus server      |
| Custom: SLI/SLO Dashboard                  | Basic latency/error rate metrics for demo |

You can import prebuilt dashboards using Grafana.com IDs or JSON files.

---

## 📥 Sample: Importing a Dashboard

1. Log into Grafana at [http://localhost:3000](http://localhost:3000)
2. Go to the **+** icon → **Import**
3. Enter a Dashboard ID (e.g., `315`) or upload JSON
4. Select the Prometheus data source
5. Click **Import**

---

## 🖼️ Screenshots

<p align="center">
  <img src="./images/grafana-sli.png" width="600"/>
  <br><em>SLI Dashboard Example</em>
</p>

<p align="center">
  <img src="./images/prometheus-overview.png" width="600"/>
  <br><em>Prometheus Metrics Overview</em>
</p>

---

## 💡 Tips for Dashboard Use

* Use **Variables** to make dashboards reusable
* Apply **time range filters** (top-right) for better clarity
* Set **alerts** on thresholds (e.g., CPU > 90%)
* Use **Annotations** to mark deploy events

---

## 📁 Location

These images and dashboard templates are stored in `docs/images/`

Use these visuals to support DevOps interviews, demos, or training sessions

---

## ✅ Next

Consider exporting your dashboard as **JSON** to track versioning or share with others.
