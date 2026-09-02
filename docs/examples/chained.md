# Chained Example — Research → Decision

**Trigger:** `chained council: which vector database should we adopt, given the current landscape?`

A compound question: it asks what to **DO** (adopt one) but the answer depends on **current
facts** (pricing, adoption, maturity). The orchestrator routes it to **chaining** — the
researchers run first, then an advisor panel deliberates over the sourced evidence.
Tier: **Standard** (default for `chained council:`).

---

## Stage 1 — Researchers

Profile: **market-research** + **technical-due-diligence** blend; mandatory Adversarial +
Synthesis seats added by the selector.

**Panel:** competitor-mapper, pricing-scout, adoption-reader, reproducer,
counter-evidence-scout (Adversarial), triangulator (Synthesis).

### Abbreviated Research Verdict

```
## Research Verdict: vector DB landscape
Verdict ID: rv-2026-09-02-vdb7

### Bottom Line
Four credible options; two lead on adoption [S1][S4], one leads on managed pricing [S6].
"Fastest" claims rest on vendor benchmarks [counter-evidence-scout: contested].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Options A and B lead on real adoption | supports | high (0.8) | 3 | [S1],[S2],[S4] |
| F2 | Option C cheapest managed tier | supports | med (0.6) | 2 | [S6],[S7] |
| F3 | "10x faster" is a vendor benchmark, unreplicated | contradicts | med (0.55) | 1→cap 0.5 | [S9] |

### Minority Report
counter-evidence-scout: adoption ranking flips on paid-seat data, none of which is public.
What would change my mind: independent telemetry [held: none found].

### Open Questions
No independent latency benchmark for the workload profile the user cares about.

### Falsifiers
If an independent benchmark contradicts F3's vendor number, re-weight the "speed" axis.

### Coverage & Limits
Citation coverage 100% · independence groups: 6 · recency compliance 90%.
```

---

## Stage 2 — Advisors (over the Research Verdict)

The advisor panel receives the Findings Cards **with source ids intact** and deliberates.
Profile: **engineering**. Panel: architect, shipper, realist, scientist, strategist.

- **scientist** cites F3 to discount the "10x faster" marketing.
- **shipper** raises `INSUFFICIENT-EVIDENCE: no operational cost at our scale` → one bounded
  re-entry to the researchers (a targeted Progressive-Retrieve pass on cost-modeler).
  Re-entry returns a partial answer; residual uncertainty carried to Unresolved Questions.

### Abbreviated Decision Verdict

```
## Council Verdict: vector DB adoption

### The Recommendation
Adopt **Option A**: it leads on real adoption (F1, high) and its maturity de-risks operations.
Treat "speed" claims (F3) as unproven; do not let a vendor benchmark drive the choice.

### Minority Report
realist: if managed cost dominates at scale, Option C (F2) wins — but the scale-cost data is
incomplete (see re-entry). DEALBREAKER if projected monthly cost exceeds budget by >30%.

### Kill Criteria
If an independent benchmark refutes F3 in Option A's favour within 60 days, revisit the speed axis.

### Unresolved Questions
Operational cost at our specific scale (research re-entry returned only list pricing, not our tier).

### Sourced-From
rv-2026-09-02-vdb7
```

---

## Evidence appendix

The full Research Verdict (Stage 1) is retained verbatim beneath the Decision Verdict so the
reader can audit every cited finding.

## What this example shows

- **Research first, decision second** — the choice is grounded in retrieved, per-claim-scored
  evidence rather than advisor priors.
- **Dissent preserved at both layers** — the research Minority Report (adoption-ranking caveat)
  and the decision Minority Report (cost-driven DEALBREAKER) both survive.
- **Bounded re-entry** — `INSUFFICIENT-EVIDENCE` triggered exactly one targeted retrieval pass;
  the residual gap became an Unresolved Question rather than an invented number.
- **`Sourced-From`** — the decision verdict cites the research verdict id, making the evidence
  chain traceable.

See [chaining.md](../chaining.md) for the full chaining contract.
