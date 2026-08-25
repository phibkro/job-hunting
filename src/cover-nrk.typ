// =====================================================================
//  Søknad — Plattformutvikler, Team Utvikleropplevelse, NRK (frist 07.09.2026)
//  Sendes inn sammen med cv-rema.
//  Kompiler:  just build cover-nrk
// =====================================================================

#import "_lib.typ": *

#show: brev.with(
  date: [Oslo, 25. august 2026],
  recipient: [*NRK* \ Team Utvikleropplevelse / IT-avdelingen \ Oslo],
  subject: [Søknad: Plattformutvikler],
)

Hei,

jeg søker stillingen fordi annonsen beskriver både jobben og personen dere
håper finnes: noen som ikke gir seg før roten til feilen er funnet, og som
motiveres av at koden skal tjene noe større enn den selv. Dere oppfordrer
både seniorer og ferske talenter til å søke, og verdsetter nysgjerrighet
høyere enn at man kan alt fra start — det er en invitasjon jeg tar på alvor.

Plattformtenkingen min kommer ikke fra en jobb, men fra fem år med egen
drift: fire NixOS-maskiner som holder nettverk, VPN, DNS, backup og
overvåking i gang for familien min — alt som konfigurasjon som kode, åpent
dokumentert på
#link("https://github.com/phibkro/homelab")[github.com/phibkro/homelab].
Overvåkingen med Grafana, VictoriaMetrics, Loki og Gatus ble bygget fordi
ting brøt sammen før den fantes, og når DNS-en faller ut klokka elleve om
kvelden, feilsøker jeg tvers gjennom lagene — fra tjenesten som svarer galt,
via proxy og nettverk, ned til selve maskinen.

Jeg har ikke brukt Ansible eller Terraform ennå; jeg har brukt NixOS, som
bygger på samme prinsipp om at alt skal være deklarativt, reproduserbart og
versjonshåndtert. Verktøyene lærer jeg hos dere — tankemåten har jeg allerede.
Det er moderniseringsreisen som trekker meg: overgangen fra
kringkastingspesifikk nisjeteknologi til moderne IP-, sky- og
virtualiseringsløsninger er en omlegging de færreste får være med på, og jeg
vil gjerne bære litt av den.

At koden skal bidra til å styrke demokratiet og engasjere hele Norges
befolkning, er et oppdrag det er lett å stå inne i. Jeg studerer informatikk
ved NTNU, lærer raskt av koden og kollegene rundt meg, og deler det jeg
finner ut — også når det viser seg at jeg tok feil.

Takk for at dere vurderer søknaden min. Jeg håper å få fortelle mer i en
samtale.
