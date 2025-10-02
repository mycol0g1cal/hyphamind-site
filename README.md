# hyphaMind Static Site

A zero-build, GitHub Pages–ready site served from `docs/hyphamind-site/`.

## Local preview

```bash
cd docs/hyphamind-site
python3 -m http.server 9001
# open http://localhost:9001
```

## Deployment (GitHub Pages via Actions)

This site is deployed by the `hyphamind-pages.yml` workflow, which uploads `docs/hyphamind-site/` as the Pages artifact and publishes it.
To redeploy without changes, run the workflow manually from the Actions tab.
