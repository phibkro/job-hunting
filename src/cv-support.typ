// =====================================================================
//  CV — base variant for teknisk support / brukerstøtte (2026-kampanjen)
//  Kompiler:  just build cv-support
//  Regler (docs/positioning.md): ærlig utdanningslinje — graden er IKKE
//  fullført; CV må stemme med karakterutskriften.
// =====================================================================

#import "_lib.typ": *

#show: cv.with(
  subtitle: [Teknisk brukerstøtte og IT-drift],
  intro: [
    Informatiker med like stor interesse for brukeropplevelsen som for det
    tekniske. Opptatt av at gode systemer ikke bare fungerer, men er
    forståelige for menneskene som bruker dem. Trives i roller der tillit
    og tålmodighet er del av jobben.
  ],
)

// ---- erfaring -------------------------------------------------------

#section[Erfaring]

#entry(org: "Systemadministrasjon og drift", date: "2020 – nå")[Hjemmelaboratorium][
  #pts(
    [Drifter fire Linux-maskiner (NixOS) og én Mac: nettverk (DNS, VPN/Tailscale),
     påloggingsportal, fildeling, mediatjenester og backup for familien],
    [Overvåking og varsling i praksis: Grafana, VictoriaMetrics/Loki, Gatus og
     push-varsler — feilsøker selv alt fra DNS-oppslag til disk-krasj],
    [All konfigurasjon som kode, åpent tilgjengelig:
     #link("https://github.com/phibkro/homelab")[github.com/phibkro/homelab]],
  )
]

#entry(org: "Kamy Kommunikasjon, Oslo", date: "Sommer 2020")[IT-konsulent][
  #pts(
    [Førstelinje brukerstøtte for klienter med varierende teknisk bakgrunn],
    [Tilpasset forklaringer til den enkeltes forståelsesnivå — fra nybegynner til superbruker],
    [Wordpress-administrasjon og support på Apple-programvare],
  )
]

#entry(org: "Aker Solutions / NTNU", date: "Høst 2025")[HealthTech — Websystem (team på 8)][
  #pts(
    [Utviklet systemarkitektur for dashboardapplikasjon med tidsserie-helsedata],
    [Koordinerte tekniske beslutninger og dokumentasjon på tvers av et tverrfaglig team],
  )
]

#entry(org: "Skafferiet, Oslo", date: "Høst 2021 – Vår 2022")[Kasseansvarlig][
  #pts(
    [Daglig kundekontakt med vekt på tålmodighet og å lese hva folk faktisk trenger],
  )
]

// ---- utdanning ------------------------------------------------------

#section[Utdanning]

#edu[Informatikk — NTNU, Trondheim][2023 – 2026]
#edu[Digital Kreativitet — Folkehøgskolen Sørlandet][2022 – 2023]
#edu[Creative Industries Management — BI, Oslo][Høst 2021]
#edu[Årsstudium i Informatikk — UiO][Høst 2020]

// ---- teknisk kompetanse --------------------------------------------

#section[Teknisk kompetanse]

#pts(
  [*Operativsystemer:* Linux (NixOS), macOS, Windows],
  [*Nettverk:* TCP/IP, DNS, DHCP, VPN (Tailscale/WireGuard), brannmur],
  [*Drift:* Docker, konfigurasjon som kode, selvhostede tjenester, brukerkontoadministrasjon, backup],
  [*Overvåking:* Grafana, VictoriaMetrics/Loki, Gatus, varsling],
  [*Dokumentasjon:* brukerveiledninger og systemdokumentasjon (eksempler på GitHub)],
  [*Utvikling:* TypeScript, Python, Java, SQL, REST API],
  [*KI-verktøy:* praktisk erfaring med KI-assistert arbeidsflyt og agentverktøy],
)

// ---- språk ----------------------------------------------------------

#section[Språk]

Norsk (morsmål), Engelsk (flytende)
