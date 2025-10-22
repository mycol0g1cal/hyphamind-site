# HyphaMind Site (Jekyll)

Static site powered by Jekyll and GitHub Pages.

## Structure

- `_layouts/default.html` — shared HTML head, navbar, footer
- `index.md` — homepage content (hero, sections)
- `about.md`, `mission.md`, `values.md` — simple stubs using the default layout
- `docs.md`, `examples.md`, `blog.md` — additional stubs; blog lists posts from `_posts/`
- `community.md` — Community page with a configurable external join link
- `_posts/` — Jekyll blog posts (a sample post is included)
- `assets/` — CSS, JS, icons, images

## Local preview (Jekyll)

If you have Ruby and Bundler:

```bash
bundle install
bundle exec jekyll serve --livereload
# open http://localhost:4000
```

Alternatively (no Jekyll), you can still spot-check with a static server, but Liquid tags won’t render:

```bash
python3 -m http.server 9001
# open http://localhost:9001 (layout variables won’t be processed)
```

## Deployment

Configured for GitHub Pages via Actions. The workflow builds Jekyll and deploys `_site`.
Ensure your repository’s Pages settings use “GitHub Actions” as the source.
Custom domain is defined in `CNAME`.

### Community link
Set `community_url` in `_config.yml` to your external community (e.g., Discord, Discourse). The navbar includes a primary “Community” button; if `community_url` is blank it falls back to `/community/`.
