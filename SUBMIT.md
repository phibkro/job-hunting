# Innsendingsoversikt
> Generert 2026-08-25. Stacks regenereres med `just stack <slug>`; detaljer per annonse ligger i listings/<slug>.json. Send rekkefølgen nedenfor.

## Rekkefølge (frist først)

### 1. Fremtind — Backend-utvikler 🔴 FRIST I DAG 25.08
- Annonse: https://www.finn.no/job/ad/472006049 («Søk»-knappen → portal: last opp CV + svar på noen få spørsmål)
- Stack (annonse + CV): dist/stacks/fremtind-backend.pdf
- Portal-svar (klipp/tilpass, [TILPASS]-markører): docs/portal-answers.md → «Fremtind»-avsnittene
- Ingen brev ønskes.

### 2. Folq AS — Fullstack-utvikler, produkt og AI 🔴 FRIST VAR 25.08 — sjekk om fortsatt åpen
- Annonse/søknad: https://www.finn.no/job/ad/472895824 («Send inn CV og noen ord»)
- Stack (annonse + CV + kort notat): dist/stacks/folq-fullstack-ai.pdf
- Brev-kilde: src/cover-folq.typ · CV: cv-fullstack

### 3. Skatteetaten — digital arbeidshverdag 🟠 FRIST 27.08
- Annonsen: https://arbeidsplassen.nav.no/stillinger/stilling/ef3c4551-6f24-468f-a268-11e679d074d0
- Søknad (Webcruiter, CV-only — ingen brev): https://candidate.webcruiter.com/cv?advertid=5164231303&language=nb&link_source_id=17
- Last opp: dist/cv-support.pdf

### 4. Miljødirektoratet — Overingeniør Brukerstøtte IT 🟠 30.08
- Annonsen: https://arbeidsplassen.nav.no/stillinger/stilling/254b469e-9c45-4f2e-97c1-167028caf892
- Søknad (Jobbnorge): https://jobseeker.jobbnorge.no/apply/305556
- Stack (statusside + annonse + CV + brev): dist/stacks/miljodir-brukerstotte.pdf
- Brev-kilde: src/cover-miljodir.typ · CV: cv-support
- Husk: Jobbnorge ber om vitnemål/attester — last opp karakterutskrift.

### 5. Lovisenberg Diakonale Sykehus — IKT-konsulent SPOC 🟠 31.08
- Annonsen: https://arbeidsplassen.nav.no/stillinger/stilling/9b69215f-8631-4135-ba06-63194df03f5e
- Søknad (EasyCruit-skjema): https://lds.easycruit.com/vacancy/application/3652533/61913?channel=NavRest&iso=no
- Stack: dist/stacks/lovisenberg-ikt-konsulent.pdf
- Brev-kilde: src/cover-lovisenberg.typ · CV: cv-support

### 6. Statsbygg — Fullstack-utvikler ×3 🟡 06.09
- Annonse/søknad: https://www.finn.no/job/ad/474100729
- Stack (inkl. brev): dist/stacks/statsbygg-fullstack.pdf
- Brev-kilde: src/cover-statsbygg.typ · CV: cv-rema

### 7. NRK — Plattformutvikler 🟡 07.09
- Annonse/søknad: https://www.finn.no/job/ad/473031872
- Stack (inkl. brev): dist/stacks/nrk-plattformutvikler.pdf
- Brev-kilde: src/cover-nrk.typ · CV: cv-rema

### 8. Bouvet — Konsulent nyutdannede 🟢 03.10
- Annonse/søknad: https://www.finn.no/job/ad/474425256 (CV + vitnemål + utvalgsspørsmål, ingen brev)
- Stack: dist/stacks/bouvet-konsulent-nyutdannet.pdf
- Portal-svar: docs/portal-answers.md → «Bouvet»-avsnittene

### 9. Tind IT — IT-tekniker 🟢 «Snarest» (løpende)
- Annonsene: https://arbeidsplassen.nav.no/stillinger/stilling/497cc36a-473e-4eba-b94e-65af0718bb82 og https://arbeidsplassen.nav.no/stillinger/stilling/6996bef3-9055-4c11-b7fb-1c638509ef28
- Søknad: e-post til jobb@tind.it — legg ved cover-tind.pdf og cv-support.pdf (begge i dist/)
- Brev-kilde: src/cover-tind.typ

## Etter sending
- Oppdater listings/<slug>.json → "stage": "In Review" og kjør `just stack` på nytt.
- Merk: alle brev-PDF-er bygges fra src/*.typ — rediger kilde, ikke PDF.
