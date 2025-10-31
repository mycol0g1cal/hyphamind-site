---
layout: default
title: Dashboard
description: Demo consent-first dashboard reading a geometry map.
permalink: /dashboard/
---

<section class="container">
  <h1 class="mt-0">Consent‑first dashboard</h1>
  <p class="mt-1">This page loads <span class="code-inline">data/cart_geometry_map.json</span>, visualises the metabolic loop, and highlights entropy measured by EYE.</p>
  <div class="card" data-accent="teal" id="dashboard-status">Loading demo geometry…</div>
</section>

<section class="container dashboard-grid mt-2">
  <section class="dashboard-list" id="nodes-list">
    <h3>Nodes</h3>
    <ul></ul>
  </section>
  <section class="dashboard-list" id="edges-list">
    <h3>Edges</h3>
    <ul></ul>
  </section>
</section>

<section class="container mt-2">
  <div class="card" data-accent="gold">
    <h3 class="mt-0">Metrics</h3>
    <div class="flex flex-column flex-auto" id="metrics"></div>
  </div>
</section>

<section class="container mt-2">
  <div class="card" data-accent="amber">
    <h3 class="mt-0">Evidence paths</h3>
    <pre id="evidence-paths">(loading…)</pre>
  </div>
</section>

<script src="{{ '/assets/js/main.js' | relative_url }}"></script>
