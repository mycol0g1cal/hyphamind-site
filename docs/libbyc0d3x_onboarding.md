# libbyc0d3x Onboarding — hyphamind-site

Welcome aboard! This note distills `AGENTS.md` into a fast path for day-to-day work, spells out how the roadmap/minimap handshake works, and sketches enhancement ideas for the site + CI workflow. Keep this document in sync with any process changes—if you update it, also touch the “Collaborator Quickstart” section in `AGENTS.md` and mirror notes in `~/hyphaMind/AGENTS.md`.

## Role & Anchor
- You lead community-facing site iterations, translating vNext doctrine into approachable web slices.
- Pair with the symbolic architect (HyphaEye) for copy/tone. If a decision affects the canonical doctrine, log a short trail note in `~/hyphaMind/docs/vnext/trailnotes/`.
- Default Git branch = `main`. Ship small, reviewable commits; deploys trigger automatically on push.

## First-Day Checklist
1. Clone the repo and run `bundle install` once (Ruby ≥ 3.2).  
2. Read `AGENTS.md` (focus on Double-Touch, Local Dev, Deployment, Roadmap Ritual).  
3. Skim this onboarding doc and open `WEBROADMAP.md` + `MINIMAP.md`. Confirm which slot is yours before starting.  
4. Run a local preview: `bundle exec jekyll serve --livereload` → http://localhost:4000.  
5. Make a small change (e.g., tweak copy), build locally, and push to confirm CI/Pages is green.  
6. Capture any questions in a trail note or the PR body so the team can iterate on the process.

## Roadmap ↔ Minimap Handshake
- `WEBROADMAP.md` holds the big arcs, decisions, and acceptance notes.  
- `MINIMAP.md` is the five-slot queue (Done-2, Done-1, Next, Next+1, Next+2). Update both files together; they should move in the same PR.  
- Each minimap slot links back to the roadmap section and upstream hyphaMind doc. When you promote or complete a slot:
  1. Edit `MINIMAP.md` (move the slot, add acceptance receipts).
  2. Adjust the corresponding section in `WEBROADMAP.md` (objective, acceptance, dependencies).
  3. Reference the upstream doctrine (e.g., `~/hyphaMind/docs/vnext/ROADMAP.md#community-mesh`) in your PR.  
- Always note the slot and acceptance in your PR template or summary. The `Slice Template` in `MINIMAP.md` is prepped for copy/paste.

## Local Dev How-To
- Full build/preview:  
  ```sh
  bundle exec jekyll serve --livereload
  ```  
  Auto-reloads on save; stop with Ctrl+C.
- Quick static check (no Liquid):  
  ```sh
  python3 -m http.server 9001
  ```
- Assets use absolute paths; ensure new CSS/JS references use `| relative_url` when embedded in Liquid templates.

## CI 101 — GitHub Pages Workflow
- Workflow file: `.github/workflows/pages.yml`. Steps → set up Ruby 3.3 → install gems → `bundle exec jekyll build` → upload `_site` → `actions/deploy-pages@v4`.
- Check run status:  
  ```sh
  gh run list --workflow pages.yml
  gh run view <run-id> --log
  ```  
  Focus on the build step logs; Liquid or Markdown errors show up there.
- Rerun on failure (after fixes): `gh run rerun <run-id>`.
- Preview idea: we can add an opt-in job that uploads `_site` as an artifact before deploy for reviewers (`workflow_dispatch` flag). See “Enhancement Backlog” below.
- DNS issues? Double-check `CNAME` + A records (listed in `AGENTS.md`). Use `dig +short hyphamind.ai` for verification.

## Enhancement Backlog (Pitch List)
1. **Optional lint matrix** — add a `jobs.lint` with `bundle exec rubocop` (for ruby/Jekyll) and `npx stylelint '**/*.css'` (scoped). Gate behind `workflow_dispatch` or `on: pull_request` once we settle on conventions.
2. **Preview artifact job** — publish `_site` as a zipped artifact with `retention-days: 3` so content owners can review before merge. Ensure `.jekyll-cache` stays excluded.
3. **Accessibility sweep** — integrate `pa11y-ci` or `axe-core` via a GitHub Action to catch accessibility regressions.
4. **Docs auto-linker** — script that checks new internal links call `| relative_url` and external links use HTTPS.
5. **Content diff receipts** — small script to generate a Markdown summary of changed sections (use in PR body, can be a make target).

## Cross-Repo Sync Tips
- Whitepaper URL lives in `_config.yml:whitepaper_url`; pin to a hyphaMind tag/commit when the SoT changes.  
- Keep tabs on `~/hyphaMind/docs/vnext/ROADMAP.md` and `docs/vnext/MINIMAP.md`; if they shift, update our roadmap/minimap to reflect the new reality.  
- Major copy sourced from hyphaMind (e.g., cards rollup) should cite its origin in the PR description for provenance.

## Quick Command Reference
- `bundle exec jekyll build` — smoke test before pushing.
- `gh run list --workflow pages.yml` — monitor CI.
- `dig +short hyphamind.ai` — DNS sanity.
- `rg "TODO"` — locate outstanding TODOs in the repo.

## Learning Hooks
- Watch how Liquid templates pull includes (`_layouts/default.html`, `_includes/whitepaper_cta.html`) to understand how global changes propagate.
- Jekyll front matter drives page metadata; review `cards/*.md` for layout examples.
- CI logs can teach how bundler caching works; observe the `bundle config` steps in the workflow to see how dependencies are cached across runs.

If you extend the workflow or roadmap process, update this doc, `AGENTS.md`, and the hyphaMind counterpart in the same session (double-touch protocol). Ping the team in a trail note if the change introduces new rituals.
