#let muted   = rgb("#5f6368")
#let rulecol = rgb("#bfc4c9")
#let ink     = rgb("#1f2328")

#set document(title: "Cover letter — Philip Bjørknes Krogh", author: "Philip Bjørknes Krogh")
#set page(paper: "a4", margin: (x: 2.2cm, top: 2cm, bottom: 2cm))
#set text(font: ("Carlito", "Liberation Sans"), size: 10.5pt, lang: "en", fill: ink)
#set par(leading: 0.7em, justify: true, spacing: 1.15em)

#text(size: 17pt, weight: "bold")[Philip Bjørknes Krogh]
#v(-0.5em)
#text(size: 9pt, fill: muted)[
  +47 468 99 829 #h(0.5em)·#h(0.5em)
  #link("mailto:philib.krogh@gmail.com")[philib.krogh\@gmail.com] #h(0.5em)·#h(0.5em)
  #link("https://github.com/phibkro")[github.com/phibkro]
]
#v(-0.2em)
#line(length: 100%, stroke: 0.7pt + rulecol)

#set par(spacing: 1.05em)
#v(0.2em)
#text(fill: muted)[Oslo, 5 June 2026]

#v(0.2em)
*Ardoq* \
ShiftX team \
Oslo

#v(0.6em)
#text(size: 12pt, weight: "bold")[Application: Product Engineer (ShiftX)]

#v(0.4em)

Hi,

The ShiftX role caught my attention for a specific reason: real-time multiplayer
editing on process graphs, with state sync and conflict resolution, is exactly the kind
of problem I find genuinely interesting. Shared state that has to stay consistent while
several people edit at once is a hard, well-defined problem, and it's one I've spent
personal time understanding, including how approaches like CRDTs and event sourcing
trade off against each other.

Two other things you describe line up with how I already work. The AI-powered process
generation from natural language and images is close to my day-to-day; I build with AI
agents (Claude Code, MCP, local models) as a matter of habit. And the graph side appeals
to me, I've built interactive graph visualizations before and I'm drawn to the structure
underneath them.

For the rest, I'm a fullstack developer comfortable across TypeScript and React, and I
like that you build close to the user, joining customer calls and letting what you see
feed back into what gets built. In an earlier project I migrated a monolithic site to
React and a REST API, and in my bachelor project I planned the architecture for a
data-heavy dashboard, so shipping real features is familiar rather than new.

I'm finishing my informatics degree, so I'd be early in my career. But ShiftX's problem
space is one I'd be genuinely excited to work on, and I'd be glad to talk.

#v(0.6em)
Best regards, \
*Philip Bjørknes Krogh*
