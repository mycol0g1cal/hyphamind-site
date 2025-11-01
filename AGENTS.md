**Scope**
- This file applies to the entire `hyphamind-site` repo only. AGENTS.md is not global: each repo can have its own. Tools read AGENTS.md at the repo root (and nested folders) for that repo; files under `~/hyphaMind` are not auto‑applied here.

**Purpose**
- Give humans and coding agents a crisp playbook for updating the website, triggering CI/CD, and coordinating with the `~/hyphaMind` monorepo where the whitepaper and vNext docs live.

**Double-Touch Protocol (Reciprocal)**
- Anytime you edit this file, append the matching guidance under `~/hyphaMind/AGENTS.md` in the “Website Double-Touch” section during the same session; the two files travel in lockstep so collaborators always see the latest rails from either repo.
- Note the change (date + short clause) in the commit message or session notes so downstream reviewers can trace which repo touched the protocol.
- If the change spawns new docs or rituals, list their relative paths here and mirror that list in the monorepo entry.

**Collaborator Quickstart — libbyc0d3x**
- Primary onboarding doc: `docs/libbyc0d3x_onboarding.md` (kept human-friendly; update alongside this file when workflows shift).
- Default workspace handoff: clone the repo, read this file, skim the onboarding doc, then check `WEBROADMAP.md` and `MINIMAP.md` for the active five-slot queue before starting work.
- For questions that span repos, open a short trail note in `~/hyphaMind/docs/vnext/trailnotes/` referencing the slice you are shipping.

**Roadmap ↔ Minimap Ritual**
- `WEBROADMAP.md` stores the thematic arcs, decisions, and acceptance gates; `MINIMAP.md` carries the active five-slot queue reflected in commits/PRs.
- Before starting a slice: confirm the target row in `MINIMAP.md`, cross-reference the linked bullet in `WEBROADMAP.md`, and record the intended acceptance criteria in your branch/PR description.
- After shipping: update both docs in the same PR (or follow-up commit) so the queue advances—move the shipped item into the “Done” lane in `MINIMAP.md`, adjust the roadmap bullet if the decision shifted, and cite related hyphaMind roadmap anchors when relevant.
- When a new initiative appears in `~/hyphaMind/docs/vnext/ROADMAP.md`, add/adjust the matching entry in `WEBROADMAP.md` and note the linkage under “Roadmap Sync” in the onboarding doc.

**Local Dev**
- Full Jekyll preview: `bundle install` then `bundle exec jekyll serve --livereload` → http://localhost:4000
- Quick static peek (no Liquid): `python3 -m http.server 9001`

**Deployment (GitHub Pages)**
- Workflow: `.github/workflows/pages.yml` (Ruby 3.3 + Bundler cache → `bundle exec jekyll build` → upload `_site` → `actions/deploy-pages@v4`).
- Trigger: push to `main` (or manual run). Track with `gh run list` / `gh run watch <id>`.
- One‑time repo setting: Settings → Pages → Build and deployment = GitHub Actions. Custom domain = `hyphamind.ai`.

Notes
- Do not add `actions/configure-pages` to this workflow; the default token cannot auto‑create the Pages site and will fail with `Resource not accessible by integration`.
- Bundler in this repo (Gemfile.lock → `BUNDLED WITH 2.7.2`) requires Ruby ≥ 3.2. The workflow uses Ruby 3.3.
- You can re‑run a failed deploy with `gh run rerun <id>` after fixing settings/DNS.

**DNS For Custom Domain**
- Keep `CNAME` file at repo root: `hyphamind.ai`.
- At Namecheap, apex A records → `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`. Optional `www` CNAME → `mycol0g1cal.github.io`.
- “NotServedByPagesError” or plain page = DNS or Pages not enabled; verify Settings → Pages shows green and re‑run deploy.

Verification
- `dig +short hyphamind.ai` → returns the four GitHub IPs.
- `dig +short www.hyphamind.ai` → returns `mycol0g1cal.github.io.` (if `www` configured).
- If `https://mycol0g1cal.github.io/hyphamind-site/` looks correct but `https://hyphamind.ai/` does not, custom domain isn’t attached yet or still propagating.

**Site Structure**
- `_config.yml` keys:
  - `url: https://hyphamind.ai`, `baseurl: ""`.
  - `community_url`: external community (used by navbar when set).
  - `whitepaper_url`: canonical SoT for the whitepaper (GitHub blob link or site page). Prefer pin to tag/commit when locking.
- Layouts and includes:
  - `_layouts/default.html`: head/meta, navbar (Docs / Blog / Community / Philosophy / Whitepaper), `{% include whitepaper_cta.html %}` above footer.
  - `_includes/whitepaper_cta.html`: CTA section with loop (includes ECHO).
  - `_layouts/card.html`: simple layout for card pages.
- Content:
  - `index.md`: homepage (hero, loop pillars, roadmap). Do not add a root `index.html`—it will override Jekyll and break styling.
  - `docs.md`: Docs landing (links to monorepo Quickstart + vNext trailhead + whitepaper).
  - `cards/*.md`: Four cards scaffolded (About Founder, Personal Ethos, Labs, Contact).
  - `assets/css/styles.css`: site styles and tokens; use `| relative_url` for paths.

Duplicate files caveat
- Historical static `.html` files at repo root can shadow Jekyll pages and carry stale nav/markup. Prefer `.md` sources that use the shared layout. If a root `.html` duplicates a page that now exists as `.md`, delete the `.html` version to avoid inconsistent nav/styling (example: legacy `index.html` was removed).

**Update Recipe**
- Edit `_config.yml:whitepaper_url` when the SoT changes. Consider pinning to a tag/commit.
- Refresh homepage copy in `index.md` (keep the loop with ECHO).
- Update `docs.md` links to monorepo anchors.
- Paste finalized card copy into `cards/*.md` (keep `layout: card`).
- Preview locally, then push to `main` to deploy.

**Acceptance Checklist**
- Navbar shows Docs / Blog / Community / Philosophy / Whitepaper.
- CTA renders above footer; whitepaper link resolves.
- Homepage shows ROOT → … → ECHO → SPORE loop.
- Four cards render under `/cards/*`.
- `bundle exec jekyll build` clean (no Liquid errors).

**Troubleshooting**
- Plain blue/white page: likely a stray `index.html` overshadowing `index.md` or CSS path not using `| relative_url`.
- Deploy 404 / NotFound creating deployment: enable Pages in repo settings; custom domain must be verified before deploy.
- Custom domain shows “Site not found”: DNS not pointing at GitHub Pages yet or certificate not provisioned; verify A/CNAME records and re‑check Settings → Pages.
- Absolute vs relative URLs: the layout uses absolute asset paths (`/assets/...`) paired with `site.url` when needed. Keep `_config.yml:url` set to `https://hyphamind.ai` and `baseurl: ""`. For quick checks via the GitHub Pages domain, assets still resolve correctly because they’re absolute under that host.

**Cross‑Talk With Monorepo (`~/hyphaMind`)**
- Whitepaper SoT: `docs/vnext/whitepaper_vnext.md` (linked via `_config.yml:whitepaper_url`).
- Trailhead: `docs/vnext/README.md` (linked from `docs.md`).
- Helpful anchors to cite from site content:
  - `docs/vnext/GLOSSARY.md` — shared terminology.
  - `docs/vnext/QUICKSTART.md` — onboarding.
  - `docs/vnext/PRIMITIVES.md`, `docs/vnext/ROOT.md`, `docs/vnext/ECHO.md` — concept pages.
  - `docs/vnext/ROADMAP.md` — roadmap notes.
  - Cards source references: `docs/vnext/sites/website_cards_rollup_2025_10_30.md`.
- Ops note: `docs/vnext/planning/email_protonmail_setup_hyphamind_ai.md` (Proton Mail DNS).

Pinning guidance
- When linking the whitepaper from the site, prefer pinning to a tag or commit to avoid drift: e.g., `https://github.com/hyphamind-ai/hyphaMind/blob/v1.4.0-alpha/docs/vnext/whitepaper_vnext.md` or `.../blob/<commit>/...`. Update `_config.yml:whitepaper_url` accordingly when you roll SoT.

**Style & Linking Guidance**
- Use short, concrete copy; prefer stable permalinks into monorepo (tag/commit) when citing SoT.
- When adding links in site markdown: `{{ '/path/' | relative_url }}` for internal, full `https://github.com/...` for external.

**Owners**
- Content owner: HyphaEye
- Code owner: Site Coder

---

**Working Rhythm (Nuance borrowed from hyphaMind AGENTS.md)**
- Status pulses: for multi‑step work, send brief preambles before commands and quick progress pulses every few minutes when long tasks run (builds, DNS propagation checks). Avoid silent hangs.
- Mini‑plan: outline a short, verifiable step list, then mark completion as you go. Favor small PRs.
- Roadmap snapshot: when website work maps to vNext items, reference `~/hyphaMind/docs/vnext/ROADMAP.md` in commit/PR descriptions using concise labels (e.g., `docs(site): navbar + CTA aligns with vNext loop`).
- Trail notes (optional): if the session creates reusable guidance, add a dated note under `~/hyphaMind/docs/vnext/trailnotes/`.

**Commit/PR Conventions**
- Prefer semantic titles (even if this repo doesn’t enforce semantic‑pr):
  - `docs(site): hero + CTA`, `ci(pages): ruby 3.3`, `chore(cards): add founder copy`, `style(css): polish navbar`.
- Keep diffs surgical; do not commit `_site/` or local caches. Use `.jekyll-cache/.gitkeep` only to trigger builds when needed.

**Operational Quick Commands**
- Trigger/inspect deploys: `gh run list`, `gh run watch <id>`, `gh run view <id> --log`.
- DNS sanity (after edits at Namecheap):
  - `dig +short hyphamind.ai` → should return GitHub Pages IPs.
  - `dig +short www.hyphamind.ai` → should CNAME to `mycol0g1cal.github.io` (if `www` used).

**CI Coaching Notes (for libbyc0d3x)**
- Present workflow: `.github/workflows/pages.yml` runs on push to `main`; steps = set up Ruby 3.3 → install gems via cached Bundler → `bundle exec jekyll build` → deploy with `actions/deploy-pages@v4`.
- To inspect a failed run: `gh run list --workflow pages.yml` → `gh run view <id> --log`. Check `bundle exec jekyll build` logs first (Liquid errors, missing includes) before touching deployment settings.
- Enhancements under evaluation: add an optional lint matrix (`bundle exec rubocop` and `npx stylelint`) guarded behind `workflow_dispatch` inputs; surface a job summary artifact that links to preview builds (`actions/upload-artifact` with `_site` zipped) for review before production release.
- Keep secrets out of the pipeline; GitHub Pages uses the default `GITHUB_TOKEN`, so no PATs needed. If preview artifacts are added, ensure they expire quickly (`retention-days: 3`) and never contain `.jekyll-cache`.

**Invariants (content idiom)**
- Keep the canonical loop with ECHO: `ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → ECHO → SPORE`.
- Whitepaper CTA present on pages using the default layout; navbar exposes Docs / Blog / Community / Philosophy / Whitepaper.

---

**Dual‑Repo Sync Playbook (Monorepo ↔ Site)**
- Source of truth lives in `~/hyphaMind` (whitepaper and vNext docs). The site mirrors stable links and copy.
- Whitepaper pin:
  - Find latest commit touching `docs/vnext/whitepaper_vnext.md`:
    - `gh api repos/hyphamind-ai/hyphaMind/commits -f path=docs/vnext/whitepaper_vnext.md -f sha=main -f per_page=1 | jq -r '.[0].sha'`
  - Update `_config.yml:whitepaper_url` to the pinned commit URL.
  - Commit to `main` → deploy runs.
- Copy updates (cards/home/docs):
  - Prefer editing in this repo. If sourcing from monorepo docs (e.g., cards rollup), paste and adapt; avoid deep coupling.
- Nav + labels:
  - Keep Docs / Blog / Web / Philosophy. “Philosophy” should always point to the pinned whitepaper URL.

**Resume Checklist (either repo)**
- List recent work: `git log --oneline -n 10`; open PRs: `gh pr list`.
- Site deploy status: `gh run list` (look for “Deploy static site”) then `gh run view <id> --log`.
- Local smoke: `bundle exec jekyll build`.
- Domain health (site): `dig +short hyphamind.ai` (four GitHub IPs), `dig +short www.hyphamind.ai` (CNAME to `mycol0g1cal.github.io`).
