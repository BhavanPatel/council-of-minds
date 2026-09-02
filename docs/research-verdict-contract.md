# Research Verdict — Output Contract (v4.0)

The Research Verdict is the deliverable of the Research Council (mode `research`). Where a
Decision Verdict recommends **what to do**, a Research Verdict reports **what the evidence
says** — with per-claim confidence, preserved dissent, and falsifiers.

> Framing: this is **adversarial evidence auditing**, not accuracy amplification. The
> verdict's value is provenance, entailment, and coverage discipline — not a claim that
> debate made the answer more correct.

The verdict is assembled by **brief-writer** (Theme R10) at round R6, after the per-claim
confidence vote. Report generation is a **first-class deliverable**, not an afterthought.

---

## Template

```markdown
## Research Verdict: {short topic label}
Verdict ID: rv-{YYYY-MM-DD}-{short-id}

### Bottom Line
{2–5 sentences answering the Charter question directly. Every load-bearing claim carries an
inline source id [S3] or is explicitly marked [panel inference, unsourced]. No unsourced
load-bearing claim may appear here unlabelled.}

### Findings
| # | Claim | Stance | Confidence | Independence groups | Sources |
|---|-------|--------|-----------|--------------------|---------|
| F1 | {claim} | supports/contradicts/mixed | high/med/low (0.NN) | {N} | [S1],[S4] |
| F2 | ... | ... | ... | ... | ... |

### Confidence Ledger
{Per-claim confidence with its basis. NEVER a single report-level number.}
- **F1 — {0.NN}**: {basis — independence groups, recency, sample size, verification status}
- **F2 — {0.NN}**: {basis}
Caps applied: single-independence-group → 0.5; unverified/demoted → 0.4.

### Contested Findings
{Claims still in dispute after R4/R4b. Present BOTH sides with the source ids each rests on.
Do not resolve artificially.}

### Minority Report
{Strongest dissenting research position. MUST record:
 - the claim,
 - the sources it holds,
 - "What would change my mind: {specific finding/source that would flip it}".}

### Open Questions
{Sub-questions with no evidence, or claims DEMOTED by the fact-checker. "Searched, found
nothing" is distinguished from "never searched".}

### Falsifiers
{Observable findings that would overturn the Bottom Line. Format:
 "If {retrievable observation} is found, F{n} falls because {why}."}

### Next Retrieval
{The single highest-value retrieval that would most strengthen this verdict.
Format: "{retrieve what} from {source class} to resolve {sub-question}."}

### Coverage & Limits
- Citation coverage: {%} of load-bearing claims sourced
- Citation accuracy: {%} of checked citations that passed entailment
- Independence groups: {N}
- Recency compliance: {% of sources within the declared window}
- Territory compliance: {pass/fail — did each researcher stay in its lane?}
- Retrieval capability: {full | snippet-only | prior-knowledge-briefing}

### Source Appendix
{Numbered sources grouped by independence group. Sources sharing an origin are grouped so N
reprints of one story read as one confirmation.}
- **Group A** (publisher/author/origin): [S1] {title} — {url/DOI}, {date}, class:{class}
- **Group B**: [S2] ...

### Calibration Hook
{Per-finding feedback instruction:
 "council feedback: rv-{id} — F{n} was [confirmed|refuted|unresolved]" (see Phase 21).}

---
Session: research | Panel: {N} researchers | Rounds: R0–R6 | Budget tier: {tier} |
Mandatory seats: {synthesis-researcher} (R10), {adversarial-researcher} (R3) |
Fact-check scope: {scope} | Progressive passes: {N} | Model diversity: {multi | single-varied}
```

---

## Mapping from the Decision Verdict

The Research Verdict reuses the Decision Verdict's spine so the two chambers feel like one
system:

| Decision Verdict section | Research Verdict section |
|--------------------------|--------------------------|
| The Recommendation | **Bottom Line** |
| Kill Criteria | **Falsifiers** |
| Concrete Next Step | **Next Retrieval** |
| Minority Report | **Minority Report** (+ "what would change my mind" + held sources) |
| Points of Disagreement | **Contested Findings** |
| Unresolved Questions | **Open Questions** |
| Vote Tally (per-position) | **Confidence Ledger** (per-claim) |

---

## Hard Rules

1. **No unsourced load-bearing claim in the Bottom Line** unless explicitly marked
   `[panel inference, unsourced]`.
2. **Confidence is PER-CLAIM**, never a single report-level number.
3. **Confidence caps:** single independence group → **0.5**; unverified/demoted → **0.4**.
4. **Minority Report must record "what would change my mind"** plus the sources it holds.
5. **Independence groups, not raw counts** — the Source Appendix groups reprints/syndication.
6. **Coverage Auditor metrics are mandatory** — citation coverage %, citation accuracy,
   independence-group count, recency compliance (mirrors deep-research benchmark metrics).
7. **Retrieval capability is disclosed** — a prior-knowledge briefing is never dressed up as
   a sourced verdict.
8. **Dissent and falsifiers are never dropped** to make the verdict look cleaner.

---

## Coverage Auditor

The **coverage-auditor** (Theme R10) computes the Coverage & Limits block:

- **Citation coverage** = load-bearing claims with ≥1 source ÷ total load-bearing claims.
- **Citation accuracy** = citations that passed the fact-checker's entailment check ÷
  citations checked.
- **Independence-group count** = distinct `independence_group` values backing the verdict.
- **Recency compliance** = sources within the Charter's declared window ÷ total sources.
- **Territory compliance** = pass if every researcher stayed within its assigned source
  class + intent; fail names the lane collisions.

Coverage below threshold **gates the verdict** (R5 Enforcement Scan) — the verdict is
emitted with the gap flagged, never with the gap hidden.
