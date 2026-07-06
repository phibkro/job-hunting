// =====================================================================
//  CV — Philip Bjørknes Krogh
//  Typst-port av den norske (drift-/operasjonelle) versjonen.
//  Kompiler:  typst compile cv.typ cv.pdf
// =====================================================================

#let muted   = rgb("#5f6368")
#let rulecol = rgb("#bfc4c9")
#let ink     = rgb("#1f2328")

#set document(title: "Philip Bjørknes Krogh — CV", author: "Philip Bjørknes Krogh")

#set page(
  paper: "a4",
  margin: (x: 1.7cm, top: 1.5cm, bottom: 1.4cm),
)

#set text(
  font: ("Carlito", "Liberation Sans"),
  size: 10pt,
  lang: "nb",
  fill: ink,
)

#set par(leading: 0.62em, justify: false)

// ---- helpers --------------------------------------------------------

// Section heading + thin rule
#let section(title) = {
  v(0.55em)
  text(size: 10.5pt, weight: "bold", tracking: 0.5pt, upper(title))
  v(-0.35em)
  line(length: 100%, stroke: 0.7pt + rulecol)
  v(0.15em)
}

// Experience entry: heading row (role — org … date) + body
#let entry(role, org: none, date: "", body) = {
  block(breakable: false, width: 100%)[
    #grid(
      columns: (1fr, auto),
      align: (left, right + bottom),
      column-gutter: 1em,
      {
        text(weight: "bold")[#role]
        if org != none { text(fill: muted)[ — #org] }
      },
      text(size: 9pt, fill: muted)[#date],
    )
    #v(-0.15em)
    #body
  ]
  v(0.32em)
}

// Tight bullet list
#let pts(..items) = {
  set list(marker: text(fill: muted)[•], indent: 0.2em, body-indent: 0.45em)
  set par(leading: 0.5em)
  list(..items.pos().map(i => [#i]))
}

// Education / two-column row
#let edu(what, date) = grid(
  columns: (1fr, auto),
  align: (left, right),
  text(weight: "bold")[#what], text(fill: muted)[#date],
)

// ---- header ---------------------------------------------------------

#grid(
  columns: (2.4cm, 1fr),
  column-gutter: 0.9em,
  align: (left + horizon, left + horizon),
  box(clip: true, radius: 4pt, image("photo.png", width: 2.4cm)),
  [
    #text(size: 21pt, weight: "bold")[Philip Bjørknes Krogh]
    #v(-0.55em)
    #text(size: 11.5pt, fill: muted)[Bachelor i Informatikk, NTNU]
  ],
)

#v(0.3em)
#text(size: 9pt, fill: muted)[
  +47 468 99 829
  #h(0.6em) · #h(0.6em) #link("mailto:philib.krogh@gmail.com")[philib.krogh\@gmail.com]
  #h(0.6em) · #h(0.6em) #link("https://linkedin.com/in/philib-krogh")[linkedin.com/in/philib-krogh]
  #h(0.6em) · #h(0.6em) #link("https://github.com/phibkro")[github.com/phibkro]
]

#v(0.5em)
Informatiker som trives i skjæringspunktet mellom teknologi og forretning. Det jeg
bryr meg mest om, er at data faktisk når fram til folkene som skal ta beslutninger ut
fra den. Jeg har erfaring med dashboards, overvåking og drift av Linux-baserte
systemer, og er vant til å forklare tekniske ting uten å gjøre dem vanskeligere enn
de er.

// ---- utdanning ------------------------------------------------------

#section[Utdanning]

#edu[Bachelor i Informatikk — NTNU, Trondheim][Høst 2023 – pågår]
#edu[Digital Kreativitet — Folkehøgskolen Sørlandet][Høst 2022 – Vår 2023]
#edu[Creative Industries Management — BI, Oslo][Høst 2021]
#edu[Årsstudium i Informatikk — UiO][Høst 2020]

// ---- erfaring -------------------------------------------------------

#section[Erfaring]

#entry(org: "Systemadministrasjon og drift", date: "2020 – nå")[Hjemmelaboratorium][
  #pts(
    [Drifter eget Linux-basert serveroppsett (NixOS) med konfigurasjon som kode og fokus på reproduserbarhet],
    [Bygger erfaring med overvåking og logganalyse: logging, metrikker og varsling med Grafana og VictoriaLogs],
    [Administrerer nettverkstjenester: VPN (Tailscale), DNS, filserver og containerbaserte applikasjoner],
  )
]

#entry(org: "Aker Solutions / NTNU", date: "Høst 2025")[HealthTech — Websystem (team på 8)][
  #pts(
    [Planla systemarkitektur for dashboardapplikasjon som visualiserer tidsserie-helsedata fra kroppsnære sensorer],
    [Arbeidet med strømmer av måledata og hvordan de presenteres forståelig i dashboards],
    [Koordinerte tekniske beslutninger på tvers av et tverrfaglig team på åtte],
  )
]

#entry(org: "Kamy Kommunikasjon, Oslo", date: "Sommer 2020")[IT-konsulent][
  #pts(
    [Ga brukerstøtte til klienter med varierende teknisk bakgrunn],
    [Tilpasset forklaringer til den enkeltes nivå og formidlet tekniske problemstillinger enkelt],
    [Arbeidet med Wordpress-administrasjon og Apple-programvare],
  )
]

#entry(org: "Skafferiet, Oslo", date: "Høst 2021 – Vår 2022")[Kasseansvarlig][
  #pts(
    [Daglig drift og kundekontakt i et operativt retailmiljø med høyt tempo],
    [Vekt på å lese hva folk faktisk trenger og kommunisere tydelig],
  )
]

#entry(org: "NTNU", date: "Vår 2024")[Buddyblast — Webapp (team på 6)][
  #pts(
    [Utviklet webapplikasjon i team med strukturert arbeidsflyt via Scrum og GitLab],
  )
]

// ---- teknisk kompetanse --------------------------------------------

#section[Teknisk kompetanse]

#pts(
  [*Monitorering og logganalyse:* Grafana, VictoriaLogs, logging, metrikker og varsling (egenlært, hjemmelab)],
  [*Operativsystemer:* Linux (NixOS), macOS, Windows],
  [*Drift og infrastruktur:* Docker, konfigurasjon som kode, selvhostede tjenester, brukerkontoadministrasjon],
  [*Nettverk:* TCP/IP, Tailscale (VPN), DNS, brannmur, nettverksadministrasjon],
  [*Data og utvikling:* SQL, REST API, TypeScript, Python, Java],
  [*AI-verktøy:* Claude Code (daglig), MCP, lokale modeller og egne agentoppsett i hjemmelab],
)

// ---- språk ----------------------------------------------------------

#section[Språk]

Norsk (morsmål), Engelsk (flytende)
