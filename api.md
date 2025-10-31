---
layout: default
title: API
description: Minimal operator-facing API surface with consent receipts.
permalink: /api/
---

<section class="container">
  <h1 class="mt-0">Routes</h1>
  <p class="mt-1">HyphaMind exposes a minimal API surface aimed at operators and orchestrators. Every route expects consent receipts in headers and payloads.</p>
  <div class="card table-card" data-accent="teal">
    <table>
      <thead>
        <tr><th>Route</th><th>Description</th><th>Notes</th></tr>
      </thead>
      <tbody>
        <tr>
          <td><span class="code-inline">POST /chorus/storm/run</span></td>
          <td>Start a Chorus‑managed run with ROOT receipts.</td>
          <td>Requires <span class="code-inline">root.digest</span> and <span class="code-inline">consent_envelope_id</span>.</td>
        </tr>
        <tr>
          <td><span class="code-inline">POST /chorus/eye/refrain</span></td>
          <td>Manually trigger a REFRAIN pause with operator note.</td>
          <td>ECE threshold optional; defaults to 0.08.</td>
        </tr>
        <tr>
          <td><span class="code-inline">POST /chorus/cart/query</span></td>
          <td>Query cart geometry and evidence paths.</td>
          <td>Only SPORE‑vetted nodes are returned.</td>
        </tr>
        <tr>
          <td><span class="code-inline">POST /chorus/bard/brief</span></td>
          <td>Generate a human‑readable briefing for auditors.</td>
          <td>Requires SCAR marker and operator note.</td>
        </tr>
        <tr>
          <td><span class="code-inline">POST /chorus/song/state</span></td>
          <td>Retrieve current run state, including REFRAIN status.</td>
          <td>Includes policy latency and consent coverage metrics.</td>
        </tr>
      </tbody>
    </table>
  </div>
</section>

<section class="container mt-2">
  <h2 class="mt-0">VALVE guard pseudocode</h2>
  <div class="card" data-accent="gold">
<pre><code>def valve_guard(request):
    envelope = request.json
    required = ["consent_envelope_id", "trace_span_id", "root.digest"]
    for field in required:
        if field not in envelope or not envelope[field]:
            raise Refusal(code="VALVE.MISSING_FIELD",
                          reason=f"{field} required before reach")

    if envelope.get("export.intent") == "public" and not envelope.get("c2pa.manifest"):
        raise Refusal(code="VALVE.MISSING_C2PA",
                      reason="Public exports require C2PA manifest")

    if not envelope.get("trace_span_id").startswith("trace-"):
        raise Refusal(code="VALVE.BAD_TRACE", reason="Trace ID malformed")

    return allow()
</code></pre>
    <p class="small">VALVE never forwards envelopes without consent receipts or traceability. Public exports also require a valid C2PA manifest, enforcing authenticity at the edge.</p>
  </div>
</section>

