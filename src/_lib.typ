// =====================================================================
//  Shared CV/letter helpers — import with:  #import "_lib.typ": *
//  Files starting with _ are skipped by `just build-all`.
// =====================================================================

#let muted   = rgb("#5f6368")
#let rulecol = rgb("#bfc4c9")
#let ink     = rgb("#1f2328")

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

// Letter template: sender header + date/recipient/subject, then body.
// Usage:  #show: brev.with(date: [Oslo, 9. juli 2026], recipient: [*Firma* \ Avd.], subject: [Søknad: ...])
#let brev(date: [], recipient: [], subject: [], doc) = {
  set document(title: "Søknad — Philip Bjørknes Krogh", author: "Philip Bjørknes Krogh")
  set page(paper: "a4", margin: (x: 2.2cm, top: 2cm, bottom: 2cm))
  set text(font: ("Carlito", "Liberation Sans"), size: 10.5pt, lang: "nb", fill: ink)
  set par(leading: 0.7em, justify: true, spacing: 1.05em)

  text(size: 17pt, weight: "bold")[Philip Bjørknes Krogh]
  v(-0.5em)
  text(size: 9pt, fill: muted)[
    +47 468 99 829 #h(0.5em)·#h(0.5em)
    #link("mailto:philib.krogh@gmail.com")[philib.krogh\@gmail.com] #h(0.5em)·#h(0.5em)
    #link("https://github.com/phibkro")[github.com/phibkro]
  ]
  v(-0.2em)
  line(length: 100%, stroke: 0.7pt + rulecol)
  v(0.2em)
  text(fill: muted)[#date]
  v(0.2em)
  recipient
  v(0.6em)
  text(size: 12pt, weight: "bold")[#subject]
  v(0.4em)
  doc
  v(0.6em)
  [Med vennlig hilsen \ *Philip Bjørknes Krogh*]
}

// Document template: page/text setup + photo header.
// Usage:  #show: cv.with(subtitle: [ ... ])
#let cv(subtitle: [], intro: [], doc) = {
  set document(title: "Philip Bjørknes Krogh — CV", author: "Philip Bjørknes Krogh")
  set page(paper: "a4", margin: (x: 1.7cm, top: 1.5cm, bottom: 1.4cm))
  set text(font: ("Carlito", "Liberation Sans"), size: 10pt, lang: "nb", fill: ink)
  set par(leading: 0.62em, justify: false)

  grid(
    columns: (2.4cm, 1fr),
    column-gutter: 0.9em,
    align: (left + horizon, left + horizon),
    box(clip: true, radius: 4pt, image("photo.png", width: 2.4cm)),
    [
      #text(size: 21pt, weight: "bold")[Philip Bjørknes Krogh]
      #v(-0.55em)
      #text(size: 11.5pt, fill: muted)[#subtitle]
    ],
  )

  v(0.3em)
  text(size: 9pt, fill: muted)[
    +47 468 99 829
    #h(0.6em) · #h(0.6em) #link("mailto:philib.krogh@gmail.com")[philib.krogh\@gmail.com]
    #h(0.6em) · #h(0.6em) #link("https://linkedin.com/in/philib-krogh")[linkedin.com/in/philib-krogh]
    #h(0.6em) · #h(0.6em) #link("https://github.com/phibkro")[github.com/phibkro]
  ]

  v(0.5em)
  intro
  doc
}
