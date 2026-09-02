# Research Example — Claim Verification

**Trigger:** `cite this: "GPT-style models cut customer-support handle time by 40%."`

Explicit trigger `cite this:` → research mode. Profile: **claim-verification** (already
carries both mandatory seats: counter-evidence-scout = R3, triangulator = R10).

## R0 — Charter
- **Restated:** is the "40% handle-time reduction" claim supported by independent evidence?
- **Sub-questions:** (1) where did the number originate? (2) is it independently replicated? (3) is there disconfirming evidence? (4) is the "40%" a like-for-like measure?
- **Scope:** primary sources preferred; ≤ 24 months.

## Panel (5)
primary-source-hunter, citation-tracer, **counter-evidence-scout (R3)**, syndication-unmasker, **triangulator (R10)**.

## R3 Fact-Check highlights
- **Entailment FAIL** on [S2]: the cited blog says "up to 40%", not "40%" → auto-raises an
  INFERENCE CHALLENGE into R4. Claim demoted from "40%" to "up to 40% in one vendor case study".

## Abbreviated Research Verdict

```
## Research Verdict: 40% support handle-time claim
Verdict ID: rv-2026-09-02-cv7

### Bottom Line
The "40%" figure traces to a single vendor case study [S1]; it is NOT independently
replicated [triangulator]. Independent studies report 12–22% [S4][S6].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | "40%" originates in one vendor case study | supports | high (0.8) | 1→cap 0.5 | [S1] |
| F2 | Independent studies show 12–22% | contradicts | med (0.65) | 2 | [S4],[S6] |
| F3 | Many "sources" reprint [S1] | supports | high (0.85) | 1 | [S2],[S3] (syndicated) |

### Minority Report
None credible — even the vendor source is a single case study.
What would change my mind: an independent RCT reproducing ≥35%.

### Open Questions
No evidence on which support tiers the vendor measured (like-for-like unverified).

### Falsifiers
If an independent, pre-registered study reports ≥35%, F2 weakens.

### Coverage & Limits
Citation coverage 100% · citation accuracy 80% (1 entailment fail) · independence groups: 3.
```
