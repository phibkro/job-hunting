// =====================================================================
//  CV — Philip Bjørknes Krogh — Fullstack / AI engineering (English)
//  Compile:  typst compile cv-fullstack.typ cv-fullstack.pdf
// =====================================================================

#let muted   = rgb("#5f6368")
#let rulecol = rgb("#bfc4c9")
#let ink     = rgb("#1f2328")

#set document(title: "Philip Bjørknes Krogh — CV", author: "Philip Bjørknes Krogh")
#set page(paper: "a4", margin: (x: 1.7cm, top: 1.5cm, bottom: 1.4cm))
#set text(font: ("Carlito", "Liberation Sans"), size: 10pt, lang: "en", fill: ink)
#set par(leading: 0.62em, justify: false)

#let section(title) = {
  v(0.55em)
  text(size: 10.5pt, weight: "bold", tracking: 0.5pt, upper(title))
  v(-0.35em)
  line(length: 100%, stroke: 0.7pt + rulecol)
  v(0.15em)
}
#let entry(role, org: none, date: "", body) = {
  block(breakable: false, width: 100%)[
    #grid(columns: (1fr, auto), align: (left, right + bottom), column-gutter: 1em,
      { text(weight: "bold")[#role]; if org != none { text(fill: muted)[ — #org] } },
      text(size: 9pt, fill: muted)[#date])
    #v(-0.15em)
    #body
  ]
  v(0.32em)
}
#let pts(..items) = {
  set list(marker: text(fill: muted)[•], indent: 0.2em, body-indent: 0.45em)
  set par(leading: 0.5em)
  list(..items.pos().map(i => [#i]))
}
#let edu(what, date) = grid(columns: (1fr, auto), align: (left, right),
  text(weight: "bold")[#what], text(fill: muted)[#date])

// ---- header ----
#grid(columns: (2.4cm, 1fr), column-gutter: 0.9em, align: (left + horizon, left + horizon),
  box(clip: true, radius: 4pt, image("photo.png", width: 2.4cm)),
  [
    #text(size: 21pt, weight: "bold")[Philip Bjørknes Krogh]
    #v(-0.55em)
    #text(size: 11.5pt, fill: muted)[Fullstack developer, NTNU informatics]
  ])

#v(0.3em)
#text(size: 9pt, fill: muted)[
  +47 468 99 829 #h(0.6em)·#h(0.6em) #link("mailto:philib.krogh@gmail.com")[philib.krogh\@gmail.com]
  #h(0.6em)·#h(0.6em) #link("https://github.com/phibkro")[github.com/phibkro]
  #h(0.6em)·#h(0.6em) #link("https://linkedin.com/in/philib-krogh")[linkedin.com/in/philib-krogh]
]

#v(0.5em)
Fullstack developer who likes building products end to end, from the data model to the
interface people actually use. I work across a TypeScript and React stack, have a soft
spot for functional programming, and I'm drawn to the parts of a system where state,
concurrency and correctness get genuinely tricky. Lately I build a lot with AI agents in
my own workflow, and I want to work somewhere putting them to real use.

#section[Experience]

#entry(org: "Aker Solutions / NTNU", date: "Fall 2025")[HealthTech — Web system (team of 8)][
  #pts(
    [Planned the system architecture for an interactive dashboard that visualizes time-series health data from body-worn sensors],
    [Coordinated technical decisions across a cross-functional team of eight],
  )
]

#entry(org: "Systems & AI tooling", date: "2020 – present")[Home lab][
  #pts(
    [Build with AI agents daily: Claude Code as my main environment, MCP, local models, and my own agent setups],
    [Run a Linux server setup (NixOS) as config-as-code, with self-hosted services and containers],
  )
]

#entry(org: "volunteer", date: "2024 – 2025")[Vektorprogrammet — Web developer][
  #pts([Migrated a monolithic PHP site to React and a REST API])
]

#entry(org: "personal project", date: "Summer 2023")[Finnbydel — Web app][
  #pts([Built a site for finding Oslo districts by address using TypeScript, React, Next, Tailwind, tRPC and Prisma])
]

#entry(org: "NTNU", date: "Fall 2023")[DrinkDB & Filmder — Web app + server (team of 3)][
  #pts([Built a GraphQL API with Apollo and a matching web app, integrating a public REST API])
]

#entry(org: "Kamy Kommunikasjon, Oslo", date: "Summer 2020")[IT consultant][
  #pts([User support for clients of varying technical background, adapting explanations to each person's level])
]

#section[Technical skills]

#pts(
  [*Frontend & language:* TypeScript, React, Next.js, Node, HTML/CSS; also Python, Java, C],
  [*Functional programming:* Haskell, Effect.ts, F\#],
  [*AI tooling:* Claude Code (daily), MCP, local models, building agent setups],
  [*Data & APIs:* GraphQL (Apollo), REST, tRPC, Prisma, Postgres, SQL],
  [*Systems & infra:* Linux (NixOS), Docker, config-as-code, Git, CI/CD],
  [*Ways of working:* Agile / Scrum, code review, web accessibility],
)

#section[Education]

#edu[BSc Informatics studies — NTNU, Trondheim][2023 – present]
#edu[Digital Creativity — Folkehøgskolen Sørlandet][2022 – 2023]
#edu[Creative Industries Management — BI, Oslo][2021]
#edu[Informatics (year unit) — University of Oslo][2020]

#section[Languages]

Norwegian (native), English (fluent)
