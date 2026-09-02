# Research Example — Landscape Scan

**Trigger:** `research council: what open-source multi-agent debate frameworks exist as of this quarter?`

Auto-detect routes to research mode (recency term "as of this quarter", asks what IS, no
options enumerated). Profile: **landscape-scan**.

## Charter
- **Restated:** enumerate current open-source multi-agent debate/deliberation frameworks.
- **Sub-questions:** (1) which projects exist? (2) how actively maintained? (3) what does each do differently? (4) which are actually adopted?
- **Scope:** sources ≤ 6 months preferred; open-source only; out-of-scope: closed SaaS.

## Panel (5 + mandatory-seat top-up)
competitor-mapper, recency-sweeper, adoption-reader, literature-scout, **gap-mapper (Synthesis)**;
orchestrator adds **counter-evidence-scout (Adversarial)** to satisfy the adversarial seat.

## Abbreviated Research Verdict

```
## Research Verdict: OSS multi-agent debate frameworks (this quarter)
Verdict ID: rv-2026-09-02-lnd1

### Bottom Line
At least four actively-maintained OSS frameworks exist [S1][S3][S6]; two more are archived
[S4]. "First mover" claims by any single project are unsupported [panel inference, unsourced].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | ≥4 frameworks updated in last 6 months | supports | high (0.8) | 3 | [S1],[S3],[S6] |
| F2 | 2 widely-cited projects now archived | supports | med (0.6) | 2 | [S4],[S5] |
| F3 | Adoption concentrated in 1 project | mixed | low (0.4) | 1 | [S2] |

### Contested Findings
F3 rests on a single independence group (one package registry) — capped at 0.4.

### Minority Report
counter-evidence-scout: "activity ≠ adoption." What would change my mind: download/deploy
telemetry from an independent source [held: none found].

### Open Questions
No evidence gathered on enterprise/private forks (gap-mapper).

### Falsifiers
If a fifth maintained framework with >2x the adoption of [S2] is found, F3 falls.

### Next Retrieval
Fetch package-registry download stats from a second independent registry to break F3's single-group cap.

### Coverage & Limits
Citation coverage 100% of load-bearing claims · independence groups: 3 · recency compliance 90%.
```
