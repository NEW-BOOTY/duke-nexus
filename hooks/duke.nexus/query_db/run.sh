#!/usr/bin/env bash
set -euo pipefail
sql="$1"
if [[ -z "$PG_CONN" ]]; then
  echo '{"error":"PG_CONN not set — export PG_CONN=postgres://user:pass@host/db","example":"SELECT version();"}'
  exit 0
fi
psql "$PG_CONN" -At -c "$sql" 2>&1 || echo '{"error":"query failed","sql":"'"$sql"'"}'
