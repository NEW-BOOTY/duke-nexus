#!/usr/bin/env bash
set -euo pipefail
query="$1"
if [[ -z "$GROK_API_KEY" ]]; then
  echo '{"error":"GROK_API_KEY not set — export GROK_API_KEY=...","verdict":"uncertain","explanation":"API key missing"}'
  exit 0
fi
curl -s "https://api.x.ai/v1/chat/completions" \
  -H "Authorization: Bearer $GROK_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{\"model\":\"grok-beta\",\"messages\":[{\"role\":\"user\",\"content\":\"Reply ONLY with valid JSON {\\\"verdict\\\":\\\"true\\\",\\\"false\\\",or\\\"uncertain\\\",\\\"explanation\\\":\\\"short reason\\\"}: $query\"}],\"temperature\":0}" | \
  jq '.choices[0].message.content // {"verdict":"error","explanation":"API failed"}'
