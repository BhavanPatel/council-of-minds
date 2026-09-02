# Chamber Chaining (Research → Decision)

> v4.1 (Phase 20). Council of Minds routes every request to one of two co-equal chambers —
> **Decision** (advisors reason to a verdict) or **Research** (researchers retrieve evidence to
> a sourced verdict). Some questions need both: *what should I do, given the current state of the
> world?* Chaining runs the **Research chamber first**, then feeds its Research Verdict into the
> **Decision chamber** as the evidence base. Dissent is preserved at **both** layers.

No competitor found (as of the Sept 2026 landscape scan) chains a retrieval chamber into a
deliberation chamber while preserving calibrated dissent on both sides.

## When a request chains

A request chains when it asks what to **DO** but the answer **depends on facts that are current,
contested, or unverified**.

| Signal | Example |
|--------|---------|
| Explicit trigger | "chained council: ...", "research then decide: ..." |
| Decision framed on a moving landscape | "which vector DB should we adopt **given the current landscape**" |
| Decision gated on a recent event | "should we migrate to X **now that Y shipped**" |
| A *do*-question carrying an unverified premise | "should we drop framework Z **since it's abandoned**?" (is it?) |

If it is unclear whether the user wants plain research, a plain decision, or a chained run, the
orchestrator **asks once** before dispatching — it never guesses.

## The contract

```
User (compound question)
        │
        ▼
┌─────────────────────┐     Research Verdict (rv-id)
│  RESEARCH CHAMBER   │────  Findings Cards + source ids
│  Charter→Crystallize │      Contested Findings
└─────────────────────┘      research Minority Report
        │                    Open Questions
        ▼  (hand-off, source identity intact)
┌─────────────────────┐
│  DECISION CHAMBER   │  advisors cite / contest findings by id
│  Full/Quick/Duo      │  may raise INSUFFICIENT-EVIDENCE (≤1 re-entry)
└─────────────────────┘
        │
        ▼
Decision Verdict  ──  Sourced-From: rv-id
   + Research Verdict retained as evidence appendix
   + BOTH minority reports preserved
```

### Hand-off payload

The Decision panel receives, with **source identity intact**:

- **Findings Cards** — claim, evidence type, per-claim confidence, stance (supports/contradicts).
- **Source `canonical_id`s** — independence groups preserved (N sources from one origin still
  count as one).
- **Contested Findings**, the **research Minority Report**, and **Open Questions**.

Advisors may **cite a finding by id** and may **contest** it, but must not silently discard a
contested finding. A finding cited into a decision counts as `empirical` evidence only at the
confidence the research chamber assigned it — **never upgraded**.

### Insufficient-evidence re-entry

An advisor raises `INSUFFICIENT-EVIDENCE: {specific gap}` when a load-bearing claim needed for the
decision is missing or weakly sourced.

- The named gap re-enters the Research chamber as a **new sub-question** (a targeted
  Progressive-Retrieve pass, not a full re-run).
- **Bounded to 1 re-entry** per chained run, to prevent a research↔decision ping-pong loop.
- If still unmet after one re-entry, the gap goes to the decision verdict's **Unresolved
  Questions** and the affected claim's confidence is capped — never invented.

### Dissent at both layers

The final chained output carries **two** minority reports, never collapsed:

- the **research Minority Report** ("what would change my mind" + held sources), and
- the **decision Minority Report** (strongest dissent + any DEALBREAKER flag).

### One budget across both chambers

A single tier (Minimal / Lean / Standard / High / Deep / Unlimited) configures **both** chambers
in the same run: research retrieval dimensions *and* decision panel/mode/word-limits. `"chained
council:"` with no tier defaults to **Standard**; add "lean"/"deep" as elsewhere.

## Triggers

| Trigger | Effect |
|---------|--------|
| `chained council: ...` | Research → Decision at Standard |
| `research then decide: ...` | same |
| `deep chained council: ...` | Deep tier across both chambers |
| `lean chained council: ...` | Lean tier across both chambers |

## Output shape

A chained run produces, in order:

1. **Decision Verdict** (the standard Council Verdict template) with a **`Sourced-From`** field
   naming the research verdict id.
2. **Evidence appendix** — the full Research Verdict verbatim.

See `docs/examples/research-chained.md` for a worked example, `docs/research-verdict-contract.md`
for the Research Verdict template, and the `## Chamber Chaining` section of `council-of-minds.md`
for the orchestrator wiring.
