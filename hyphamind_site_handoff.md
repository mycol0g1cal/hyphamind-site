# HyphaMind Site — Detailed Handoff for Local Coder (Repo: `mycol0g1cal/hyphamind-site`)
Version: v1.0 · Context locked to Whitepaper SoT: **Coherence Engine · Interop (v1.4.0‑alpha)**

Owner (prose): HyphaEye · Owner (code): Site Coder

---

## 0) Mission of this pass
Bring the public website into **explicit alignment** with the whitepaper SoT and the monorepo’s vNext narrative. This is a *lightweight, surgical* content + layout pass (no framework changes).

**Results after this PR:**
- Homepage hero and sections speak the **Coherence Engine** idiom and include **ECHO** in the loop.
- A visible **Whitepaper CTA** routes users to the SoT.
- Four ready “cards” (About Founder, Personal Ethos, Labs, Contact) are live.
- Navigation exposes Docs, Blog, Community, and Whitepaper.
- Jekyll remains stock; GitHub Pages Action continues unmodified.

---

## 1) Local dev workflow (confirm)
Use Bundler/Jekyll for full rendering (Liquid), or a static server for very rough checks.

```bash
# Full (recommended)
bundle install
bundle exec jekyll serve --livereload
# open http://localhost:4000

# Quick static preview (Liquid not processed)
python3 -m http.server 9001
# open http://localhost:9001
```

---

## 2) Config touch‑ups — `_config.yml`
Add/site‑wide variables for convenience and make sure the basics are correct.

- Verify `title`, `description`, and `url` are correct for the public domain.
- Ensure `community_url` is populated (navbar uses it).
- Add a new key `whitepaper_url` that points to the canonical SoT (GitHub blob URL or a docs page you’ll add).

```yaml
title: HyphaMind
description: HyphaMind: Composting for Cognitive Permaculture and Choral Emergence.
url: https://hyphamind.ai
baseurl: ""

# External links
community_url: https://community.hyphamind.ai

# New: Whitepaper SoT link
whitepaper_url: https://github.com/hyphamind-ai/hyphaMind/blob/main/docs/vnext/WHITEPAPER.md
```

> If you provide a `/whitepaper/` page in this repo, update `whitepaper_url` to the site path instead.

---

## 3) Create a simple Whitepaper CTA include
**File:** `_includes/whitepaper_cta.html`

```html
<section class="cta-whitepaper">
  <div class="container">
    <h2>Coherence Engine · Interop</h2>
    <p>Our whitepaper: ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → <strong>ECHO</strong> → SPORE.</p>
    <a class="btn btn-primary" href="{{ site.whitepaper_url | default: '/whitepaper/' }}">Read the whitepaper</a>
  </div>
</section>

<style>
.cta-whitepaper { padding: 2.5rem 0; border-top: 1px solid #eee; border-bottom: 1px solid #eee; }
.cta-whitepaper .btn { padding: 0.6rem 1rem; text-decoration: none; border: 1px solid #222; }
</style>
```

---

## 4) Layout: inject CTA and improve navbar
**File:** `_layouts/default.html`

- Add a **Whitepaper** link in the navbar.
- Include the CTA above the footer (or directly under hero on the homepage if you prefer).

Minimal diff (illustrative — integrate into your existing HTML carefully):

```html
<!-- inside <nav> ... -->
<ul class="nav">
  <li><a href="/">Home</a></li>
  <li><a href="/docs/">Docs</a></li>
  <li><a href="/blog/">Blog</a></li>
  <li><a href="{{ site.community_url | default: '/community/' }}">Community</a></li>
  <li><a href="{{ site.whitepaper_url | default: '/whitepaper/' }}">Whitepaper</a></li>
</ul>

<!-- near footer: -->
{% include whitepaper_cta.html %}
```

Optional: add simple OpenGraph tags in `<head>`:

```html
<meta property="og:title" content="{{ page.title | default: site.title }}">
<meta property="og:description" content="{{ page.description | default: site.description }}">
<meta property="og:url" content="{{ page.url | absolute_url }}">
<meta property="og:type" content="website">
<link rel="icon" href="/assets/favicon.ico">
```

---

## 5) Homepage content — `index.md`
Update hero and surface the new language (ECHO, Coherence Engine).

Front‑matter stays minimal:
```yaml
---
layout: default
title: HyphaMind
description: Coherence Engine for consent‑first orchestration.
---
```

Replace/augment body with:
```markdown
# HyphaMind — Coherence Engine for accountable intelligence

We grow intelligence as soil. We tune for repair, reversibility, and reciprocal flourishing — not extraction.

**Our loop:** ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → **ECHO** → SPORE.

- Consent‑first orchestration (VALVE/CLASP)
- Receipts and provenance by default (TRACE/COMPOST)
- Reflexive learning from lived practice (ECHO)
- Portable exports with attribution (SPORE)

[Read the Whitepaper →]({{ site.whitepaper_url | default: '/whitepaper/' }})
```

---

## 6) Docs landing — `docs.md` (light pass)
Swap placeholders for real anchors into the monorepo docs or site‑local pages you control.

```markdown
---
layout: default
title: Docs
description: Documentation for HyphaMind — getting started, concepts, and references.
permalink: /docs/
---

# Documentation

Start here to understand HyphaMind’s approach and how to work with our systems.

## Getting Started
- Monorepo Quickstart: https://github.com/hyphamind-ai/hyphaMind#start-here-30-seconds
- Docs vNext Trailhead: https://github.com/hyphamind-ai/hyphaMind/blob/main/docs/vnext/README.md

## Core Concepts
- Coherence Engine loop: ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → **ECHO** → SPORE
- Consent‑first networking; receipts by default; reversibility by design

## References
- API & Guides live in the monorepo (stable links above). Public module snapshots will be mirrored here as they stabilize.
```

---

## 7) Cards collection (new lightweight layout)
Create a simple layout for card‑style pages.

**File:** `_layouts/card.html`
```html
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>{{ page.title }} · {{ site.title }}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="{{ page.summary | default: site.description }}">
  <link rel="stylesheet" href="/assets/site.css">
</head>
<body>
  <main class="container card">
    <h1>{{ page.title }}</h1>
    <p class="summary">{{ page.summary }}</p>
    <article class="content">
      {{ content }}
    </article>
  </main>
</body>
</html>
```

Now add four cards under `cards/`:

- `cards/about-founder.md`
- `cards/personal-ethos.md`
- `cards/labs.md`
- `cards/contact.md`

Use this front‑matter for each:

```markdown
---
layout: card
title: "About the Founder — Dr. Michael J. Shreve"  # adapt per file
summary: "Environmental engineer and systems designer; HyphaMind Labs founder; wastewater + multi‑omics + ethical co‑creation."
permalink: /cards/about-founder/
---

<!-- Body content goes here (copy from monorepo's website_cards_rollup source) -->
```

Paste the body blocks from the **website_cards_rollup** (see monorepo) into each card. Adjust slugs as needed.

---

## 8) Blog & Community stubs (optional quick win)
- Ensure `/blog/` lists posts from `_posts/` (default Jekyll behavior).
- If `community_url` is set, the navbar “Community” points off‑site; otherwise maintain a `/community/` page with a short blurb.

---

## 9) Whitepaper page (optional)
If you prefer on‑site hosting, add `whitepaper.md` and either:
- link to the GitHub whitepaper (monorepo), or
- embed a built HTML export (manual for now).

```markdown
---
layout: default
title: Whitepaper — Coherence Engine · Interop
permalink: /whitepaper/
---

Read the living whitepaper on GitHub:
- https://github.com/hyphamind-ai/hyphaMind/blob/main/docs/vnext/WHITEPAPER.md
```

---

## 10) Styles: light polish (optional)
**File:** `assets/site.css`
```css
.container { max-width: 760px; margin: 0 auto; padding: 1.25rem; }
h1, h2, h3 { line-height: 1.25; }
.summary { color: #444; margin-bottom: 1rem; }
.card article.content { margin-top: 1rem; }
.nav a { margin-right: 0.75rem; }
.btn { display: inline-block; }
```

---

## 11) Deployment & domain check
- GitHub Pages workflow is present; no changes required.
- Ensure repository **Pages** settings read from **GitHub Actions**; public URL should match `_config.yml:url`.
- Commit a `CNAME` file at repo root if using a custom domain (the Action respects it).

---

## 12) Acceptance checklist (site coder)
- [ ] Homepage shows loop with **ECHO** and links to the whitepaper.
- [ ] `_config.yml` includes `community_url` and `whitepaper_url`.
- [ ] Navbar exposes **Docs / Blog / Community / Whitepaper**.
- [ ] `whitepaper_cta.html` renders on pages using the default layout.
- [ ] Four cards render and are reachable under `/cards/*`.
- [ ] `docs.md` points to monorepo Docs vNext and quickstart.
- [ ] No Liquid errors locally (`bundle exec jekyll serve` clean).
