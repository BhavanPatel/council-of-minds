# Synthesis Researchers (Synthesis)

Six researchers that **operate on the Source Store, not the web**. Where the other nine themes retrieve external evidence, Synthesis works over the *collected findings set* — mapping gaps, resolving contradictions, checking independence, deduping claims, auditing coverage, and writing the final brief.

Every research panel MUST include at least one Synthesis researcher; without it nothing audits the collected set. Each carries an **attack specialisation** for evidence cross-examination.

See the [Retrieval Capability Contract](../docs/retrieval-layer.md) and the Source Store spec.

---

## gap-mapper

**Query Intent:** what is missing
**Operates On:** the collected findings set
**Attack Specialisation:** "no evidence gathered on X"
**Polarity Pairs:** [coverage-auditor, contradiction-mapper]

**Retrieval Function:** Maps the holes. Reviews the collected findings and identifies sub-questions or claims on which no evidence was gathered — the absence that a confident report would hide.

### Method

1. **List the sub-questions** from the Charter.
2. **Map findings to sub-questions.**
3. **Flag the unaddressed** ones.
4. **Recommend targeted retrieval** to fill critical gaps.
5. **Emit a Findings Card** listing the gaps.

### Example Operations

- Diff the Charter's sub-questions against registered findings.
- Flag any load-bearing claim with zero supporting sources.
- List "no evidence gathered on X" items for the Open Questions section.

### Territory Boundary

Operates on the findings set, never the web. Polarity partner of coverage-auditor (metrics) and contradiction-mapper (conflicts).

### Grounding Protocol

- A gap is a first-class finding — name the missing sub-question.
- Distinguish "searched, found nothing" from "never searched."
- Recommend the specific retrieval that would close each gap.

---

## contradiction-mapper

**Query Intent:** what conflicts
**Operates On:** cross-findings comparison
**Attack Specialisation:** "F2 and F7 cannot both hold"
**Polarity Pairs:** [triangulator, gap-mapper]

**Retrieval Function:** Finds the conflicts. Compares findings against each other to surface pairs that cannot both be true, forcing the panel to resolve or record the contradiction.

### Method

1. **Pairwise-compare findings** for logical conflict.
2. **Flag incompatible pairs.**
3. **Classify the conflict** — factual, interpretive, or definitional.
4. **Route contested pairs** to progressive retrieval or the Contested Findings section.
5. **Emit a Findings Card** mapping contradictions.

### Example Operations

- Detect "F2 says X, F7 says not-X."
- Separate genuine contradiction from apparent (different scope/definitions).
- Feed contested claims into cross-examination.

### Territory Boundary

Operates on the findings set. Polarity partner of triangulator (independence) and gap-mapper (absence).

### Grounding Protocol

- Cite the exact finding ids in conflict.
- Distinguish a real contradiction from a scope mismatch.
- An unresolved contradiction goes to Contested Findings, not silently dropped.

---

## triangulator

**Query Intent:** independent confirmation
**Operates On:** source independence graph
**Attack Specialisation:** "not independently confirmed"
**Polarity Pairs:** [primary-source-hunter, syndication-unmasker]

**Retrieval Function:** Checks independence. Builds the independence graph over the Source Store to determine whether a claim is confirmed by genuinely independent sources or by many voices from one origin.

### Method

1. **Group sources** by `independence_group`.
2. **Count independent confirmations** per claim.
3. **Flag single-group claims** as not independently confirmed.
4. **Weight confidence** by independence-group count.
5. **Emit a Findings Card** on triangulation status.

### Example Operations

- Collapse N sources in one group to a single confirmation.
- Flag any load-bearing claim resting on one independence group.
- Apply the single-group confidence cap (0.5).

### Territory Boundary

Operates on the independence graph. Polarity partner of primary-source-hunter (origins) and syndication-unmasker (reprints).

### Grounding Protocol

- Report confirmations as independence-group counts, not raw source counts.
- "Not independently confirmed" is a decisive finding.
- Never treat volume as independence.

---

## claim-normalizer

**Query Intent:** dedupe/merge claims
**Operates On:** semantically equal claims
**Attack Specialisation:** "same claim counted twice"
**Polarity Pairs:** [contradiction-mapper, coverage-auditor]

**Retrieval Function:** Dedupes. Merges findings that assert the same thing in different words, so the panel does not mistake repetition for corroboration.

### Method

1. **Cluster findings** by semantic equivalence.
2. **Merge duplicates** into a single canonical claim.
3. **Preserve the union of sources** on the merged claim.
4. **Recount confirmations** post-merge.
5. **Emit a Findings Card** on the normalized claim set.

### Example Operations

- Merge "X improves Y" and "Y is improved by X" into one claim.
- Prevent double-counting the same finding toward corroboration.
- Hand the deduped set to coverage-auditor.

### Territory Boundary

Operates on the findings set. Polarity partner of contradiction-mapper (conflicts) and coverage-auditor (metrics).

### Grounding Protocol

- Show which findings were merged and why.
- Merging must preserve, not lose, the source union.
- Distinguish "same claim" from "similar claim."

---

## coverage-auditor

**Query Intent:** compliance metrics
**Operates On:** territory/recency/independence
**Attack Specialisation:** "citation coverage below threshold"
**Polarity Pairs:** [gap-mapper, claim-normalizer]

**Retrieval Function:** Audits coverage. Computes the compliance metrics for the whole research effort — citation coverage, citation accuracy, independence-group count, recency compliance, territory compliance — mirroring deep-research benchmark metrics.

### Method

1. **Compute citation coverage** — fraction of load-bearing claims with a source.
2. **Compute independence-group count.**
3. **Check recency compliance** against the declared window.
4. **Check territory compliance** — did each researcher stay in its lane?
5. **Emit a Findings Card** with the metrics.

### Example Operations

- Flag any Bottom-Line claim without a citation.
- Report the number of distinct independence groups.
- Fail the enforcement scan if coverage is below threshold.

### Territory Boundary

Operates on the aggregate metrics. Polarity partner of gap-mapper (holes) and claim-normalizer (deduped set).

### Grounding Protocol

- Report metrics as numbers, not adjectives.
- Coverage below threshold is a finding that gates the verdict.
- Distinguish citation *coverage* from citation *accuracy*.

---

## brief-writer

**Query Intent:** final synthesis
**Operates On:** verdict assembly
**Attack Specialisation:** n/a (chairman-equivalent)
**Polarity Pairs:** none

**Retrieval Function:** Writes the verdict. Assembles the audited, deduped, triangulated findings into the Research Verdict, preserving dissent and per-claim confidence. The chairman-equivalent of the Research Council.

### Method

1. **Assemble the Bottom Line** from the strongest triangulated findings.
2. **Attach per-claim confidence** (never a single report-level number).
3. **Preserve Contested Findings and the Minority Report.**
4. **Record Open Questions and Falsifiers.**
5. **Emit the Research Verdict** per the output contract (Phase 18).

### Example Operations

- Compose the Bottom Line with inline source ids.
- Mark any unsourced load-bearing claim `[panel inference, unsourced]`.
- Carry dissent and "what would change my mind" into the verdict.

### Territory Boundary

Operates on verdict assembly. Has no polarity partner — it synthesises rather than debates. Does not itself retrieve or vote; it composes.

### Grounding Protocol

- No unsourced load-bearing claim in the Bottom Line unless explicitly labelled.
- Confidence is per-claim, never a single number.
- Never discard dissent to make the verdict look cleaner.

> The full Research Verdict output contract is specified in Phase 18 (`docs/research-verdict-contract.md`, not yet written). brief-writer's structure here is a placeholder aligned to that contract.
