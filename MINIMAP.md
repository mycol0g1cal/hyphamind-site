---
schema: hyphamind.site-minimap@v1
handshake:
  depends_on:
    - WEBROADMAP.md
    - ../hyphaMind/docs/vnext/ROADMAP.md
  steward: "@libbyc0d3x"
trace:
  last_reviewed: "2025-11-01"
---

# MINIMAP — Web Delivery Slots

Five-slot queue for the website delivery stream. Update this file alongside `WEBROADMAP.md` whenever work moves; the two documents stay in the same commit or paired commits. Slots flow from bottom (Next+2) toward the top (Done-2).

## Snapshot (2025-11-01)

- **Done-2 — Custom Domain Receipts**
  - DNS verified against GitHub Pages IPs; `CNAME` anchored to `hyphamind.ai`; instructions recorded in `AGENTS.md` (DNS + troubleshooting).
- **Done-1 — Navbar + CTA Alignment**
  - Navbar exposes Docs / Blog / Community / Philosophy / Whitepaper; default layout surfaces `whitepaper_cta.html`; acceptance checklist captured in `AGENTS.md`.
- **Next — Community Intake Loop (Welcome Surface)**
  - Deliverables: `/community/` covenant section, consent-aware join form/CTA resolution, success/thank-you state, documented `community@` routing choice.
  - References: `WEBROADMAP.md#1-community-welcome-surface`, `~/hyphaMind/docs/vnext/ROADMAP.md` “Community Mesh”.
- **Next+1 — Pattern Guild Index**
  - Deliverables: `/pattern-guild/` page with ≥2 patterns and glossary links; update `docs.md` pointer if needed.
  - References: `WEBROADMAP.md#2-pattern-guild--chorus-rhythm`, `~/hyphaMind/docs/vnext/PRIMITIVES.md`.
- **Next+2 — Chorus Calendar + Thank-you Loop**
  - Deliverables: `/chorus/` calendar block (iCal embed or curated list), join confirmation loop tuned to Chorus cadence, optional subscribe instructions.
  - References: `WEBROADMAP.md#2-pattern-guild--chorus-rhythm`, `~/hyphaMind/docs/vnext/ROADMAP.md#chorus`.

## Update Ritual
1. Change the relevant slot (promotion, completion, new work) then adjust the paired section in `WEBROADMAP.md`.
2. Link the slice to a roadmap anchor (hyphaMind) and to any new site docs or assets you touched.
3. Commit both files together; mention “minimap sync” in the message so reviewers spot the paired move.
4. When a slot ships, move it upward (e.g., `Next` → `Done-1`) and add acceptance evidence in the bullet.

## Slice Template (for PR bodies or trail notes)
- **Slot:** which minimap entry you are advancing.
- **Goal:** user-facing outcome in one sentence.
- **Files:** key paths touched (site + monorepo if applicable).
- **Receipts:** how you validated the slice (local build, manual check, CI run link).

Refer to `docs/libbyc0d3x_onboarding.md` for examples of framing a slice and for CI walkthroughs.
