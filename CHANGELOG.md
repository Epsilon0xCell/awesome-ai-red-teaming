# Changelog

## v0.3.0, 2026-11-12

- Twenty-one further entries from the research pass's second half, each resolved to its canonical URL and live-checked: a new Standards and guidance section (the OWASP Agentic and MCP Top 10s, the OWASP GenAI Red Teaming Guide, and the NIST AI 100-2, AI 600-1, and AI RMF documents), three more Papers and research hubs entries (Simon Willison, Anthropic's Frontier Red Team, Microsoft's 100-products lessons), and three new closing sections: Courses and labs, CTFs and challenges, and Communities and newsletters.
- Two supplement candidates were left out on verification: a Microsoft Security Blog EchoLeak post could not be verified to exist, and the PortSwigger LLM attacks topic page has no verifiable canonical URL (the Academy itself is already listed).

## v0.2.0, 2026-11-12

- Twenty-six new entries from a sourced research pass, each live-checked on the release date: five offensive tools join LLM and agent red teaming, and three new sections land: Guardrails and evaluation (nine entries), Benchmarks and datasets (seven), and Papers and research hubs (five).
- PyRIT now points at its new home, microsoft/PyRIT; the Azure organisation repo is archived upstream. mcp-scan and Petri point at their post-acquisition, post-donation homes.
- The list moves to CC0 1.0 Universal. The runnable checks in `checks/` stay MIT, marked in each script header.
- Governance: a pull request template that requires a liveness fact, awesome-lint and link-check workflows, and a written quarterly pruning rule in CONTRIBUTING.md.

## v0.1.0, 2026-11-12

First release.

- The field guide: nine sections from recon to reporting, every link live-checked on the release date, every entry written to say what you will be able to do after using it.
- Three runnable checks in `checks/`: security headers, TLS expiry, and exposed artefact paths, each with a note on how to read its output without inflating it.
- Verification woven through the list: OWASP test IDs, fixture-first tooling, and the standards entries that decide whether a candidate is a finding at all.
