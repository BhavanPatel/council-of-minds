# Research Example — Technical Due Diligence

**Trigger:** `research council: does library X actually implement zero-copy streaming as its README claims?`

Profile: **technical-due-diligence**.

## Charter
- **Restated:** verify library X's zero-copy streaming claim against its implementation.
- **Sub-questions:** (1) what does the code do? (2) what does the spec/API doc say? (3) any open issues contradicting it? (4) does it reproduce?
- **Scope:** current release + latest main; ≤ 12 months.

## Panel (5 + mandatory-seat top-up)
code-reader, spec-reader, issue-tracker-miner, reproducer, architecture-mapper; orchestrator
adds **failure-case-hunter (Adversarial)** and **contradiction-mapper (Synthesis)** at panel 6/7 to satisfy
the mandatory seats.

## Abbreviated Research Verdict

```
## Research Verdict: library X zero-copy claim
Verdict ID: rv-2026-09-02-tdd3

### Bottom Line
Zero-copy holds on the read path [S1 code] but NOT on the write path, which buffers [S1][S3 issue].
The README overstates the guarantee.

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Read path is genuinely zero-copy | supports | high (0.85) | 2 | [S1],[S2] |
| F2 | Write path buffers (not zero-copy) | contradicts | high (0.8) | 2 | [S1],[S3] |
| F3 | Reproduced buffering under load | supports | med (0.6) | 1→cap 0.5 | [S4 repro log] |

### Contested Findings
None after Progressive Retrieve — reproducer confirmed the write-path buffering; contradiction resolved.

### Minority Report
failure-case-hunter: buffering may be intentional backpressure, not a defect.
What would change my mind: a maintainer ADR stating the design intent [held: none found].

### Open Questions
No evidence on behaviour with the experimental `io_uring` backend.

### Falsifiers
If a maintainer benchmark shows zero-copy on the write path in the current release, F2 falls.

### Coverage & Limits
Citation coverage 100% · territory compliance pass · independence groups: 3.
```
