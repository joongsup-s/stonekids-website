#!/bin/bash

WEBHOOK_URL="https://chat.googleapis.com/v1/spaces/AAQAIMgHrxg/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=d8_BE8x6nC6hedTw90HK3Vc-ms4cT8nfbRS7hxlj3Mk"

while true; do
  NS=$(dig NS stonekids.tv +short | head -1)
  
  if [[ "$NS" == *"cloudflare"* ]]; then
    # 네임서버 전파 완료!
    curl -s -X POST "$WEBHOOK_URL" \
      -H "Content-Type: application/json" \
      -d '{"text": "🎉 *stonekids.tv 네임서버 전파 완료!*\n\n✅ Cloudflare 활성화됨\n✅ https://stonekids.tv 접속 가능\n\n지금 확인해보세요!"}'
    echo "$(date): Nameserver propagation complete!"
    exit 0
  else
    echo "$(date): Still waiting... Current NS: $NS"
  fi
  
  # 10분 대기
  sleep 600
done
