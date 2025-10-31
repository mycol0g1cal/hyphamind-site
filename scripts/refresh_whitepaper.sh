#!/usr/bin/env bash
set -euo pipefail

# Usage: scripts/refresh_whitepaper.sh <commit_sha>
# Fetches the whitepaper markdown from the monorepo at the given commit
# and writes a local snapshot to whitepaper.md with the site front matter.

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <commit_sha>" >&2
  exit 2
fi

SHA="$1"
RAW_URL="https://raw.githubusercontent.com/hyphamind-ai/hyphaMind/${SHA}/docs/vnext/whitepaper_vnext.md"
echo "Fetching whitepaper from ${RAW_URL}" >&2

TMP=$(mktemp)
if ! curl -fsSL "$RAW_URL" -o "$TMP"; then
  echo "Failed to fetch whitepaper markdown" >&2
  exit 1
fi

cat > whitepaper.md <<EOF
---
layout: default
title: Whitepaper — Coherence Engine
permalink: /whitepaper/
---

<section class="container" style="padding-left:1.5rem">
  <h1 class="mt-0">Whitepaper — Coherence Engine</h1>
  <p class="mt-1">Static snapshot pinned to commit ${SHA}. For the living version, see the monorepo.</p>
  <p class="small"><a href="https://github.com/hyphamind-ai/hyphaMind/blob/${SHA}/docs/vnext/whitepaper_vnext.md" rel="noopener">View on GitHub (pinned)</a></p>
  <hr />
</section>

EOF

cat "$TMP" >> whitepaper.md
rm -f "$TMP"
echo "Wrote whitepaper.md snapshot pinned to ${SHA}" >&2

