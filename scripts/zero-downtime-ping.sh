#!/usr/bin/env bash
# Ping recommender every 0.5s during a rolling update (Task 2).
set -euo pipefail
NS=${NS:-ecommerce}
SVC=${SVC:-recommender-svc}
fail=0
ok=0
for i in $(seq 1 40); do
  if kubectl exec -n "$NS" deploy/recommender -- python -c "import urllib.request; urllib.request.urlopen(\"http://127.0.0.1:8000/health\", timeout=2)" >/dev/null 2>&1; then
    ok=$((ok+1)); echo "$i ok"
  else
    fail=$((fail+1)); echo "$i FAIL"
  fi
  sleep 0.5
done
echo "ok=$ok fail=$fail"
test "$fail" -eq 0
