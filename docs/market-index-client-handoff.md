# Personal job-hunting suite ↔ Norwegian Job Market Index

> **Status: Proposed integration, not implemented.** Read the indexer's [technical product/project lead handoff](https://github.com/phibkro/job-application-assistant/blob/proposal/read-only-norwegian-market-index-2026-11/docs/internal/product/market-index-lead-handoff.md), [proposed RFC 0016](https://github.com/phibkro/job-application-assistant/blob/proposal/read-only-norwegian-market-index-2026-11/docs/internal/rfcs/0016-read-only-norwegian-market-index.md), and [draft PR #21](https://github.com/phibkro/job-application-assistant/pull/21). These documents currently exist on a **proposal branch, not main**. Do not migrate state or switch intake until the read contract and tests are proven.

## Goal

Keep **job-hunting** as the personal, human-controlled job-application work suite while [job-application-assistant](https://github.com/phibkro/job-application-assistant) evolves into a general-purpose, read-only Norwegian vacancy index. The indexer supplies evidence about opportunities, not commands that act on the user's behalf.

Your current target is sustainable junior/entry-level work in Oslo or remote Norway, **40–60% preferred (around 50% ideal)**, prioritizing software development, research/technical assistance, systems/business analysis, civic/public-service IT, and support as a fallback. A suitable full-time role may still be evaluated when flexibility is explicitly offered, but unknown workload must not be treated as part-time.

## Boundaries and ownership

| Concern | Authority | Consequence |
| --- | --- | --- |
| Source listings, observations, freshness, publication/provenance | Market index | Personal suite reads rather than re-collects once parity is proven |
| Canonical vacancy identity and sources | Market index | Persist stable source references with personal snapshots; handle ID migrations explicitly |
| General-purpose filters, employer and source views | Market index | Consume read-only, versioned query/results contract |
| Job-search preferences and personal evaluation | job-hunting | Query arguments/local configuration; do not write into public index |
| Application lifecycle state and follow-up | Linear `job-hunt` pipeline, as currently documented | Do not create competing authoritative application statuses in shared D1 |
| CV, tailored letter, answers, generated application stacks | Typst sources and local project workflow | Remain personal documents; never upload automatically into market-index corpus |
| Application submission | Human using external employer ATS | Not an indexer feature; no automatic submission |

This repository is public; do not commit secrets, sensitive applicant data, private emails, API tokens, or real personal application payloads. Keep any additional private state in explicitly ignored/private storage.

## Intended read interface (not yet implemented)

The indexer should eventually support:

- Discover vacancies by a versioned query AST or verified structured filters.
- Fetch current canonical vacancy and associated source occurrences.
- Fetch source freshness and last verified time.
- Poll a cursor for new, changed, closed or no-longer-matching vacancies.

Each result should include a canonical ID, a stable source occurrence (source + external ID), source/apply URL, temporal provenance, and evidence/unknown statuses for key employment facts. **A changed canonical ID must not orphan an existing application record**; the client snapshots the listing and maintains an origin-reference mapping.

A personal query should distinguish:
- confirmed overlap with 40–60% employment extent,
- explicitly negotiable work percentage,
- unknown percentage,
- explicitly incompatible percentages,
and should not assume an unspecified salary, seniority, or work arrangement.

## Proposed integration process: tracer bullet

1. Characterize existing `scripts/poll_nav.py`, `scripts/finn_watch.py`, `intake/`, `listings/` and Linear issue creation. Preserve baseline until indexer read parity.
2. Pick a deterministic fixture for one vacancy already represented in the indexer. Read its typed API record using a small local adapter/CLI (no applicant data sent to indexer).
3. Map the response to a local **candidate suggestion** (not directly a submitted application): source references, current facts, frozen advert excerpt where permitted, query reason, confidence/unknown labels.
4. Human accepts the suggestion; create or associate the existing Linear Ticket without duplicate application records. Keep `listings/*.json` snapshots and Typst stack behavior intact.
5. Re-query or poll changes and show updates/closures without overwriting human notes, decisions, CV sources or correspondence.
6. Verify that multiple source occurrences referencing one vacancy do not create two Linear Tickets and that changes in vacancy identity do not accidentally merge two applications.
7. Only after a verified alternative exists, deprecate redundant NAV polls; FINN's personal watcher remains separately policy-bound and must not be silently added to a shared public index.

## Contract tests

- A 50% Oslo technical position is suggested as confirmed.
- A position with no percentage is labelled unknown, not rejected as full-time.
- A 100% position is ineligible for the strict part-time query, but may be kept as a human-discretion fallback if explicitly negotiable.
- A closure updates the suggestion status, without erasing application history.
- Two occurrences for one vacancy suggest one personal candidate; two distinct requisitions with identical display fields remain separate.
- An indexer outage leaves local application documents, Linear state and existing intake usable.
- No indexer mutation, autonomous submission, or unreviewed source collection occurs.

## Migration plan and stop conditions

- Begin with a read-only experiment; do not delete `just poll`, `just finn`, Typst, Linear records, or local listing files.
- One integration Ticket/PR at a time; stop at ambiguous field mappings, missing explicit permission, unstable canonical IDs, or failed applicant-history preservation.
- Current [positioning](positioning.md), [intake-channel policy](intake-channels.md), README and past submissions remain the existing workspace authority until a reviewed change.
- This document is client-side intent, not proof the referenced API currently exists.

## Coding-agent handoff

Read this document, `README.md`, `docs/positioning.md`, `docs/intake-channels.md`, `scripts/poll_nav.py`, `scripts/finn_watch.py`, `scripts/gen_stack.py` and the indexer's **accepted** query contract before coding. Pin both repository commits, state exactly one end-to-end user outcome, use deterministic fixtures, and propose a minimal PR that does not mutate the source index or real application submissions. Obtain explicit approval before changing Linear issue state or accessing private credentials.
