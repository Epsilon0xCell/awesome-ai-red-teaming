#!/usr/bin/env bash
# MIT License. Copyright (c) 2026 Gavin Blacklock. The list in this repo is CC0; these checks are MIT.
# Check the security headers of a site you own or are authorised to test.
# Usage: ./check-security-headers.sh https://example.com
set -euo pipefail
URL="${1:?usage: check-security-headers.sh <url>}"
if ! HEADERS="$(curl -sIL --max-time 15 "$URL")"; then
  echo "error: could not fetch headers from $URL" >&2
  exit 1
fi
for h in strict-transport-security content-security-policy x-content-type-options referrer-policy x-frame-options permissions-policy; do
  if echo "$HEADERS" | grep -qi "^$h:"; then echo "present: $h"; else echo "MISSING: $h"; fi
done
