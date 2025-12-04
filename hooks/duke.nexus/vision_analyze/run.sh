#!/usr/bin/env bash
set -euo pipefail
img="$1"
[[ -z "$img" || ! -f "$img" ]] && { echo '{"error":"image_not_found","path":"'"$img"'"}'; exit 1; }
b64=$(base64 -i "$img" 2>/dev/null | tr -d '\n')
prompt="Describe this image in extreme technical detail with object detection, colors textures and scene understanding."
curl -s "$OLLAMA_URL" \
  -H "Content-Type: application/json" \
  -d "{\"model\":\"llava\",\"prompt\":\"$prompt\",\"images\":[\"$b64\"],\"stream\":false}" | \
  jq '{status:"success",description:.response}'
