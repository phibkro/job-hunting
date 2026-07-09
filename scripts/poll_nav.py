#!/usr/bin/env python3
"""Poll NAV's job vacancy feed (pam-stilling-feed.nav.no) for Oslo IT-support
candidates.

Flow: public token -> feed pages since last poll (If-Modified-Since) ->
Oslo ACTIVE ads -> full entries -> IT+support filter -> intake/<ts>.json
+ stdout summary. Seen ads are tracked in .state/nav-poll.json so reruns
only surface new ones; INACTIVE transitions of surfaced ads are reported
so their Linear issues can be closed.

Filing to Linear is done by Claude in-session from the intake file.
"""

import argparse
import concurrent.futures as cf
import json
import re
import sys
import urllib.request
from datetime import datetime, timedelta, timezone
from email.utils import format_datetime
from pathlib import Path

BASE = "https://pam-stilling-feed.nav.no"
ROOT = Path(__file__).resolve().parent.parent
STATE_PATH = ROOT / ".state" / "nav-poll.json"
INTAKE_DIR = ROOT / "intake"

MUNICIPALITIES = {"OSLO"}
# candidate = support-signal AND it-signal (in title+description, or IT category)
SUPPORT_RX = re.compile(
    r"brukerstøtte|servicedesk|service\s*desk|helpdesk|help\s*desk"
    r"|\bsupport\b|1\.\s*linje|2\.\s*linje|førstelinje|andrelinje"
    r"|desktop\s*support|end[ -]user|brukernær"
    # tier-1b: AV / learning-tech support (docs/positioning.md)
    r"|av-?teknik\w*|audiovisu\w*|læringsteknologi|undervisningsteknologi"
    r"|digital\s+eksamen|driftstekniker|onsite",
    re.I,
)
IT_RX = re.compile(
    r"\bIT\b|\bIKT\b|teknisk|system|nettverk|\bdrift\b|infrastruktur"
    r"|windows|microsoft|azure|hardware|programvare|software",
    re.I,
)


def fetch_json(path, token, extra_headers=None):
    headers = {"Authorization": f"Bearer {token}", **(extra_headers or {})}
    req = urllib.request.Request(BASE + path, headers=headers)
    with urllib.request.urlopen(req, timeout=30) as r:
        return json.load(r)


def get_public_token():
    with urllib.request.urlopen(BASE + "/api/publicToken", timeout=30) as r:
        body = r.read().decode()
    m = re.search(r"ey[\w-]+\.[\w-]+\.[\w-]+", body)
    if not m:
        sys.exit("could not extract JWT from /api/publicToken response")
    return m.group(0)


def load_state():
    if STATE_PATH.exists():
        return json.loads(STATE_PATH.read_text())
    return {"last_poll": None, "surfaced": {}}


def walk_feed(token, since):
    """Yield compact feed items modified after `since` (aware datetime)."""
    ims = format_datetime(since.astimezone(timezone.utc), usegmt=True)
    url = "/api/v1/feed"
    while url:
        page = fetch_json(url, token, {"If-Modified-Since": ims})
        yield from page["items"]
        url = page.get("next_url")


def is_candidate(ad):
    text = f"{ad.get('title', '')} {ad.get('description', '')}"
    cats = ad.get("occupationCategories") or []
    it_signal = any(c.get("level1") == "IT" for c in cats) or IT_RX.search(text)
    return bool(SUPPORT_RX.search(text) and it_signal)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--since", help="ISO datetime to poll from (default: last poll, else 24h ago)")
    ap.add_argument("--dry", action="store_true", help="don't write state or intake files")
    args = ap.parse_args()

    now = datetime.now(timezone.utc)
    state = load_state()
    if args.since:
        since = datetime.fromisoformat(args.since)
        if since.tzinfo is None:
            since = since.replace(tzinfo=timezone.utc)
    elif state["last_poll"]:
        # 1h overlap so boundary items aren't missed; seen-set dedups
        since = datetime.fromisoformat(state["last_poll"]) - timedelta(hours=1)
    else:
        since = now - timedelta(hours=24)

    token = get_public_token()
    items = list(walk_feed(token, since))

    # newest status per uuid wins (an ad can appear multiple times in the window)
    by_uuid = {}
    for it in items:
        fe = it["_feed_entry"]
        by_uuid[fe["uuid"]] = fe

    local = {u: fe for u, fe in by_uuid.items() if fe.get("municipal") in MUNICIPALITIES}
    surfaced = state["surfaced"]

    # surfaced ads that went inactive -> report so Linear issues get closed
    closed = [u for u, fe in by_uuid.items() if u in surfaced and fe["status"] != "ACTIVE"]

    fresh = {u: fe for u, fe in local.items() if fe["status"] == "ACTIVE" and u not in surfaced}
    print(f"feed since {since:%Y-%m-%d %H:%M}Z: {len(items)} events, "
          f"{len(local)} in {'/'.join(sorted(MUNICIPALITIES))}, {len(fresh)} unseen active")

    def full(u):
        try:
            return fetch_json(f"/api/v1/feedentry/{u}", token)
        except Exception as e:
            print(f"  ! fetch failed for {u}: {e}", file=sys.stderr)
            return None

    with cf.ThreadPoolExecutor(8) as ex:
        entries = [e for e in ex.map(full, fresh) if e and "ad_content" in e]

    candidates = [e["ad_content"] for e in entries if is_candidate(e["ad_content"])]

    if candidates and not args.dry:
        INTAKE_DIR.mkdir(exist_ok=True)
        out = INTAKE_DIR / f"{now:%Y-%m-%dT%H%M}Z.json"
        out.write_text(json.dumps(candidates, indent=1, ensure_ascii=False))
        print(f"wrote {out.relative_to(ROOT)}")

    print(f"\n=== {len(candidates)} new candidate(s) ===")
    for ad in candidates:
        due = (ad.get("applicationDue") or "")[:10]
        print(f" · {ad['employer']['name']} — {ad['title']}")
        print(f"   {ad.get('sector', '?')} | {ad.get('engagementtype', '?')}/{ad.get('extent', '?')} "
              f"| due {due or '?'} | {ad['link']}")

    if closed:
        print(f"\n=== {len(closed)} surfaced ad(s) went INACTIVE (close their issues) ===")
        for u in closed:
            print(f" · {surfaced[u]} ({u})")

    if not args.dry:
        for ad in candidates:
            surfaced[ad["uuid"]] = f"{ad['employer']['name']} — {ad['title']}"
        for u in closed:
            surfaced.pop(u, None)
        state["last_poll"] = now.isoformat()
        STATE_PATH.parent.mkdir(exist_ok=True)
        STATE_PATH.write_text(json.dumps(state, indent=1, ensure_ascii=False))


if __name__ == "__main__":
    main()
