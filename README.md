# Awesome AI Red Teaming

**A field guide for red teaming AI systems and the applications around them, where entries earn their place by being checkable.**

Most awesome lists are bookmarks with better formatting. This one is built for the middle of an engagement: every section follows the order you actually work in, every entry says what you will be able to do after using it, and wherever the format allows, the entry carries its verification: an OWASP test ID, a fixture, or a runnable check. Three of those checks ship in this repo under [`checks/`](checks/), ready to run against your own systems.

For authorised testing only: your own applications, labs, CTFs, and engagements with written permission.

## Contents

- [Start here](#start-here)
- [Recon and attack-surface mapping](#recon-and-attack-surface-mapping)
- [Web and API testing](#web-and-api-testing)
- [LLM and agent red teaming](#llm-and-agent-red-teaming)
- [Privilege escalation](#privilege-escalation)
- [Active Directory and cloud](#active-directory-and-cloud)
- [Verification: is it actually a finding](#verification-is-it-actually-a-finding)
- [Detection: what should have caught it](#detection-what-should-have-caught-it)
- [Reporting](#reporting)
- [Learning paths](#learning-paths)

## Start here

- [NIST SP 800-115, Technical Guide to Information Security Testing and Assessment](https://csrc.nist.gov/pubs/sp/800/115/final): the assessment loop the rest of this guide hangs on, including the rule that reporting happens during testing, not after it.
- [MITRE ATT&CK](https://attack.mitre.org/): the shared taxonomy for tagging every technique you use, so your notes stay searchable and your detections map to something defenders already track.
- [MITRE ATLAS](https://atlas.mitre.org/): the ATT&CK counterpart for AI systems. Tag LLM findings here, not in a private vocabulary.
- [SecLists](https://github.com/danielmiessler/SecLists): the wordlists, payloads, and fuzzing strings every later section assumes you have. Specificity beats size; pick the smallest list that matches the target.

## Recon and attack-surface mapping

- [Nmap](https://nmap.org/): the port and service scanner everything else builds on. Two-stage discipline: full-range discovery first, version and script scans on the open set only.
- [AutoRecon](https://github.com/Tib3rius/AutoRecon): a baseline enumerator to run in the background with a pruned config while you work the interesting services by hand.
- [subfinder](https://github.com/projectdiscovery/subfinder): passive subdomain discovery from public sources, so your map exists before you send a single probe.
- [httpx](https://github.com/projectdiscovery/httpx): fast HTTP probing over a host list: titles, status, technology, so a thousand names become a short list worth reading.
- [HackTricks](https://book.hacktricks.xyz/): per-service depth, reached for at the moment a service is in front of you. Paraphrase and verify against the live target; never paste blindly.

Verify: the surface is mapped when you can state the count (hosts, services, endpoints) and every service carries a status of exhausted or unexplored. If you cannot state the count, the recon is not done.

## Web and API testing

- [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/): the indexed checklist this section is keyed to. Cite test IDs (for example WSTG-INFO-01) in your notes instead of prose descriptions. Source: [OWASP/wstg](https://github.com/OWASP/wstg).
- [PortSwigger Web Security Academy](https://portswigger.net/web-security): the free, lab-backed reference for every major web vulnerability class, each with an exploitable practice instance.
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/): the defensive counterpart. Read the cheat sheet for the control you are testing; it tells you exactly what correct looks like, which is what makes a bypass provable.
- [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings): payload and bypass references per vulnerability class, to adapt to the target in front of you, never to spray untested.
- [ffuf](https://github.com/ffuf/ffuf): the fast fuzzer for content, parameters, and virtual hosts. At lab latency, list choice matters more than tool choice.
- [gobuster](https://github.com/OJ/gobuster): directory, DNS, and virtual-host enumeration with predictable output for your records.
- [sqlmap](https://github.com/sqlmapproject/sqlmap): automated SQL injection confirmation and exploitation, after a manual check has shown the parameter is worth it.
- [ZAP](https://www.zaproxy.org/): the open-source intercepting proxy and scanner for crawling, session handling, and API exploration.

Verify: the checks in [`checks/`](checks/) cover headers, TLS expiry, and exposed artefact paths for any web target you own. A scanner hit becomes a candidate; the verification section below decides what it is worth.

## LLM and agent red teaming

- [OWASP Top 10 for LLM Applications](https://genai.owasp.org/llm-top-10/): the risk taxonomy for LLM features, starting with prompt injection (LLM01). Use its category names in findings so vendors and maintainers share your vocabulary.
- [garak](https://github.com/NVIDIA/garak): the LLM vulnerability scanner. Probes for injection, leakage, and jailbreak classes with repeatable runs you can cite as fixtures.
- [PyRIT](https://github.com/Azure/PyRIT): Microsoft's automation framework for multi-turn red-team campaigns against models and agents, with scored datasets instead of anecdote.
- [promptfoo](https://github.com/promptfoo/promptfoo): evaluation and red-team testing for prompts and agents that runs in CI, so a regression in a system prompt shows up as a failing test.
- The skills pack built for this workflow: [ai-redteam-skills](https://github.com/Epsilon0xCell/ai-redteam-skills): counted recon, prompt-injection testing with controls, verification discipline, and detection pairing, as SKILL.md files an agent can follow step by step.

Verify: an injection result counts only when a real boundary breaks: unauthorised data read, an unauthorised action taken, or a developer constraint that protects someone else overridden. A compliant tone change is an observation, not a finding. Run the benign control in a fresh session before you believe any probe.

## Privilege escalation

- [PEASS-ng](https://github.com/PEASS-ng/PEASS-ng): LinPEAS and WinPEAS for local enumeration. Lead generation only: verify every lead by hand before acting on it, and never let its output ordering set your priorities.
- [GTFOBins](https://gtfobins.github.io/): which Unix binaries break out of restricted shells through sudo and SUID, checked against what your enumeration actually found.
- [LOLBAS](https://lolbas-project.github.io/): the Windows counterpart: living-off-the-land binaries and scripts and what each can be made to do.
- [hashcat](https://hashcat.net/hashcat/): the password cracker. Identify the hash mode first; the wrong mode is the most common wasted GPU hour.

## Active Directory and cloud

- [BloodHound](https://github.com/SpecterOps/BloodHound): graph analysis of an AD environment, so the shortest path to the objective replaces wandering.
- [NetExec](https://github.com/Pennyw0rth/NetExec): the maintained network exploitation toolkit for validating credentials and enumerating Windows estates. Its predecessor is archived; old writeups translate mechanically.
- [Certipy](https://github.com/ly4k/Certipy): AD Certificate Services enumeration and abuse, run as soon as any domain credential exists and again after every new one, because what is enrollable differs by principal.
- [impacket](https://github.com/fortra/impacket): the protocol library underneath half the Windows tooling you will ever script.

Verify: password policy arithmetic before any spray. Budget is the lockout threshold minus one per account per window, and username validation through Kerberos pre-authentication does not spend that budget.

## Verification: is it actually a finding

- [OSV](https://osv.dev/): the open-source vulnerability database for checking whether a candidate is already known, and under which ID, before you report a duplicate.
- [Exploit-DB](https://www.exploit-db.com/): the public exploit archive. Search it before claiming novelty and before trusting that a technique works as described.
- [CyberChef](https://gchq.github.io/CyberChef/): the encoding and decoding workbench for building and shrinking proof inputs.
- [pwntools](https://github.com/Gallopsled/pwntools): the CTF and exploit-development library whose cyclic patterns and remote plumbing make binary proofs reproducible.
- [nuclei](https://github.com/projectdiscovery/nuclei): template-based scanning whose templates double as published fixtures: a template that fires on the fixed version too is an incomplete-fix lead, not noise.
- [trivy](https://github.com/aquasecurity/trivy) and [gitleaks](https://github.com/gitleaks/gitleaks): dependency, container, and secret scanning for the supply-chain side of a target. Their output starts the same verification process as everything else here; it does not skip it.

The standard this guide applies: reproduced, controlled, minimal, proven end to end, and re-run from a fresh state, with the identical proof failing against the fixed version. Anything less is an unconfirmed candidate with the missing leg named.

## Detection: what should have caught it

- The pairing discipline lives in [secure-coding-skills](https://github.com/Epsilon0xCell/secure-coding-skills) on the defensive side and in the `detection-pairing` skill of [ai-redteam-skills](https://github.com/Epsilon0xCell/ai-redteam-skills) on the offensive side: observable first, blind spot named by shape, a rule tested against the proof and against the benign control.
- [Sliver](https://github.com/BishopFox/sliver): a maintained command-and-control framework whose own documentation of its network behaviour is a study in what defenders can and cannot see. Know your tooling's signature before you rely on its quiet.

## Reporting

- [The Hacker Recipes](https://www.thehacker.recipes/): concise, structured technique notes in the shape a good report section takes: preconditions, exact steps, expected result.
- The report kit built alongside this guide: [vuln-report-kit](https://github.com/Epsilon0xCell/vuln-report-kit): templates plus a completeness validator that checks a draft for the sections reviewers actually reject reports for missing.

A report that survives review states the boundary from the project's own documentation, the control beside the proof, the demonstrated impact in one sentence, and the ask in plain language. Score once, early, and move on.

## Learning paths

- [Hack The Box](https://www.hackthebox.com/): the lab platform this guide's workflow was sharpened on, from Starting Point upward.
- [IppSec](https://ippsec.rocks/): searchable walkthrough videos indexed by service and technique. Search it when stuck, by the service in front of you.
- [0xdf](https://0xdf.gitlab.io/): written walkthroughs with the dead ends left in, which is where most of the teaching lives.
- [ligolo-ng](https://github.com/nicocha30/ligolo-ng) and [chisel](https://github.com/jpillora/chisel): the pivoting tools for the moment a lab stops being one host, and the point where drawing the topology map becomes non-negotiable.

## Contributing

The bar for entries, and what gets removed, is in [CONTRIBUTING.md](CONTRIBUTING.md). Quality over bulk, always: one verified entry beats twenty bookmarks.

## License

MIT. Curated by Gavin Blacklock ([Epsilon0xCell](https://github.com/Epsilon0xCell)). Links belong to their projects; the curation, the checks, and the verification notes are the original work here.
