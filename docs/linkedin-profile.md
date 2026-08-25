# LinkedIn-optimaliseringspakke — Philip Bjørknes Krogh

Paste-ready innhold + felt-for-felt-sjekkliste. Kilder: `docs/positioning.md`,
`docs/experience-inventory.md`, `src/cv-*.typ`, `src/cover-miljodir.typ`, annonsene i `intake/`.
**Båndprioritet (Philip, 2026-08-25): utviklerroller er PRIMÆRBÅNDET,
IT-support/brukerstøtte sekundærbåndet (følges fortsatt aktivt). Alt
under er skrevet i den rekkefølgen — ikke «rett» det tilbake.**
Hardregler gjeldende hele veien: aldri antyde fullført grad («studerer informatikk ved NTNU» /
«Informatikkstudier» er formuleringene); aldri nevne eksamensstatus; aldri flere jobbår enn
Kamy (sommer 2020) og Skafferiet (2021–22); homelab = kontinuerlig egen drift siden 2020,
aldri arbeidsforhold.

## 1. Realitetscheck

- LinkedIn-profilen kan ikke redigeres uten Philips login — denne fila er innhold til liming + sjekkliste, ikke fjernstyring.
- LinkedIn har ingen ATS-scanner. Matching skjer i Recruiter via søkeord (headline/tekster/skills), ferdighets-taksonomien, profilfullstendighet og nylig aktivitet. Optimalisering = dekk søkeordene i tabellen i pkt. 7, fyll ut ALLE felt, hold profilen i live.
- Alt innhold nedenfor er kildekontrollert; ingenting er funnet opp. Usikre datoer/måneder er merket — rett dem mot virkeligheten ved liming.

## 2. Headline (grense 220 tegn)

**(a) Dev-båndet (primær):**

```
Fullstack-utvikler | TypeScript · React · Next.js | NixOS-homelab siden 2020 | Studerer informatikk ved NTNU
```

(108 av 220 tegn.) Credibility kommer fra prosjekter, frivillig arbeid,
homelab og studiene — aldri fra antydet ansettelse som utvikler.

**(b) Support-båndet (sekundær):**

```
IT-support og brukerstøtte | Førstelinje fra Kamy Kommunikasjon (sommer 2020) | Egen NixOS-homelab i drift siden 2020 | Studerer informatikk ved NTNU
```

**(c) Språk:** Rekrutterersøk går på både norsk og engelsk — kjør norsk først (band A-annonsene er norske), men behold engelske termer der det er de som søkes (NixOS, TypeScript, config-as-code). Engelsk variant hvis profilen også skal fange internasjonale rekrutterere:

```
Fullstack developer | TypeScript · React · Next.js | Runs a NixOS homelab since 2020 — networking, monitoring, config-as-code | Studying informatics at NTNU
```

## 3. «Om»-seksjonen (Under 2000 tegn — tell tegn etter liming)

Nåversjon — fusjonert med Philips levende «Om»-tekst (selvlært→informatikk-buen,
systemmodelleringen og de to byggeprosjektene) — målt til **1999 tegn**.

```
Hei — takk for at du leser.

Selvlært webutvikler fanget av informatikk. Jeg studerer informatikk ved NTNU, og
utvikling er retningen jeg har valgt. Det som driver meg er tekniske detaljer i tjeneste
for brukeropplevelsen: en utvikler som har sittet på supportbenken og hatt daglig
kundekontakt bygger for menneskene som skal bruke det.

Første smaken fikk jeg som IT-konsulent i Kamy Kommunikasjon sommeren 2020:
førstelinje-brukerstøtte for klienter med svært ulik teknisk bakgrunn. Siden den sommeren
har feilsøkingen vært daglig kost — i eget hjemmelaboratorium; fire Linux-maskiner (NixOS)
og én Mac i drift siden 2020, med nettverk (DNS, VPN/Tailscale), fildeling, backup og
overvåking for familien. Alt ligger som konfigurasjon som kode på
github.com/phibkro/homelab. Når DNS-en faller ut klokka elleve om kvelden, er det jeg som
sitter med den.

Jeg skriver TypeScript, React og Next.js; REST-API og SQL kommer fra studiet og
teamprosjektene (Buddyblast i Scrum; Vektorprogrammet PHP→React, frivillig). Den dype
interessen er systemmodellering: hvordan ting konstrueres og observeres — algebra,
coalgebra og category theory gir egenskaper å resonere ut fra: pålitelighet, sikkerhet,
ytelse. Jeg bygger et programmeringsspråk for domenemodeller — abstrakte teorier, konkrete
modeller, kjørbare realiseringer — og et praktisk prosjekt-OS der AI-agenter drifter
prosjektutviklingen. Nyest: en slik agent prøvde automatisk feilsøking i homelaben —
første agent-PR utløst av egen infrastruktur.

Komfortabel i Windows og macOS ved siden av Linux til daglig. Observability er
hverdagsmat: Grafana, VictoriaMetrics og varsling har jeg satt opp selv. Microsoft 365
behersker jeg godt fra brukersiden; ITIL kjenner jeg som rammeverk.

Etter Kamy har jeg jobbet i daglig kundekontakt (Skafferiet, 2021–22) og lært å lese hva
folk trenger — det bygger jeg videre på.

Høres dette ut som noen dere kunne tenkt dere å snakke med? Send meg en melding her, eller
på philib.krogh@gmail.com / +47 468 99 829.
```

## 4. Erfaring-oppføringer (paste-ready)

**Kamy Kommunikasjon** — Tittel: *IT-konsulent* · Oslo · Sommer 2020 (LinkedIn krever måned/år: sett jun–aug 2020, rett mot faktiske måneder) · Ansettelsestype: det som stemmer (kontrakt/sommerjobb).
- Ga førstelinje brukerstøtte til klienter med svært ulik teknisk bakgrunn.
- Tilpasset forklaringer til den enkeltes nivå — fra nybegynner til superbruker.
- Wordpress-administrasjon og support på Apple-programvare.

**Skafferiet** — Tittel: *Kasseansvarlig* · Oslo · Høst 2021 – vår 2022 (lim som ca. aug 2021 – jun 2022, rett mot fakta).
- Daglig kundekontakt i et operativt retailmiljø med høyt tempo.
- Øvde på å lese hva folk faktisk trenger og kommunisere tydelig.

**Hjemmelaboratorium — egen drift (ulønnet, privat)** — Kategori: legges under *Erfaring* med ansettelsestype *Selvstendig*; LinkedIn har ingen perfekt kategori for kontinuerlig selvdrevet drift, så tittelen må gjøre det umulig å misforstå som arbeidsforhold. Dato: 2020 – nå (pågår).
- Drifter fire Linux-maskiner (NixOS) og én Mac for familien: nettverk (DNS, VPN/Tailscale), fildeling, mediatjenester, backup.
- Overvåking og varsling i praksis: Grafana, VictoriaMetrics/Logs, Gatus, push-varsler — feilsøker alt fra DNS-oppslag til diskkrasj.
- All konfigurasjon som kode, åpent på github.com/phibkro/homelab.
- Kontinuerlig egen drift siden 2020: oppgraderinger, oppetid og gjenoppretting på eget ansvar.

**Prosjekter / utdanningsmoduler** (under «Prosjekter», ikke Erfaring — studiemoduler, ikke jobb):
- *HealthTech — websystem, team på 8* (Aker Solutions / NTNU, høst 2025): planla systemarkitektur for dashboard med tidsserie-helsedata fra kroppsnære sensorer; koordinerte tekniske beslutninger på tvers av et tverrfaglig team på åtte.
- *Buddyblast — webapp, team på 6* (NTNU, vår 2024): utviklet webapplikasjon i team med strukturert arbeidsflyt i Scrum og GitLab.
- Dev-båndet kan i tillegg hente inn Vektorprogrammet (frivillig, PHP→React), Finnbydel og DrinkDB/Filmder fra cv-fullstack/cv-rema — samme disiplin: bare det som står i CV-ene.

**Vektorprogrammet** — Tittel: *Webutvikler (frivillig)* · Oslo · 2024 – 2025 · Legges under «Frivillig erfaring» eller «Prosjekter».
- Migrerte en monolittisk PHP-side til React med REST-API bak.
- Deltatt i utviklingsteamet for organisasjonens nettside ved siden av studiene.

**Programmeringsspråk for domenemodeller** — eget forsknings-/byggeprosjekt · Pågår (aktivt under arbeid) · Legges under «Prosjekter», ikke Erfaring.
- Eget programmeringsspråk for å spesifisere domenemodeller som abstrakte teorier, konkrete modeller og kjørbare realiseringer.
- Kategori-teoretisk grunnlag (algebra/coalgebra/category theory) for å resonere om systemers egenskaper.

**Agent-drevet prosjekt-OS** — eget forsknings-/byggeprosjekt · Pågår (aktivt under arbeid) · Legges under «Prosjekter», ikke Erfaring.
- Praktisk operativsystem for å administrere prosjektutvikling i en organisasjon ved hjelp av AI-agenter.

## 5. Ferdigheter (maks 50; søkevekten ligger på de øverste — rekkefølgen under ER prioriteringen)

**TOP 10 (pin disse):**
1. TypeScript (egne prosjekter + Vektorprogrammet)
2. React (Buddyblast, Vektorprogrammet)
3. Next.js (egne prosjekter)
4. Feilsøking (Kamy + homelab)
5. Linux (homelab-fleet)
6. NixOS (4 hosts, config-as-code)
7. REST API (studie + prosjekter)
8. SQL (studie + prosjekter)
9. Brukerstøtte (Kamy)
10. Nettverksadministrasjon (TCP/IP, DNS, DHCP, VPN)

11. Python · 12. Konfigurasjon som kode (hele homelaben, offentlig repo) ·
13. Overvåking og logging (Grafana, VictoriaMetrics/Logs, Gatus, varsling) ·
14. IT-drift (homelab, kontinuerlig siden 2020) · 15. Windows (daglig bruk;
cv-support) · 16. macOS (Kamy + Mac i fleet) · 17. Docker ·
18. Backup/restic · 19. Grafana · 20. DNS · 21. VPN (Tailscale/WireGuard) ·
22. Kundeservice (Skafferiet, Kamy) · 23. Teknisk dokumentasjon (offentlige
brukerdokumenter på GitHub) · 24. Scrum (Aker/Buddyblast) · 25. Microsoft 365

Merknader: LinkedIn-autofullfør foreslår engelske taksonominavn (f.eks. «Technical Support») — velg forslagene, det er de Recruiter søker på. M365 står lavt med vilje: brukernivå er ærlig, admin-nivå er ikke dokumentert — ikke plasser den i topp 10. ITIL og ServiceNow utelates helt (kunnskapsnivå/aspirasjonsterskel — se pkt. 7).

## 6. Annet

- **Utdanning:** Skole: NTNU · Studieretning: Informatikk · Grad-feltet: la stå TOMT (skriv aldri «Bachelor» før den foreligger) · Tidsrom: 2023 – pågår, ingen sluttdato, ingen kommentar om eksamener. Legg evt. til radene fra CV-en: Årsstudium i informatikk (UiO, 2020), Digital kreativitet (Folkehøgskulen Sørlandet, 2022–23), BI Oslo (2021).
- **Sted:** Oslo, Norge. Språk: norsk (morsmål), engelsk (flytende).
- **«Åpen til arbeid»:** slå PÅ. Roller: juniorutvikler/fullstackutvikler først, deretter brukerstøtte/IT-support/IKT-konsulent/servicedesk. Sted: Oslo (kommune). Oppstart: umiddelbart. Synlighet: **kun for rekrutterere** — ikke offentlig banner.
- **URL:** custom URL er allerede `linkedin.com/in/philib-krogh` — behold; den står lik i alle CV-varianter, ikke endre den nå.
- **Featured:** fest `github.com/phibkro/homelab` først — beviset hele profilen hviler på; deretter agent-fix-posten (linkedin.com/feed/update/urn:li:activity:7492284936641613824) — første automatiserte agent-PR utløst av egen infrastruktur, levende bevis på agent-driften.
- **Aktivitet:** følg selskapene i `listings/` (Fremtind, Folq, Skatteetaten, Miljødirektoratet, Lovisenberg ds sykehus, Statsbygg, NRK, Bouvet, Tind IT, Upheads) — nylig aktivitet teller i Recruiters synlighetslogg.
- **Aktivitet — egen innhold:** LLM-kronikken (linkedin.com/feed/update/urn:li:activity:7493922751712456705) kan gjerne stå — autentisk dybde-signal — men led med byggeprosjektene; pin-rekkefølgen er Philips valg.
- **Foto:** bruk `src/photo.png` (samme som på CV-en — gjenkjennelse på tvers av portal/PDF/profil), beskåret med ansiktet i fokus.

## 7. Søkeord-dekning vs annonser (vocab fra miljodir-, Lovisenberg-, Tind-, Upheads- og FINK-annonsene + dev-annonsene)

Prioritet per 2026-08-25: dev-vokabular er primærmål, support-vokabular
sekundært — begge dekkes. Tabellen viser hvor hvert søkeord er dekket:

| Søkeord rekruttereren søker | Headline | Om | Skills | Erfaring |
|---|---|---|---|---|
| brukerstøtte / første­linje / IT-support | (b) | ja | 9 | Kamy |
| feilsøking / problemløsing | — | ja | 2 | Kamy, homelab |
| IT-drift / systemadministrasjon | (a)(b) | ja | 14 | homelab |
| Windows / Windows-klienter | — | ja | 15 | (bruk) — svakeste av OS-ene |
| macOS / Apple | — | ja | 16 | Kamy |
| Linux / NixOS | (a)(b)(c) | ja | 5–6 | homelab |
| nettverk (TCP/IP, DNS, VPN, brannmur) | (a)(b)(c) | ja | 10, 20–21 | homelab |
| konfigurasjon som kode / IaC | (a)(b)(c) | ja | 12 | homelab |
| backup | — | — | 18 | homelab |
| kundeservice / kundebehandling | — | ja | 22 | Kamy, Skafferiet |
| dokumentasjon / brukerveiledninger | — | — | 23 | cv-support + offentlig repo |
| TypeScript / React / Next.js | (a)(b)(c) **primær** | ja **primær** | 1–3 **primær** | prosjekter |
| REST API / SQL | — | ja **primær** | 7–8 **primær** | prosjekter/studie |
| Scrum / tverrfaglig team | — | — | 24 | Aker, Buddyblast |
| Microsoft 365 / M365 | — | ja (brukerside) | 25 (lavt) | nei — ærlig grense |
| ITIL «som rammeverk» | — | ja (kunnskapsnivå) | utelatt | nei — kunnskapsnivå |
| KI-verktøy i arbeid (Tind eksplisitt) | — | implisitt | — | vevx/nixpkgs-agent, Claude Code |

**Ærlige hull — ikke dekkbar ennå, ikke lim inn:** ServiceNow (FINK krever 2+ år),
Intune/Entra ID/Conditional Access/Exchange Online/tenant-oppsett (Tind, Upheads),
Citrix/tynnklient/print (Lovisenberg), sakssystemer (Pureservice o.l.), Asset Management
(miljodir), Azure/.NET/C# (Statsbygg). Disse skal verken i headline, Om eller skills;
møtes i stedet med «setter meg raskt inn» + ITIL-rammeverkskjennskap i samtalen.

## Vedlikehold

Etter hver sending: oppdater `listings/<slug>.json` som vanlig. Revider denne pakken når
nye annonser introduserer nye gjentatte søkeord, eller når graden foreligger — da endres
utdanningslinjen her som første punkt.
