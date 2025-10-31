---
layout: default
title: Chorus
description: Operational envelope, role metrics, and REFRAIN guard.
permalink: /chorus/
redirect_from:
  - /chorus.html
---

<section class="container">
  <h1 class="mt-0">Chorus layer</h1>
  <p class="mt-1">Chorus is the operational envelope for HyphaMind runs. Every ingress into Chorus carries the fields engineers need to reconstruct consent.</p>
  <div class="card" data-accent="teal">
    <h3 class="mt-0">Common envelope fields</h3>
    <ul class="wrapped-list">
      <li><span class="code-inline">role</span> — orchestration role (root, valve, clasp, etc.).</li>
      <li><span class="code-inline">run</span> — run identifier used across the metabolic loop.</li>
      <li><span class="code-inline">ts</span> — precise timestamp of the envelope.</li>
      <li><span class="code-inline">consent_envelope_id</span> — resolvable consent record.</li>
      <li><span class="code-inline">trace_span_id</span> — span id linked to telemetry.</li>
    </ul>
    <p class="small">Envelopes without <span class="code-inline">consent_envelope_id</span> or <span class="code-inline">trace_span_id</span> are rejected upstream. ROOT before reach, even at the envelope level.</p>
  </div>
  <div class="card" data-accent="gold">
    <h3 class="mt-0">Role metrics</h3>
    <ul class="inline-list">
      <li>Receipt coverage</li>
      <li>Policy latency</li>
      <li>Consent entropy (ECE)</li>
      <li>Export integrity</li>
    </ul>
  </div>
</section>

<section class="container mt-2">
  <h2 class="mt-0">REFRAIN guard</h2>
  <div class="card" data-accent="amber">
    <p>REFRAIN is a consent‑first pause. When <span class="code-inline">ECE &gt; 0.08</span>, the run stops, a MIRE event is written, and operators must annotate before resuming.</p>
    <ul class="checklist">
      <li><strong>Entropy threshold</strong> — adjustable, default 0.08.</li>
      <li><strong>Annotation required</strong> — resuming without a note is blocked.</li>
      <li><strong>Audit trail</strong> — SCAR marker ties the pause to compliance.</li>
    </ul>
  </div>
</section>
