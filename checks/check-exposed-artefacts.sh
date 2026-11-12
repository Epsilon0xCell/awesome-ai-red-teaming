#!/usr/bin/env bash
# MIT License. Copyright (c) 2026 Gavin Blacklock. The list in this repo is CC0; these checks are MIT.
# Probe a short list of commonly exposed artefact paths on a site you own or are
# authorised to test. A 200 is a lead to verify by hand, not a finding: confirm
# what the response actually contains before reporting anything.
# Usage: ./check-exposed-artefacts.sh https://example.com
set -euo pipefail
BASE="${1:?usage: check-exposed-artefacts.sh <base-url>}"
for p in /.git/HEAD /.env /swagger.json /openapi.yaml /actuator/health /robots.txt /sitemap.xml; do
  code="$(curl -s -o /dev/null -w "%{http_code}" --max-time 15 "$BASE$p")"
  echo "$code $p"
done
echo "Reminder: verify content by hand. A login page or an error template can answer 200."
