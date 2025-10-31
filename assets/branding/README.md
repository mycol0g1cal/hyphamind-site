# Branding and Open Graph (OG) Assets

- OG card source: `assets/og-card.svg` (1200×630 design safe area)
- OG card build-time PNG: `assets/og-card.png` (generated in CI via ImageMagick)
- Meta tags: default to `/assets/og-card.png` in `_layouts/default.html`.

Update flow
- Edit the SVG for text/layout changes.
- CI converts it to PNG during deploy. To preview locally, run:
  - `convert assets/og-card.svg -resize 1200x630! assets/og-card.png` (ImageMagick)

Specs
- Size: 1200×630 px (Twitter/Slack/OG standard)
- Safe text region: avoid extreme edges; keep core content in 1000×500 center.
- Text: “HyphaMind”, “Coherence Engine”, primitives line is acceptable.

Accessibility
- Set descriptive `og:title`/`og:description` in page front matter if a page needs custom previews; otherwise site defaults apply.
