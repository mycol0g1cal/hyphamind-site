---
layout: default
title: Architecture
description: Metabolic loop and invariants.
permalink: /architecture/
---

<section class="container">
  <h1 class="mt-0">Metabolic loop overview</h1>
  <p class="mt-1">HyphaMind’s metabolic loop enforces consent at each hop. The loop stitches technical enforcement with human‑readable receipts so audits are explainable.</p>
  <pre><code>ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → SPORE → ROOT</code></pre>
  <p>The loop is intentionally circular. SPORE exports close only when ROOT receipts are still valid and untouched. Every primitive enriches telemetry for the next stage, preventing unauthorised reach.</p>
</section>

<section class="container mt-2">
  <h2 class="mt-0">Stage‑by‑stage commitments</h2>
  <div class="card" data-accent="teal">
    <h3 class="mt-0">ROOT</h3>
    <p>The entry point anchors the run with <span class="code-inline">root.digest</span>, grants, and provenance seeds. Nothing else progresses without ROOT in place.</p>
  </div>
  <div class="card" data-accent="gold">
    <h3 class="mt-0">VALVE</h3>
    <p>VALVE evaluates policy, applies refusal codes, and records <span class="code-inline">valve_decision</span> and <span class="code-inline">policy.decision</span>. Denied spans never escape to CLASP.</p>
  </div>
  <div class="card" data-accent="amber">
    <h3 class="mt-0">CLASP &amp; TRACE</h3>
    <p>CLASP packages consent envelopes and maintains <span class="code-inline">consent_envelope_id</span>. TRACE emits spans that must include <span class="code-inline">trace_span_id</span> and root provenance.</p>
  </div>
  <div class="card" data-accent="teal">
    <h3 class="mt-0">MIRE &amp; SCAR</h3>
    <p>MIRE watches entropy and writes events whenever REFRAIN triggers. SCAR stamps compliance markers and ensures denials remain legible.</p>
  </div>
  <div class="card" data-accent="gold">
    <h3 class="mt-0">COMPOST &amp; SPORE</h3>
    <p>COMPOST stores immutable audit artifacts. SPORE exports only bundles that pass the consent policy checks and provenance integrity tests.</p>
  </div>
</section>

<section class="container mt-2">
  <h2 class="mt-0">Invariant guardrails</h2>
  <ul class="checklist">
    <li><strong>ROOT before reach</strong> — CLASP and TRACE reject spans without a valid ROOT digest in scope.</li>
    <li><strong>Refusal clarity</strong> — VALVE must return human‑readable refusal codes whenever policy denies a span.</li>
    <li><strong>SPORE exports</strong> — require provenance completion and, when public, C2PA manifests.</li>
    <li><strong>Loop closure</strong> — ROOT revalidates exported bundles before the run is marked complete.</li>
  </ul>
</section>

