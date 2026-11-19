# Homework submission — Telco Churn MLOps on Kubernetes

## GitHub
https://github.com/Leonid328/telco-churn-mlops-synthetic-07

Fork of https://github.com/mentorchita/telco-churn-mlops-synthetic-07

## Cluster (90 pts)
- VM: Hostinger VPS kvm8 `168.231.116.71` (hostname srv2124194)
- Runtime: **k3s** v1.36.5 (not minikube; Traefik + metrics-server included)
- Deploy: `./k8s/scripts/deploy-k3s.sh`
- Namespace `mlops`: churn-ml-service (2 replicas + HPA), churn-rag-service, churn-agent-service
- Proof: `proof/01-k3s-node.txt`, `proof/02-mlops-all.txt`
- `/health` on all three services returns JSON status
- `/predict` returns churn probability

## Extra (+10) ecommerce k8s
- Namespace `ecommerce`, manifests in `ecommerce-k8s/`
- readinessProbe on `/health`, ConfigMap, ClusterIP `recommender-svc`, Ingress `ecommerce.local`
- `kubectl scale` 2 → 5 → 2
- RollingUpdate maxSurge 1 / maxUnavailable 0
- Agent + Secret placeholder + DNS `http://recommender-svc:80`
- Proof: `proof/03-ecommerce.txt`

## Google Drive screenshots
Upload the `proof/` files (and optional terminal video) to Drive and paste the share link in the LMS form.
