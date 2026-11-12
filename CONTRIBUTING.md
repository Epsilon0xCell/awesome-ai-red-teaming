# Contributing

This list is curated, not collected. A pull request that adds one entry which meets the bar is worth more than one that adds twenty that do not.

## The bar for an entry

1. The link is live and points at the canonical source: the project, the standard, or the author's own page. No link shorteners, no mirrors of other people's work, no affiliate links.
2. The entry uses the locked format: `- [Name](url) - one sentence of 8 to 15 words saying what it does, plus one decision fact` (maintainer, licence, version, or star count).
3. The pull request states a liveness fact for the entry: the latest release or commit date, or the institution maintaining it. Pull requests without one are closed.
4. Where the format allows, the entry carries its verification: the OWASP test ID it maps to, the fixture it ships, or the check that confirms a result.
5. Security tooling entries must be framed for authorised use, and the resource itself must be lawful to use as described.

## Order and sections

Entries sit in the section where a practitioner reaches for them during an engagement, ordered by when they are used, not alphabetically. Propose new sections in an issue first, with three entries that do not fit anywhere existing. No section may hold more than a quarter of the list; if one would, it splits.

## Pruning rule

Every quarter, the list is swept. An entry with no release, commit, or publication activity in the previous 12 months and no landmark status is removed, and the removal commit states the reason, for example "remove X (unmaintained since March 2025)". Landmark means the resource defined its category and remains the reference others cite. Dead links are removed on sight, at any time.

## What gets removed

Dead links, abandoned projects that no longer install or run, duplicates of a stronger entry in the same slot, and anything whose description overclaims what the resource does. Removal pull requests with a one-line reason are welcome.
