#!/bin/bash

WEBHOOK_URL="https://chat.googleapis.com/v1/spaces/AAQAIMgHrxg/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=d8_BE8x6nC6hedTw90HK3Vc-ms4cT8nfbRS7hxlj3Mk"
COUNT=1

while true; do
  NS=$(dig NS stonekids.tv +short | head -1)
  
  if [[ "$NS" == *"cloudflare"* ]]; then
    curl -s -X POST "$WEBHOOK_URL" \
      -H "Content-Type: application/json" \
      -d '{"text": "🎉 *stonekids.tv 네임서버 전파 완료!*\n\n✅ Cloudflare 활성화됨\n✅ https://stonekids.tv 접속 가능\n\n지금 확인해보세요!"}'
    exit 0
  else
    curl -s -X POST "$WEBHOOK_URL" \
      -H "Content-Type: application/json" \
      -d "{\"text\": \"⏳ 체크 #${COUNT}: 아직 전파 중...\n현재: ${NS}\n\n10분 후 다시 확인합니다.\"}"
  fi
  
  COUNT=$((COUNT + 1))
  sleep 600
done
