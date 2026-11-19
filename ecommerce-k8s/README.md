# Extra lab (+10): Kubernetes for ecommerce-style ML service

Run on the same k3s node as Telco (namespace `ecommerce`).
Uses `/health` `{"status":"ok"}` from churn-predictor image (FastAPI readinessProbe).
Service URLs from env / ConfigMap (`ML_SERVICE_URL=http://recommender-svc:80`).

## Task 1
```bash
kubectl apply -f ecommerce-k8s/all.yaml
kubectl scale deploy/recommender -n ecommerce --replicas=5
kubectl get pods -n ecommerce
```
Ingress host: `ecommerce.local/predict`

## Task 2
RollingUpdate `maxSurge: 1`, `maxUnavailable: 0` is in the Deployment.
Zero-downtime ping: `scripts/zero-downtime-ping.sh`

## Task 3
`ecommerce-agent-service` + Secret `llm-secrets` + DNS `http://recommender-svc:80`.
Do not commit real API keys.
