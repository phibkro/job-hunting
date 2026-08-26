#!/usr/bin/env python3
"""Watch finn.no job search for new Oslo listings and feed the stack pipeline.

Operator decision (Philip, 2026-08-25) sanctions personal-scale programmatic
reading of finn.no despite their ToS prohibiting scraping — hence the strict
politeness constraints baked in below: descriptive User-Agent, >=3 s sleep
between requests, <=20 ad fetches per run, search pages only + explicit ad
pages, no republication. Anything beyond this scale still needs written
permission from FINN (docs/intake-channels.md open question 4).

Flow: GET /job/search?location=<oslo>&q=<query> per --query (server-rendered
result cards, no JS needed) -> diff FINN-kodes against .state/finn-watch.json
-> list new hits (title + kode + bedrift). --fetch-new additionally fetches
each NEW ad page and writes intake/finn/<kode>.md in the exact markdown shape
scripts/gen_stack.py parse_finn_md() consumes ('# <title>', '- Key: value'
bullets, optional 'Arbeidsgiver-beskrivelse:' line, '## Annonsetekst' body).
First-ever run auto-seeds the baseline (marks current kodes seen, fetches
nothing) so day one isn't a false flood of "new" ads.

Markup relied on (verified live 2026-08-26):
  search:  <article id="card-<kode>"> per hit; title+canonical URL in the
           'job-card-link' anchor; company in the following <strong>.
  ad page: JSON-LD JobPosting block (title/company/kode/validThrough),
           definition list <li class="flex flex-col ">Label<span..>value,
           side panel <li><span class="font-bold">Label:</span>value
           (Sektor/Sted/Hjemmekontor), main body = first
           <div class="import-decoration">…</div>, employer description =
           same class after 'Om arbeidsgiveren</h2>', FINN-kode/Sist endret
           in the 'Annonseinformasjon' list, FINN apply button = job-apply-button.

Usage: just finn [-q QUERY ...] [--max-ads N] [--fetch-new] [--dry]
"""
import argparse
import html
import json
import re
import os
import sys
import time
import urllib.parse
import urllib.request
from datetime import datetime, timezone
from pathlib import Path

BASE = "https://www.finn.no"
LOCATION_OSLO = "1.20001.20061"
ROOT = Path(__file__).resolve().parent.parent
STATE_PATH = ROOT / ".state" / "finn-watch.json"
FINN_DIR = ROOT / "intake" / "finn"
USER_AGENT = "personal-jobsearch-watcher/0.1 (+philib.krogh@gmail.com)"
MIN_SLEEP = 3.0            # seconds between requests — politeness floor
MAX_FETCH_CAP = 20         # hard cap on ad fetches per run

CARD_RX = re.compile(r'<article\b[^>]*\bid="card-(\d+)"')
TOTAL_RX = re.compile(r'<output class="sr-only">([\d \s]+)\s*resultater</output>')
LDJSON_BLOCK_RX = re.compile(
    r'<script type="application/ld\+json">(.*?)</script>', re.S)
DEF_LIST_ITEM_RX = re.compile(r'<li class="flex flex-col ">(.*?)</li>', re.S)
PANEL_ITEM_RX = re.compile(r'<li><span class="font-bold">(.*?)</span>(.*?)</li>', re.S)
BODY_RX = re.compile(r'<div class="import-decoration">(.*?)</div>', re.S)
EMPLOYER_BODY_RX = re.compile(
    r'Om arbeidsgiveren</h2>\s*<div class="import-decoration">(.*?)</div>', re.S)
SIST_ENDRET_RX = re.compile(r'Sist endret(?:<!-- -->):?\s*</strong>\s*<time[^>]*>([^<]+)</time>')
FINN_APPLY_RX = re.compile(r'class="job-apply-button')
EXT_APPLY_URL_RX = re.compile(r'"applicationUrl"\s*:\s*"(https?://[^"]+)"')

_last_request = 0.0


def fetch(url):
    """GET with descriptive UA, sleeping so consecutive requests stay >=3 s apart."""
    global _last_request
    wait = MIN_SLEEP - (time.monotonic() - _last_request)
    if wait > 0:
        time.sleep(wait)
    req = urllib.request.Request(
        url, headers={"User-Agent": USER_AGENT, "Accept-Language": "nb-NO,nb;q=0.9"})
    _last_request = time.monotonic()
    with urllib.request.urlopen(req, timeout=30) as r:
        return r.read().decode("utf-8", "replace")


def clean(fragment):
    """HTML fragment -> single-line plain text. React hydration comments are
    zero-width and vanish; removed tags contribute a space so tag boundaries
    never glue words together."""
    t = re.sub(r"<!--.*?-->", "", fragment)
    t = re.sub(r"<[^>]+>", " ", t)
    return re.sub(r"\s+", " ", html.unescape(t)).strip()


def body_to_text(raw):
    """Ad-body HTML -> readable plain text (same conventions as gen_stack.html_to_text).
    Hydration comments vanish; removed tags contribute a space so tag boundaries
    never glue words together."""
    s = re.sub(r"<!--.*?-->", "", raw)
    s = re.sub(r"(?i)<(br|/p|/div|/h[1-6]|/li|/tr)[^>]*>", "\n", s)
    s = re.sub(r"(?i)<li[^>]*>", "\n- ", s)
    s = re.sub(r"(?i)<h[1-6][^>]*>", "\n### ", s)
    s = re.sub(r"<[^>]+>", " ", s)
    s = html.unescape(s)
    s = re.sub(r"[ \t\xa0]+", " ", s)
    s = re.sub(r" ?\n ?", "\n", s)
    s = re.sub(r"\n{3,}", "\n\n", s)
    return s.strip()


def search(query, location):
    """Return [{kode,title,company,url}] from one server-rendered search page."""
    qs = urllib.parse.urlencode({"location": location, "q": query})
    page = fetch(f"{BASE}/job/search?{qs}")
    total_m = TOTAL_RX.search(page)
    hits, seen = [], set()
    for m in CARD_RX.finditer(page):
        kode = m.group(1)
        if kode in seen:
            continue
        end = page.find("</article>", m.end())
        chunk = page[m.start():end if end != -1 else m.end() + 4000]
        seen.add(kode)
        am = re.search(r'<a\b[^>]*job-card-link[^>]*>(.*?)</a>', chunk, re.S)
        if not am:
            continue
        title = clean(am.group(1))
        href_m = re.search(r'href="([^"]+)"', am.group(0))
        cm = re.search(r"<strong[^>]*>(.*?)</strong>", chunk[am.end():], re.S)
        hits.append({
            "kode": kode,
            "title": title,
            "company": clean(cm.group(1)) if cm else "",
            "url": (href_m.group(1) if href_m
                    else f"{BASE}/job/ad/{kode}"),
        })
    return hits, (int(re.sub(r"\D", "", total_m.group(1))) if total_m else None)


def parse_jobposting(page):
    """Extract the schema.org JobPosting dict from the ad page, if present."""
    for b in LDJSON_BLOCK_RX.findall(page):
        try:
            d = json.loads(b)
        except json.JSONDecodeError:
            continue
        if isinstance(d, dict) and "script:ld+json" in d:
            d = d["script:ld+json"]
        if isinstance(d, dict) and d.get("@type") == "JobPosting":
            return d
    return {}


def parse_ad_page(page, kode):
    """Scrape one ad page into the intake/finn markdown field dict."""
    jp = parse_jobposting(page)
    f = {"kode": kode}

    f["title"] = jp.get("title") or ""
    if not f["title"]:
        m = re.search(r"<h1[^>]*>(.*?)</h1>", page, re.S)
        f["title"] = clean(m.group(1)) if m else f"FINN-kode {kode}"

    f["bedrift"] = (jp.get("hiringOrganization") or {}).get("name") or ""
    if not f["bedrift"]:
        m = re.search(r"</h1>\s*<p[^>]*>(.*?)</p>", page, re.S)
        f["bedrift"] = clean(m.group(1)) if m else "?"

    # definition list under the headline: Søknadsfrist / Ansettelsesform …
    defs = {}
    for li in DEF_LIST_ITEM_RX.findall(page):
        dm = re.match(r'\s*(.*?)\s*<span class="mt-2 font-bold">(.*?)</span>', li, re.S)
        if dm:
            defs[clean(dm.group(1))] = clean(dm.group(2))

    # side panel facts: Sektor / Sted / Hjemmekontor / Bransje …
    panel = {}
    for label, value in PANEL_ITEM_RX.findall(page):
        panel.setdefault(clean(label).rstrip(":"), clean(value))

    f["frist"] = defs.get("Søknadsfrist") or ""
    if not f["frist"] and jp.get("validThrough"):
        y, mo, dy = jp["validThrough"][:10].split("-")
        f["frist"] = f"{dy}.{mo}.{y}"
    sted = panel.get("Sted", "")
    if not sted and jp.get("jobLocation"):
        addr = jp["jobLocation"].get("address") or {}
        sted = ", ".join(x for x in (addr.get("streetAddress"),
                                     addr.get("postalCode"),
                                     addr.get("addressLocality")) if x)
    f["sted"] = sted
    f["sektor_omfang"] = " · ".join(
        x for x in (panel.get("Sektor"), defs.get("Ansettelsesform"),
                    panel.get("Hjemmekontor")) if x)

    sm = SIST_ENDRET_RX.search(page)
    f["sist_endret"] = sm.group(1).strip() if sm else ""

    if FINN_APPLY_RX.search(page):
        f["soknad"] = 'via FINN («Søk her»)'
    else:
        em = EXT_APPLY_URL_RX.search(page)
        f["soknad"] = em.group(1) if em else ""

    bm = BODY_RX.search(page)
    f["body"] = body_to_text(bm.group(1)) if bm else ""
    gm = EMPLOYER_BODY_RX.search(page)
    f["employer_desc"] = body_to_text(gm.group(1)) if gm else ""
    return f


def render_md(f):
    """Render the exact markdown shape gen_stack.parse_finn_md() expects."""
    out = [f"# {f['title']}", ""]
    out.append(f"- Bedrift: {f['bedrift']}")
    if f["frist"]:
        out.append(f"- Frist: {f['frist']}")
    if f["sted"]:
        out.append(f"- Sted: {f['sted']}")
    if f["sektor_omfang"]:
        out.append(f"- Sektor/Omfang: {f['sektor_omfang']}")
    kode_line = f"- FINN-kode: {f['kode']}"
    if f["sist_endret"]:
        kode_line += f" · Sist endret: {f['sist_endret']}"
    out.append(kode_line)
    if f["soknad"]:
        out.append(f"- Søknad: {f['soknad']}")
    out.append("")
    if f["employer_desc"]:
        first = f["employer_desc"].split("\n", 1)[0].strip()
        out += [f"Arbeidsgiver-beskrivelse: {first}", ""]
    out += ["## Annonsetekst", "", f["body"], ""]
    return "\n".join(out)


def load_state():
    if STATE_PATH.exists():
        return json.loads(STATE_PATH.read_text())
    return {"last_run": None, "seen": {}}


def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", "--query", action="append", default=[],
                    help="search term (repeatable; default: utvikler)")
    ap.add_argument("--location", default=LOCATION_OSLO,
                    help=f"finn location code (default: {LOCATION_OSLO} = Oslo)")
    ap.add_argument("--max-ads", type=int, default=10, metavar="N",
                    help=f"max ads to fetch this run (default 10, hard cap {MAX_FETCH_CAP})")
    ap.add_argument("--fetch-new", action="store_true",
                    help="fetch and file intake/finn/<kode>.md for every NEW hit")
    ap.add_argument("--dry", action="store_true",
                    help="list only — no state write, no ad fetches")
    args = ap.parse_args()

    queries = args.query or ["utvikler"]
    max_ads = min(args.max_ads, MAX_FETCH_CAP)
    if args.max_ads > MAX_FETCH_CAP:
        print(f"! --max-ads {args.max_ads} over cap, begrenser til {MAX_FETCH_CAP}",
              file=sys.stderr)

    hits, seen_order = [], {}
    totals = []
    for q in queries:
        try:
            found, total = search(q, args.location)
        except Exception as e:
            print(f"! søk '{q}' feilet: {e}", file=sys.stderr)
            continue
        totals.append(f"'{q}': {total if total is not None else '?'} treff")
        for h in found:
            if h["kode"] not in seen_order:
                seen_order[h["kode"]] = len(seen_order)
                hits.append(h)
    if not hits:
        sys.exit("ingen treff (eller alle søk feilet) — ingenting gjort")

    state = load_state()
    seen = state["seen"]
    fresh = [h for h in hits if h["kode"] not in seen]

    loc = args.location if args.location != LOCATION_OSLO else "Oslo"
    print(f"finn.no {loc} {' '.join(totals)} — {len(hits)} unike, "
          f"{len(fresh)} nye siden forrige kjøring")

    if not seen and not args.fetch_new:
        # first-ever run: seed the baseline so day one isn't a flood of "new"
        print(f"første kjøring — grunnbaseline: merker {len(hits)} koder som sett "
              f"(henter ingen annonser; bruk --fetch-new for å hente)")
        if not args.dry:
            seen.update({h["kode"]: h["title"] for h in hits})
    elif fresh:
        print(f"\n=== {len(fresh)} ny(e) ===")
        for h in fresh:
            print(f" · {h['company'] or '?'} — {h['title']} [{h['kode']}]")
            print(f"   {h['url']}")
        if not args.dry and not args.fetch_new:
            # reported hits count as surfaced (same semantics as poll_nav)
            seen.update({h["kode"]: h["title"] for h in fresh})

    fetched = 0
    if args.fetch_new and fresh and not args.dry:
        FINN_DIR.mkdir(parents=True, exist_ok=True)
        for h in fresh[:max_ads]:
            kode = h["kode"]
            try:
                f = parse_ad_page(fetch(h["url"]), kode)
                path = FINN_DIR / f"{kode}.md"
                path.write_text(render_md(f))
            except Exception as e:
                print(f"  ! henting av {kode} feilet: {e}", file=sys.stderr)
                continue  # never crash on one bad ad; leave unseen for retry
            fetched += 1
            seen[kode] = f["title"]
            print(f"  ✓ skrev {os.path.relpath(path, ROOT)}"
                  + ("" if f["body"] else "  (! tom annonstekst)"))
        if len(fresh) > max_ads:
            print(f"  (fant {len(fresh)} nye, hentet de {max_ads} første — "
                  f"kjør igjen for resten)")
    elif args.fetch_new and args.dry:
        print("(dry — henter ikke annonser)")

    if not args.dry:
        state["last_run"] = datetime.now(timezone.utc).isoformat(timespec="seconds")
        STATE_PATH.parent.mkdir(exist_ok=True)
        STATE_PATH.write_text(json.dumps(state, indent=1, ensure_ascii=False))
        print(f"tilstand: .state/{STATE_PATH.name} ({len(seen)} sett)"
              + (f", {fetched} hentet nå" if fetched else ""))


if __name__ == "__main__":
    main()
