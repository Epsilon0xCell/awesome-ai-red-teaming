#!/usr/bin/env bash
# Print the certificate expiry of a host you own or are authorised to test, and days remaining.
# Usage: ./check-tls-expiry.sh example.com [port]
set -euo pipefail
HOST="${1:?usage: check-tls-expiry.sh <host> [port]}"; PORT="${2:-443}"
END="$(echo | openssl s_client -servername "$HOST" -connect "$HOST:$PORT" 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)"
echo "expires: $END"
python3 - "$END" <<'PY'
import sys, datetime
end = datetime.datetime.strptime(sys.argv[1], "%b %d %H:%M:%S %Y %Z").replace(tzinfo=datetime.timezone.utc)
print("days remaining:", (end - datetime.datetime.now(datetime.timezone.utc)).days)
PY
