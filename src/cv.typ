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
    #text(size: 11.5pt, fill: muted)[Informatikkstudier, NTNU]
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
Informatiker med like stor interesse for brukeropplevelsen som for det tekniske.
Opptatt av at gode systemer ikke bare fungerer, men er forståelige for menneskene
som bruker dem. Trives i roller der tillit og tålmodighet er del av jobben.

// ---- utdanning ------------------------------------------------------

#section[Utdanning]

#edu[Informatikk — NTNU, Trondheim][Høst 2023 – Vår 2026]
#edu[Digital Kreativitet — Folkehøgskolen Sørlandet][Høst 2022 – Vår 2023]
#edu[Creative Industries Management — BI, Oslo][Høst 2021]
#edu[Årsstudium i Informatikk — UiO][Høst 2020]

// ---- erfaring -------------------------------------------------------

#section[Erfaring]

#entry(org: "Systemadministrasjon og drift", date: "2020 – nå")[Hjemmelaboratorium][
  #pts(
    [Drifter eget Linux-basert serveroppsett (NixOS) med fokus på reproduserbarhet og konfigurasjon som kode],
    [Administrerer nettverkstjenester: VPN, DNS, filserver og containerbaserte applikasjoner],
    [Lærer meg observability aktivt: logging, varslingssystemer og verktøy som Grafana og Loki],
  )
]

#entry(org: "Kamy Kommunikasjon, Oslo", date: "Sommer 2020")[IT-konsulent][
  #pts(
    [Ga brukerstøtte til klienter med varierende teknisk bakgrunn],
    [Tilpasset forklaringer til den enkeltes forståelsesnivå],
    [Arbeidet med Wordpress-administrasjon og Apple-programvare],
  )
]

#entry(org: "Aker Solutions / NTNU", date: "Høst 2025")[HealthTech — Websystem (team på 8)][
  #pts(
    [Planla og utviklet systemarkitektur for interaktiv dashboardapplikasjon med tidsserie-helsedata],
    [Koordinerte tekniske beslutninger på tvers av et tverrfaglig team],
  )
]

#entry(org: "NTNU", date: "Vår 2024")[Buddyblast — Webapp (team på 6)][
  #pts(
    [Utviklet webapplikasjon i team med strukturert arbeidsflyt via Scrum og GitLab],
  )
]

#entry(org: "Skafferiet, Oslo", date: "Høst 2021 – Vår 2022")[Kasseansvarlig][
  #pts(
    [Daglig kundekontakt med vekt på tålmodighet og å lese hva folk faktisk trenger],
  )
]

// ---- teknisk kompetanse --------------------------------------------

#section[Teknisk kompetanse]

#pts(
  [*Operativsystemer:* Linux (NixOS), macOS, Windows],
  [*Nettverk:* TCP/IP, VPN, DNS, brannmur, nettverksadministrasjon],
  [*Drift og infrastruktur:* Docker, konfigurasjon som kode, selvhostede tjenester, brukerkontoadministrasjon],
  [*Observability (under utvikling):* Grafana, Loki, logging og feilsporing],
  [*Utvikling:* TypeScript, Python, Java, HTML/CSS, REST API],
)

// ---- språk ----------------------------------------------------------

#section[Språk]

Norsk (morsmål), Engelsk (flytende)
