---
layout: default
title: Telemetry & Consent
description: Required telemetry span fields and consent receipts.
permalink: /telemetry-consent/
redirect_from:
  - /telemetry-consent.html
---

<section class="container">
  <h1 class="mt-0">Required telemetry fields</h1>
  <p class="mt-1">Version 1.1 of HyphaMind’s telemetry spec codifies the receipt fields every span must carry. Without them, VALVE refuses the span and REFRAIN halts the run.</p>
  <ul class="wrapped-list">
    <li><span class="code-inline">root.digest</span> — anchors provenance to the original consent receipt.</li>
    <li><span class="code-inline">purpose.of.use</span> — enumerated intent for the span.</li>
    <li><span class="code-inline">consent.*</span> — includes <span class="code-inline">consent_envelope_id</span>, <span class="code-inline">consent.terms.version</span>, and applicable grants.</li>
    <li><span class="code-inline">policy.decision</span> — what policy decided about this span.</li>
    <li><span class="code-inline">valve_decision</span> — the VALVE verdict that accompanies the policy decision.</li>
    <li><span class="code-inline">grants.network[]</span> — explicit list of approved network capabilities.</li>
    <li><span class="code-inline">nourish</span> (optional) — contextual notes for stewardship teams.</li>
  </ul>
</section>

<section class="container mt-2">
  <h2 class="mt-0">Consent receipts</h2>
  <div class="card" data-accent="teal">
    <h3 class="mt-0">ISO/IEC 27560 aligned</h3>
    <p>HyphaMind records consent receipts aligned with ISO/IEC 27560. Each receipt includes the controller identity, the subject’s grants, and the data actions authorised.</p>
  </div>
  <div class="card" data-accent="gold">
    <h3 class="mt-0">Provenance chain</h3>
    <p>Receipts form a hash‑linked chain that SPORE verifies before any export. Operators can replay the chain to rebuild the full consent story.</p>
  </div>
  <div class="card" data-accent="amber">
    <h3 class="mt-0">Operator ergonomics</h3>
    <p>Engineers can jump from a dashboard node back to the specific consent envelope and policy decision that authorised it.</p>
  </div>
</section>
