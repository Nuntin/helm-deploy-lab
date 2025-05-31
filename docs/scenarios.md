# 🎯 Real-World Scenarios for Helm Deploy Lab

This lab is not just a setup demo — it simulates **production-like monitoring scenarios** on local Kubernetes (Minikube or K3s).

> These use cases demonstrate real DevOps workflows — even without a cloud budget.

---

## 🔍 Scenario 1: Monitor Web Application Health

**Goal:** Simulate a real app being monitored by Prometheus and visualized in Grafana.

### Example Workflow:
- Deploy any HTTP-based app (e.g., nginx, flask, express)
- Enable `ServiceMonitor` to scrape metrics
- Use Grafana dashboard to observe:
  - HTTP 2xx / 4xx / 5xx
  - Latency over time

---

## 🚨 Scenario 2: Alert on CPU / Memory Thresholds

**Goal:** Create real alert rules and trigger notifications.

### Example Workflow:
- Set alert rule in `values-prod.yaml` for:
  - `container_cpu_usage_seconds_total > 80%`
  - `memory_working_set_bytes > 1Gi`
- Use Alertmanager to route alerts
- Simulate stress load (e.g., `stress-ng` or custom pod)

---

## 📊 Scenario 3: Visualize SLI / SLO Dashboards

**Goal:** Track service reliability using Service Level Indicators (SLI).

### Example Metrics:
- `http_requests_total`
- `http_request_duration_seconds`
- `http_errors_total`

### Example Grafana Panel:
- SLI = `1 - (http_errors_total / http_requests_total)`
- Objective: 99.9% success rate

---

## 🧪 Scenario 4: Local Dev/Test Monitoring Lab

**Goal:** Use this repo as a sandbox for testing Prometheus/Grafana integrations.

### Example Uses:
- Test CI/CD metric pushes
- Evaluate dashboard templates before production
- Validate Helm upgrade/rollback safety

---

## 📦 Scenario 5: Add Blackbox Exporter for HTTP Probes

**Goal:** Monitor external endpoints or apps without modifying their code.

### Example Workflow:
- Deploy [blackbox-exporter](https://github.com/prometheus/blackbox_exporter)
- Configure Prometheus to probe:
  - HTTP status (200 OK)
  - SSL expiry dates
  - Latency of critical URLs

---

## 🧰 Scenario 6: Simulate On-Call Alert Workflow

**Goal:** Emulate a real-world alerting and response pipeline.

### Example Workflow:
- Trigger fake alert (e.g., high CPU pod)
- Route alert to Alertmanager with label-based routing
- Integrate Alertmanager with webhook (e.g., Slack mock, Discord)
- Record alert and resolution steps (like postmortem)

---

## 📁 Where to Start

- Edit `values-prod.yaml` to add new apps / targets
- Reuse existing Helm release: `monitor`
- Update `docs/grafana-dashboards.md` to document new dashboards

---

## 🧠 Pro Tip
This lab shows your ability to:
- Deploy reproducible monitoring stack
- Understand metrics/alerting workflows
- Apply Helm/K8s skills in real scenarios — even on local
