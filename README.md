# job-hunting

Pipeline for finding and landing a technical-support role in Oslo/Norway.
Tracking lives in Linear ([project **job-hunt**](https://linear.app/phibkro/project/job-hunt-44a5589ca17d), team Personal); documents live here.

## The model: a pipeline, not a waterfall

Setup runs once and is maintained; applications flow through continuously,
many in flight at different stages; outcomes feed back into setup.

```
  SETUP (once, maintained)        PIPELINE (per listing, many in flight)
  ┌────────────────────┐          ┌──────────────────────────────────┐
  │ positioning        │          │ Backlog → Todo → In Progress →   │
  │ market research    │ ───────▶ │ In Review → Done / Canceled      │
  │ CV + portfolio     │          └──────────────┬───────────────────┘
  └────────▲───────────┘                         │
           └────────── FEEDBACK ◀────────────────┘
              (response rates → fix CV / targeting)
```

## Linear stage mapping

One issue per job listing. The issue state tells you what kind of work the
issue needs and how fast it should move:

| Linear state | Stage | Work mode | Velocity |
|---|---|---|---|
| **Backlog** | discovered | raw intake from finn.no / LinkedIn / NAV — title + link only | many/day, seconds each |
| **Todo** | research | qualify: company, role band, language req, salary signal. Kill fast if bad fit | minutes each |
| **In Progress** | application writing | tailor CV variant + søknad in `src/`, submit | 1–2/day, the deep work |
| **In Review** | assessment / interview prep | submitted; waiting, tests, prep, mock interviews | days–weeks, bursty |
| **Done** | accepted 🎉 | followup: retro — what worked | — |
| **Canceled** | rejected / withdrawn | followup: retro — what to fix, feed back into CV | — |

**Work-mode rule of thumb:** Backlog/Todo is breadth (volume discipline,
kill fast); In Progress is depth (quality, genuine tailoring); In Review is
responsiveness (never let a recruiter wait). Don't apply depth-effort to
breadth stages or vice versa.

## Repo layout

```
src/    typst sources — the single source of truth
  cv*.typ       CV variants (cv = base/drift, cv-fullstack, cv-rema…)
  cover-*.typ   one cover letter per company
dist/   compiled PDFs — generated, gitignored, never edited
```

## Commands

Dev shell auto-loads via direnv (`.envrc` → `flake.nix`: typst, just, fonts).

```
just build <name>       compile one doc (e.g. just build cv-rema)
just build-all          compile everything in src/
just watch <name>       live-recompile while editing
just new-cover <company> [template]   start a cover letter from an existing one
just poll               poll NAV feed for new Oslo IT-support listings
just clean              remove dist/
```

## Intake flow (NAV feed)

`just poll` fetches feed changes since the last run (state in `.state/`,
1h overlap), filters Oslo + IT/support signals, writes candidates to
`intake/<timestamp>.json`, and reports surfaced ads that went INACTIVE
(close their Linear issues). New candidates get filed as Backlog issues
in Linear — currently done by Claude in-session from the intake file.
Linear filing can be automated by setting `LINEAR_API_KEY` (Linear →
Settings → API) in the environment; without it, Backlog triage happens
manually from the intake file / chat summaries.
Channel details and filter rationale: [docs/intake-channels.md](docs/intake-channels.md).
Uses NAV's rotating public token; switch to a private token
(email nav.team.arbeidsplassen@nav.no) for unattended use.
