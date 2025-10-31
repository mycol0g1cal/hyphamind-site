---
layout: default
title: Quickstart
description: Minimum viable HyphaMind loop — local smoke lane.
permalink: /quickstart/
redirect_from:
  - /quickstart.html
---

<section class="container">
  <h1 class="mt-0">Quickstart</h1>
  <p class="mt-1">Run the minimum viable HyphaMind loop locally. These instructions assume you have the automation checked out.</p>
  <div class="card" data-accent="teal">
    <h3 class="mt-0">1. Prepare a virtual environment</h3>
    <pre><code>python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt</code></pre>
  </div>
  <div class="card" data-accent="gold">
    <h3 class="mt-0">2. Run the Chorus smoke lane</h3>
    <pre><code>make chorus-smoke
make chorus-receipts-check</code></pre>
  </div>
  <div class="card" data-accent="amber">
    <h3 class="mt-0">3. Inspect REFRAIN output</h3>
    <ul class="checklist">
      <li><strong>MIRE event</strong> — describes the anomaly that tripped REFRAIN.</li>
      <li><strong>SCAR marker</strong> — confirms the pause is recorded with provenance.</li>
      <li><strong>Operator action</strong> — review the run, annotate, and resume intentionally.</li>
    </ul>
  </div>
</section>
