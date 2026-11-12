#!/usr/bin/env bash
# Check the security headers of a site you own or are authorised to test.
# Usage: ./check-security-headers.sh https://example.com
set -euo pipefail
URL="${1:?usage: check-security-headers.sh <url>}"
HEADERS="$(curl -sI --max-time 15 "$URL")"
for h in strict-transport-security content-security-policy x-content-type-options referrer-policy x-frame-options permissions-policy; do
  if echo "$HEADERS" | grep -qi "^$h:"; then echo "present: $h"; else echo "MISSING: $h"; fi
done
