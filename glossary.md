---
layout: default
title: Glossary
description: Engineer‑speak translations for the HyphaMind metabolic loop.
permalink: /glossary/
---

<section class="container">
  <h1 class="mt-0">Glossary</h1>
  <dl class="card" data-accent="teal">
    <dt>ROOT.digest</dt>
    <dd>Cryptographic digest anchoring the run’s consent receipts. Without it nothing moves.</dd>
    <dt>VALVE.decision</dt>
    <dd>Policy verdict (allow/refuse) plus refusal code that explains why.</dd>
    <dt>CLASP.envelope</dt>
    <dd>Consent envelope binding subject grants to spans. Identified by <span class="code-inline">consent_envelope_id</span>.</dd>
    <dt>TRACE.span</dt>
    <dd>Operational span carrying telemetry. Must include <span class="code-inline">trace_span_id</span> and reference ROOT.</dd>
    <dt>MIRE.event</dt>
    <dd>Entropy or risk event captured when REFRAIN triggers.</dd>
    <dt>SCAR.marker</dt>
    <dd>Compliance marker ensuring denials remain legible to operators and auditors.</dd>
    <dt>COMPOST</dt>
    <dd>Immutable storage for receipts, policies, and annotations. Fuels replay and audit.</dd>
    <dt>SPORE.bundle</dt>
    <dd>Exported artifact vetted against consent receipts and, when public, C2PA manifest.</dd>
    <dt>REFRAIN.pause</dt>
    <dd>System‑level pause triggered when <span class="code-inline">ECE &gt; 0.08</span> or operators request it.</dd>
    <dt>CART</dt>
    <dd>Graph of consent‑aware routes. Only SPORE‑vetted nodes may extend it.</dd>
  </dl>
</section>

