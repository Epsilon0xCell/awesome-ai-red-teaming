# Runnable checks

The guide's rule is that a claim you can check, you should. These three small scripts are the checks that ship with the list itself. Run them only against systems you own or are authorised to test.

| Check | What it does | How to read the result |
|---|---|---|
| `check-security-headers.sh <url>` | Lists which of six standard security headers are present or missing. | Missing headers are hardening gaps, scored by what the application does, not by the count. |
| `check-tls-expiry.sh <host> [port]` | Prints certificate expiry and days remaining. | An expired or nearly expired certificate on a production host is an operational finding on its own. |
| `check-exposed-artefacts.sh <base-url>` | Probes seven artefact paths and prints status codes. | A 200 is a lead. Fetch the content, confirm it is real, and only then treat it as exposure. |

Every check prints evidence, not verdicts. The verdict is yours, after the verification step the guide links throughout.
