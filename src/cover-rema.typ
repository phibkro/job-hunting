// =====================================================================
//  Søknad — Utvikler, Monitoreringsteamet, REMA 1000
//  Kompiler:  typst compile cover-rema.typ cover-rema.pdf
// =====================================================================

#let muted   = rgb("#5f6368")
#let rulecol = rgb("#bfc4c9")
#let ink     = rgb("#1f2328")

#set document(title: "Søknad — Philip Bjørknes Krogh", author: "Philip Bjørknes Krogh")

#set page(paper: "a4", margin: (x: 2.2cm, top: 2cm, bottom: 2cm))
#set text(font: ("Carlito", "Liberation Sans"), size: 10.5pt, lang: "nb", fill: ink)
#set par(leading: 0.7em, justify: true, spacing: 1.15em)

// --- avsender ---
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
#text(fill: muted)[Oslo, 5. juni 2026]

#v(0.2em)
*REMA 1000 Norge AS* \
Monitoreringsteamet — Sikkerhet og Fellestjenester \
Ensjø, Oslo

#v(0.6em)
#text(size: 12pt, weight: "bold")[Søknad: Utvikler — monitoreringsløsninger]

#v(0.4em)

Hei,

Jeg søker stillingen som utvikler i monitoreringsteamet fordi den ligger akkurat
der jeg trives best: mellom de tekniske systemene og folkene som skal ta beslutninger
ut fra dem. Dere beskriver rollen som å sikre innsikt i dataflyt på tvers av
verdikjeden, og å gjøre om behov fra ulike fagmiljøer til løsninger. Det er en oppgave
jeg gjerne vil bruke tid på.

På teknisk side har jeg de siste årene drevet med overvåking og logganalyse i mitt eget
hjemmelaboratorium. Jeg drifter et Linux-basert serveroppsett (NixOS) med konfigurasjon
som kode, og har satt opp logging, metrikker og varsling med Grafana og VictoriaLogs. I Splunk
har jeg ikke jobbet ennå, men SPL er et spørrespråk over hendelsesstrømmer, og det å
filtrere, korrelere og lage alarmer ut av loggdata er omtrent det jeg allerede holder
på med. Jeg plukker opp nye verktøy raskt, og ser frem til å lære Splunk skikkelig med
kursene og sertifiseringene dere tilbyr. Jeg bruker AI tett i egen arbeidsflyt også:
Claude Code til daglig, og lokale modeller og egne agentoppsett i hjemmelaben. Når dere
skriver at man får jobbe med Splunk på nye og innovative måter, er det akkurat den typen
utforsking jeg trives med.

Formidlingsbiten betyr like mye for meg. I bacheloroppgaven min, et samarbeid mellom
åtte studenter og Aker Solutions, planla jeg arkitekturen for en dashboardapplikasjon
som visualiserer tidsseriedata fra kroppsnære sensorer. Kort sagt: å gjøre strømmer av
måledata forståelige for dem som skal bruke dem. Fra brukerstøtte hos Kamy Kommunikasjon
er jeg vant til å tilpasse forklaringen til den jeg snakker med, teknisk eller ikke. Jeg
liker den delen av jobben godt.

Jeg har også stått i kassa på Skafferiet, så jeg kjenner tempoet og de skiftende
prioriteringene i en operativ retailhverdag. Et fagfelt jeg liker godt, kombinert med
en sterk delingskultur, gjør at REMA 1000 ser ut som et sted jeg kunne tenkt meg å bli
og vokse over tid.

Jeg kan begynne etter avtale. Takk for at dere vurderer søknaden min, og jeg håper å
få fortelle mer i en samtale.

#v(0.6em)
Med vennlig hilsen \
*Philip Bjørknes Krogh*
