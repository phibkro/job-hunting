# Intake channels — where listings come from

Survey of job platforms for IT/tech-support roles in Oslo, and how to fetch
from each. Sources: deep-research run 2026-07-06 (101 agents, 19 sources,
22 claims survived 3-vote adversarial verification) + hands-on finn.no probe.

## Comparison

| Platform | Programmatic access | Verdict as intake channel |
|---|---|---|
| **arbeidsplassen.nav.no** | ✅ Official free feed API: `pam-stilling-feed.nav.no` — 3 GET endpoints, JWT bearer auth. Public rotating token at `/api/publicToken` (prototyping); stable private token via email to `nav.team.arbeidsplassen@nav.no` | **PRIMARY.** Legally sanctioned redistribution; database covers majority of all Norwegian public listings |
| **finn.no** | ❌ Official API is business-customers-own-data only ("no access to non-business parties"). robots.txt + ToS prohibit scraping, citing åndsverksloven; job-aggregator bots are full-site blocked; ad pages themselves are server-rendered HTML (verified 2026-08-25: plain GET returns full ad body, no headless browser needed — only search/list pages are JS-heavy) | **Manual/browse only.** Largest gap in NAV feed (contractually excluded). Use saved-search email alerts ("Lagre søk") + manual browsing |
| **Teamtailor career sites** | ⚠ Official API needs per-company secret key (no cross-tenant). BUT each career site serves unauthenticated `{careersite}/jobs.json` (JSON Feed 1.1) | **SECONDARY** for target companies. ToS status of systematic use unassessed — fine at personal scale |
| **RecMan career sites** | ⚠ `api.recman.io/v2` has jobPost scope, but per-tenant API keys only | Skip API; treat as ordinary web pages |
| LinkedIn, kode24, TheHub, karriere.no, jobbdirekte, Webcruiter, Jobbnorge, EasyCruit, staffing agencies (Academic Work, Experis, Manpower, Randstad) | ❓ No verified claims in this pass | **Open — needs honing pass** |

## Key facts (verified, with vote counts)

- NAV feed: free, documented (MIT-licensed OpenAPI spec at
  [navikt.github.io/pam-stilling-feed](https://navikt.github.io/pam-stilling-feed/)),
  republication explicitly permitted. 3-0 ×5 claims.
- NAV terms impose **active obligations**: delete inactive ads immediately,
  sync updates, deep-link applications to the source system. Constrains
  pipeline design if we ever republish; for private use, low burden.
- Coverage nuance (2-1 vote): NAV's *database* holds the majority of Norwegian
  listings, but the redistributable *feed* = majority minus Finn-exclusives.
  Ads double-posted via ATS or direct NAV registration still appear;
  only Finn-exclusive postings are missed.
- finn.no exclusion from NAV feed is contractual (NAV↔FINN agreement). 3-0 ×2.
- finn.no hands-on probe (2026-07-06): search is clean URL params
  (`/job/search?location=1.20001.20061&q=…`, Oslo = `1.20001.20061`),
  server-rendered article cards, no bot resistance encountered — but
  automated scraping violates their stated terms, so this stays manual.
  "IT-support" Oslo ≈ 25 hits, 84 national.

## Recommended architecture

```
  NAV pam-stilling-feed (private token)   ──┐   poll daily
  Teamtailor jobs.json per target company ──┼─▶ dedup ─▶ filter (Oslo, support
  finn.no saved-search email alerts       ──┘   band) ─▶ Linear Backlog issues
                                                          (manual for finn hits)
```

## Open questions (honing-pass targets)

1. Access methods for the uncovered boards (kode24, TheHub, karriere.no,
   LinkedIn, agencies) — and how much of their inventory is already
   syndicated into NAV's feed via ATS integrations.
2. Quantify finn.no-exclusives: 2026-08-25 side-evidence found ≥8 Oslo support-band listings on finn (Tind IT IT-Support, Documaster Technical Support, Upheads IT-Konsulent, Emma Systems Supportkonsulent, Save Solutions Teknisk support, Forsvaret IT Support, Kommunalbanken Sluttbruker-spesialist, Diakonissehuset M365-konsulent) that never surfaced via the NAV feed poller — the finn gap is real and sits exactly in the target band.
3. Scalable discovery of Norwegian Teamtailor/RecMan career sites
   (e.g. partner.teamtailor.com/job_boards API) + terms check.
4. Whether FINN grants written permission for small-scale personal use.

## Caveats

Live verifications date to 2026-07-06; NAV public token rotates without
warning; Teamtailor jobs.json verified on only two career sites. One claim
cites NAV's old terms page — cite current `vilkar-api` downstream. Listing
volumes per platform were not quantified. Full run output:
session task `wq2h7i5xd`.
