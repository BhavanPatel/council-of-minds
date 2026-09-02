# Research Example — Market Research

**Trigger:** `sourced council: what is the current pricing and adoption of the top vector databases?`

Explicit trigger `sourced council:` → research mode. Profile: **market-research**.

## Charter
- **Restated:** compile current pricing tiers and adoption signals for leading vector DBs.
- **Sub-questions:** (1) who are the players? (2) published pricing? (3) adoption evidence? (4) what do customers report?
- **Scope:** ≤ 6 months for pricing; out-of-scope: unannounced pricing.

## Panel (5 + mandatory-seat top-up)
competitor-mapper, pricing-scout, adoption-reader, filing-reader, customer-voice; orchestrator
adds **counter-evidence-scout (Adversarial)** and **triangulator (Synthesis)** at panel 6/7.

## Abbreviated Research Verdict

```
## Research Verdict: vector DB pricing + adoption
Verdict ID: rv-2026-09-02-mkt5

### Bottom Line
Published pricing exists for 4 of 5 players [S1][S2][S3][S4]; one is quote-only [pricing-scout].
Adoption signals favour two projects [S6][S7] but rest largely on self-reported metrics.

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | 4/5 publish per-GB pricing | supports | high (0.8) | 4 | [S1],[S2],[S3],[S4] |
| F2 | Adoption led by 2 projects | mixed | low (0.45) | 1 | [S6] (self-reported) |
| F3 | One vendor's "10k customers" unverified | contradicts | med (0.55) | 1→cap 0.5 | [S5 filing absent] |

### Minority Report
counter-evidence-scout: adoption ranking flips if measured by paid seats, not stars.
What would change my mind: independent billing/telemetry data [held: none found].

### Open Questions
No independent adoption metric found (all self-reported) — triangulator flags F2 as not
independently confirmed.

### Falsifiers
If an audited filing contradicts a published price, F1 weakens for that vendor.

### Coverage & Limits
Citation coverage 100% · independence groups: 5 · recency compliance 85% (one price ~8 months old).
```
