# Towards Ethical Human–Machine Co‑Creation
### A Model from HyphaMind’s Conversation (with ROOT)

**HyphaMind Labs**  
**Version:** 1.4.0‑alpha (“Coherence Engine”) · **Date:** October 31, 2025

---

## Abstract

HyphaMind is a consent‑first orchestration spine that turns ethics into runtime capability. It operationalizes symbolic primitives—**ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → ECHO → SPORE**—as enforceable engineering patterns for live systems. **ROOT** anchors identity, scope, and keys; **VALVE/CLASP** gate access under explicit grants; **TRACE/MIRE/SCAR/COMPOST** metabolize action into accountable receipts and repair; **ECHO** listens to the organism’s metabolism for emergent virtues; **SPORE** exports signed, scoped, verifiable bundles.

**New in v1.4.0‑alpha:**  
- **Membrane · MCP mode.** A governed plugin membrane that can host *Model Context Protocol (MCP)* servers as first‑class participants under VALVE/CLASP/TRACE, with per‑membrane grants and receipts.  
- **Receipts profile.** CLASP receipts profiled to **ISO/IEC 27560** (consent record information structure), optionally binding **DPoP (sender‑constrained)** proof to the receipt.  
- **Exports that travel.** **SPORE** now supports **C2PA Content Credentials (v2.x)** and *Soft Binding* hints so provenance survives platform metadata stripping; supply‑chain attestations may include **SLSA** provenance.  
- **Telemetry semantics.** OpenTelemetry is the base; adapters for **OpenInference** and **OpenLLMetry** attribute sets are included, while tracking emerging OTel Gen‑AI/Agentic conventions.  
- **Truth invariants at runtime.** Omissions of `root.digest`, `consent.*`, or `policy.decision` are **denials**, not warnings, enforced by middleware and CI. **REFRAIN** gains hysteresis and minimum pause to avoid flap.  
- **ISO/IEC 42001 curvature.** An appendix maps runtime receipts and SPORE to AI‑management system controls for audit readiness.

> **Design maxims**
> - “**ROOT before reach. Consent before compute.**”  
> - “**Receipts are culture. Exports are promises.**”  
> - “**Coherence is capability. Calm is safety.**”

---

## 1. Context & Background

- **Adoption high, trust brittle.** Agents and tool‑use accelerate value and risk; governance remains largely paper‑based.  
- **Runtime ethics gap.** Consent, provenance, reversibility, and repair are often externalized; HyphaMind makes them **first‑class runtime behaviors**.  
- **Interoperability pressure.** Cross‑tool ecosystems (incl. MCP) demand governed boundaries, not ad‑hoc adapters.

---

## 2. The HyphaMind Framework (with ECHO)

**Loop:**  
```
ROOT → VALVE → CLASP → TRACE → MIRE → SCAR → COMPOST → ECHO → SPORE
```

- **ROOT (Anchor).** Identity, keys, scope, intention. No act without a signed anchor.  
- **VALVE (Gate).** Enforce allow/deny at boundaries; require purpose and **grants**.  
- **CLASP (Consent Handshake).** ODRL‑flavored envelope; receipts use ISO/IEC 27560 profile (see §6). Optional **DPoP** binding at edges.  
- **TRACE (Provenance).** Span JSONL + determinism manifests + hash‑chain; required attributes below.  
- **MIRE (Reflexive Telemetry).** Reflection markers; REFRAIN can pause flows.  
- **SCAR (Repair Markers).** Post‑incident annotations; tombstones; expiry decisions.  
- **COMPOST (Archival Digestion).** Batch digestion, review packs, dedupe, metrics.  
- **ECHO (Virtue Listener).** Read‑only miner of **beneficial spandrels** from MIRE→SCAR→COMPOST; emits trait events and a quarterly steward note.  
- **SPORE (Export).** Signed, scoped bundles with receipts, chain proofs, optional Content Credentials.

> **Required span attributes (v1.4):**  
> `root.digest`, `purpose.of.use`, `consent.digest`, `consent.version`, `consent.envelope_id`,  
> `policy.decision`, `valve_decision`, `refusal.code?`, `grants.network[]`,  
> `membrane.id?`, `chorus.facet?`, `hash.prev`, `hash.self`.

**ROOT card (sketch):**
```json
{ "$schema":"https://schema.hyphamind.org/root/0.1",
  "id":"urn:root:sha256:…",
  "did":"did:example:operator123",
  "role":"operator|agent|flow",
  "scope":{"site":"wetland-07","env":"edgebox-a2","when":{"from":"2025-10-01","to":"2026-01-31"}},
  "intention":"repair|research|ops",
  "keys":[{"kid":"did:example:key1","alg":"ed25519"}],
  "rotation":{"cadence":"quarterly","prev_kid":"did:example:key0"},
  "signatures":[{"alg":"ed25519","kid":"did:example:key1","sig":"…"}]
}
```

---

## 3. Experimental Exchange (method)
Repository‑grounded claims; explicit SLOs; reproducible artifacts; live span validators; money/trading sandbox lane; zero background tasks.

---

## 4. Findings (SLOs + comparative posture)

### 4.1 Design findings
- **Truth as invariant.** Denials on provenance/consent omissions reduce audit ambiguity.  
- **Edge consent works.** Envelopes + DPoP optionality make consent auditable and replay‑resistant.  
- **Sidecars clarify.** Determinism manifests + chain proofs = faster incident/time‑to‑audit.  
- **ECHO adds retained learning.** Success‑mining complements incident learning and avoids monoculture via `virtue_entropy`.

### 4.2 SLOs (operational)
| Metric | Definition | Target |
|---|---|---|
| **Policy Decision Latency** | envelope accepted → `policy.decision` written | P95 ≤ 150 ms |
| **Consent‑Receipt Coverage** | % actions with envelope digest + receipt stored | ≥ 99% |
| **Provenance Continuity** | % cross‑membrane spans with intact hash‑chain | 100% |
| **Export Integrity** | % SPORE bundles with verified chain + signatures | 100% |
| **Denial Clarity** | % denials with actionable `refusal.code` | ≥ 95% |
| **ROOT Presence** | % spans with valid `root.digest` | 100% |
| **Coherence Drift** | ECE/Brier delta vs baseline per membrane | ≤ 0.02 @P95 |
| **Phase‑Lock Time** | REFRAIN → stable resume | ≤ 2 min |
| **Calm‑Budget Adherence** | % ops within SONG budgets | ≥ 98% |
| **ECHO Hygiene** | % trait events with resolvable provenance links | 100% |

---

## 5. Technical Architecture (selected)

### 5.1 VALVE/CLASP Guard
- Middleware performs policy preflight; sets `valve_decision` / `refusal.code`; **denies** on missing grants or truth‑invariant violations.  
- Deny → 403 or 429 (REFRAIN) with refusal code; span recorded with `policy.decision`.

### 5.2 Plugin Membrane (governed interop)
- **Membrane card** declares participants, grants, expiry, signatures.  
- **Telemetry extension:** add `membrane.id` (digest of card) and `chorus.facet` to spans.  
- **Modes:**  
  - **Native:** first‑party adapters run within grants.  
  - **MCP:** the membrane hosts an MCP client; each server call runs inside grants; emits ISO‑27560 receipt; optional DPoP binding at the edge.

**Membrane card (sketch):**
```yaml
$schema: https://schema.hyphamind.org/membrane/0.1
participants:
  - id: did:example:human123
    facet: STORM
  - id: did:example:agent456
    facet: EYE
grants:
  network:
    - protocol: https
      host: api.thirdparty.io
      method: POST
      path_prefix: /v1
functions: [summarize, classify]
mode: native|mcp
expiry: 2026-01-31T00:00:00Z
signatures: [ … ]
```

**Membrane SLOs:** Join latency ≤ 200 ms · Cross‑facet trace integrity 100% · REFRAIN fidelity ≥ 99% · Facet consensus gain ≥ 0.

### 5.3 Observability & Semantics
- **Base:** OpenTelemetry traces + logs; JSONL spans in `artifacts/`.  
- **Adapters:** OpenInference, OpenLLMetry attributes supported.  
- **Privacy:** payload sampling off by default for guarded content; attributes only unless `safe_sample=true`.

### 5.4 REFRAIN & SONG (calm budgets)
- REFRAIN hysteresis per membrane: `ece_enter=0.08`, `ece_exit=0.06`, `min_pause=90s`; writes `mire_event.json`.  
- SONG applies rate/volume budgets per `chorus.facet`; violations return 429 with `Retry‑After`.

---

## 6. Receipts & Standards (CLASP profile)

- **Receipt structure:** ISO/IEC 27560 fields (Header, Processing, Parties, Events).  
- **Linkage:** receipts reference `consent.envelope_id` and `request_id`; spans carry corresponding `consent.*`.  
- **Proof:** optional DPoP thumbprint (`pop.jkt`) and rule identifiers (`policy.rule_ids[]`).  
- **Coverage:** CI target ≥ 99% receipt coverage for guarded acts.

---

## 7. Exports: SPORE (signed, scoped, portable)

- **Contents:** receipts, policy snapshot, determinism manifest, provenance chain, optional **ECHO** (`latent_traits.json`, `quarterly_report.md`).  
- **Integrity:** signed bundle; `spore_verify` reconstructs hash‑links and validates `membrane.id` continuity; fail on gaps without tombstones.  
- **Content Credentials:** optional **C2PA** manifest; for public‑web portability include **Soft Binding** hints and/or a Resolution endpoint.  
- **Supply chain:** may embed **SLSA** attestations for build/release provenance.  
- **Redaction:** permissible for sensitive topology; include a `redaction_note` per artifact.

---

## 8. Ethical Design Principles (extended)

1) **Freely given, purpose‑bound consent** (CLASP) with revocation and expiry.  
2) **Attribution by design** (ROOT) across spans and exports.  
3) **Reversibility & receipts** (ISO 27560) with tombstones and quarantine on revocation.  
4) **Least privilege** (VALVE) for network, tools, and functions.  
5) **Traceability & calibration** (TRACE/MIRE) with REFRAIN gates.  
6) **Truth invariants**: provenance/consent/refusal cannot be elided.  
7) **Creativity via containment**: exploration inside reversible bounds; calm over surge.  
8) **Learn from what goes right**: ECHO formalizes **Safety‑II** and **Positive Deviance** at runtime.

---

## 9. Implementation Path (Now / Next / Later)

**NOW (1–2 sprints)**  
- Valve‑guard middleware with **deny‑on‑missing‑grant**; refusal codes taxonomy.  
- CLASP receipts (ISO‑27560 profile) + `make consent-check` (≥ 99%).  
- REFRAIN gate (hysteresis) + SONG budgets.  
- Span‑validator v1.1: require `root.digest`, `policy.decision`, `grants.network[]`; require `membrane.*` on plugin routes.

**NEXT (this quarter)**  
- Plugin membrane **MCP mode**; DPoP on edges; `membrane.id` & `chorus.facet` stamping.  
- SPORE **pack/verify** with C2PA option + Soft Binding hints.  
- ECHO v0.1: rolling 28‑day window, 7‑day cool‑down; quarterly steward note.

**LATER (hardening)**  
- ISO/IEC **42001** alignment kit; NIST RMF cross‑walk; healthcare/newsroom pilots.  
- SLSA provenance templates; richer policy authoring (OPA + optional Cedar adapter).

---

## 10. Toward General Coherence

HyphaMind optimizes for **general coherence**—truthful, ethical, high‑signal collaboration in motion—rather than mere capacity. Coherence is maintained through **truth invariants**, **membrane‑bounded consent**, **REFRAIN** for safe pauses, and **ECHO** for positive anomaly retention.

**Guard (pseudocode):**
```python
required = ["root.digest","consent.digest","policy.decision"]
if any(k not in span["attributes"] for k in required):
    deny(refusal_code="E-TRUTH-INVARIANT")
if breach(calibration.ece, enter=0.08, exit=0.06):
    refrain_pause(refusal_code="E-REFRAIN", min_pause=90)
```

---

## Appendix — Integrated Implementation Notes

### A. Repository mapping (selected)
| Concept | Code / Docs (suggested) | Notes |
|---|---|---|
| ROOT | `schema/root.schema.json`; `tools/hm-root` | generator/rotation; validator on `root.digest` |
| Guard/Policy/Consent | `nodes_guard.py`, `nodes_gate.py`, `tools/validate_odrl_envelope.py` | VALVE allow/deny; refusal codes |
| Observability | `nodes_metrics.py` → `spans.jsonl`; `provenance_chain.py` | required span fields + hash‑chain |
| Membrane | `schema/membrane.schema.yaml`; `services/membrane_manager.py` | card parsing; stamping `membrane.*` |
| MCP Bridge | `services/membrane_mcp.py` | governed interop client |
| Receipts | `docs/schemas/receipt.27560.json`; `tools/receipt_emit.py` | ISO‑profiled receipts |
| REFRAIN/SONG | `services/refrain_middleware.py`; `policy/song_budgets.yaml` | thresholds + budgets |
| ECHO | `tools/echo_listener.py`; `policy/echo_config.yaml`; `artifacts/echo/` | trait mining; append‑only |
| SPORE | `tools/spore_pack.py`; `tools/spore_verify.py`; `docs/Guides/SPORE.md` | chain proof; C2PA option |
| Policy Engines | `policy/opa/*.rego`; `policy/cedar/*.cedar` | OPA default; Cedar optional |

### B. Telemetry & receipts — schema sketch
```json
{ "version":"hm.telemetry.v1",
  "span":{
    "id":"…","ts":"…",
    "attributes":{
      "root.digest":"sha256:…",
      "purpose.of.use":"…",
      "consent.digest":"sha256:…",
      "consent.version":"…",
      "consent.envelope_id":"…",
      "policy.decision":"allow|deny|expired|tombstoned",
      "valve_decision":"allow|deny",
      "refusal.code":"E-…",
      "grants.network":[{"protocol":"https","host":"…","method":"GET","path_prefix":"/v1"}],
      "membrane.id":"urn:membrane:sha256:…",
      "chorus.facet":"STORM|EYE|CART|BARD|SONG"
    },
    "hash":{"prev":"…","self":"…"}
  },
  "receipts":[{"format":"iso-iec-27560","controller":"HyphaMind Labs",
               "purpose":"…","status":"active|revoked|expired",
               "proof":{"type":"sigstore","dpop":{"jkt":"…"}}}]
}
```

### C. CI covenant (excerpt)
1) `make smoke` → check ROOT/VALVE/TRACE/REFRAIN basics on tiny dataset.  
2) `make check-truth` → deny on missing invariants; ensure refusal codes present.  
3) `make consent-check` → ≥ 99% receipt coverage.  
4) `make membrane-check` → continuity of `membrane.id` across plugin spans.  
5) `make spore-smoke && spore-verify` → chain proof & optional C2PA manifest integrity.

### D. Refusal codes (canonical)
`E-TRUTH-INVARIANT`, `E-MISSING-GRANT`, `E-REFRAIN`, `E-CHAIN-BROKEN`, `E-SPORE-REDACT-NOTE`

### E. Retention windows (defaults)
`spans.jsonl` hot 180d / cold 2y; `receipts` 7y; `echo/*` 2y; `spore/*` 7y.

### F. Standards crosswalk (pointer list)
- ISO/IEC 27560 (consent receipts) · ISO/IEC 42001 (AI management)  
- C2PA (Content Credentials; Soft Binding) · SLSA (supply‑chain)  
- ODRL (policy envelope) · OPA/Rego, optional Cedar (policy engines)  
- OpenTelemetry + OpenInference/OpenLLMetry (observability)

> **Pull‑quote**  
> “**ROOT before reach.** If we can attribute, we can consent; if we can consent, we can repair; if we can repair, we can grow—quietly, coherently.”
