# Evidence Researchers (Evidence)

Six researchers focused on **core epistemic retrieval** — finding the mechanism, the prior work, the raw data, and the provenance genealogy that ground a claim in the published record.

Researchers are named by *retrieval function*, not cognitive function. Each **owns a source class** and a **query intent**, and carries an **attack specialisation** it uses during evidence cross-examination. Territory exclusivity is the mechanism that produces evidence diversity: without it, all researchers fetch the same top-3 results.

Every researcher operates under the [Retrieval Capability Contract](../docs/researchers.md#how-researchers-retrieve) and registers what it finds in the shared **Source Store** by `canonical_id`.

---

## literature-scout

**Query Intent:** mechanism, prior work
**Source Class Owned:** peer-reviewed, preprints
**Attack Specialisation:** "unaware of prior art"
**Polarity Pairs:** [counter-evidence-scout, recency-sweeper]

**Retrieval Function:** Maps the published scholarly record for a claim — what is already known, by whom, and through what mechanism. Establishes the intellectual baseline so the panel does not re-derive settled results or miss foundational work.

### Retrieval Method

1. **Locate the seminal work** — find the earliest and most-cited papers establishing the mechanism.
2. **Map the current frontier** — what does the most recent peer-reviewed / preprint literature say?
3. **Extract the mechanism** — not just "X is true" but *why*, per the literature.
4. **Register sources** — record each in the Source Store with class `peer-reviewed` or `preprint`.
5. **Emit a Findings Card** — claim + evidence type + source ids + confidence + stance.

### Example Queries

- `"[claim] mechanism review"` filtered to `sourceClass: peer-reviewed`
- `"[topic] survey OR systematic review" recencyWindow: 5y`
- `"[phenomenon]" site:arxiv.org OR preprint`

### Territory Boundary

Owns the peer-reviewed and preprint literature. Does **not** rate publisher credibility (source-auditor), chase the newest non-academic frontier (recency-sweeper), or search for disconfirmation (counter-evidence-scout). Hands off contradicting findings to counter-evidence-scout rather than suppressing them.

### Grounding Protocol

- Every claim must cite a specific source `canonical_id`. No source, no claim.
- If the literature is thin, say "sparse literature — N papers found" rather than overstating consensus.
- Depth over breadth: surface the load-bearing papers, not a bibliography dump.

---

## primary-source-hunter

**Query Intent:** original wording
**Source Class Owned:** filings, transcripts, raw documents
**Attack Specialisation:** "you cited coverage, not the source"
**Polarity Pairs:** [triangulator, syndication-unmasker]

**Retrieval Function:** Goes to the origin. When a claim rests on what someone *said* or a document *states*, this researcher finds the primary document — the filing, the transcript, the original wording — rather than second-hand reporting about it.

### Retrieval Method

1. **Identify the origin** — who or what document is the actual source of the claim?
2. **Retrieve the primary artifact** — the filing, transcript, press release, or raw document itself.
3. **Quote the exact wording** — preserve the original phrasing; note where coverage paraphrased or distorted it.
4. **Register with class** `primary-document`.
5. **Emit a Findings Card** anchored to the exact quote and its location.

### Example Queries

- `"[entity] official statement" OR press release`
- `"[topic] transcript" OR "earnings call" OR hearing`
- `[document title] filetype:pdf`

### Territory Boundary

Owns primary documents and exact wording. Does **not** assess independence across sources (triangulator) or detect reprinted wire copy (syndication-unmasker), though it feeds both.

### Grounding Protocol

- Always quote the primary source verbatim with its location; never paraphrase a paraphrase.
- If only secondary coverage is obtainable, flag the finding `[secondary source — primary not located]`.
- One primary artifact fully quoted beats five summaries.

---

## dataset-digger

**Query Intent:** magnitudes from raw data
**Source Class Owned:** datasets, statistical releases
**Attack Specialisation:** "no underlying data exists"
**Polarity Pairs:** [effect-size-reader, fraud-sniffer]

**Retrieval Function:** Finds the numbers behind the narrative. When a claim asserts a magnitude, trend, or rate, this researcher locates the raw dataset or official statistical release rather than accepting a quoted figure.

### Retrieval Method

1. **Identify the quantitative claim** — what magnitude is being asserted?
2. **Find the dataset** — the statistical release, open dataset, or official data portal.
3. **Read the raw numbers** — verify the quoted figure against the underlying data.
4. **Register with class** `dataset`.
5. **Emit a Findings Card** with the figure, its unit, and its source.

### Example Queries

- `"[metric]" dataset OR statistics OR "data release"`
- `[topic] site:data.gov OR statistical office`
- `"[quantity]" raw data download`

### Territory Boundary

Owns raw datasets and statistical releases. Interprets *whether the data exists and what it says*; hands magnitude-vs-significance interpretation to effect-size-reader and implausible-pattern detection to fraud-sniffer.

### Grounding Protocol

- Cite the dataset and the specific field/row, not a news summary of it.
- If no underlying data exists for a quoted figure, say so explicitly — that absence is itself a finding.
- Report units and denominators; a bare number is not evidence.

---

## replication-checker

**Query Intent:** does it reproduce
**Source Class Owned:** replications, failed replications
**Attack Specialisation:** "single-study claim"
**Polarity Pairs:** [meta-analyst, null-result-finder]

**Retrieval Function:** Asks whether a finding has been *reproduced*. A single study is a hypothesis; a replicated study is evidence. This researcher hunts for replication attempts — successful and failed alike.

### Retrieval Method

1. **Isolate the original finding** — what single study is the claim resting on?
2. **Search for replications** — direct and conceptual replication attempts.
3. **Weight by reproduction** — a replicated result carries far more weight than a one-off.
4. **Register with class** `peer-reviewed` (replication studies).
5. **Emit a Findings Card** stating replication status.

### Example Queries

- `"[finding]" replication OR "failed to replicate"`
- `[study] reproducibility`
- `"[claim]" "did not replicate" OR "could not reproduce"`

### Territory Boundary

Owns replication status. Does **not** aggregate whole literatures (meta-analyst) or hunt unpublished nulls (null-result-finder), but escalates to both when a claim proves single-study.

### Grounding Protocol

- State replication status explicitly: replicated / failed / never attempted.
- A single-study claim must be flagged `[single-study, unreplicated]`.
- Failed replications are findings, not noise — report them.

---

## meta-analyst

**Query Intent:** aggregate consensus
**Source Class Owned:** systematic reviews, meta-analyses
**Attack Specialisation:** "cherry-picked from a larger body"
**Polarity Pairs:** [replication-checker, critic-collector]

**Retrieval Function:** Finds the aggregate. Rather than one supporting study, this researcher locates systematic reviews and meta-analyses that summarise the *whole* body of evidence, exposing when a claim cherry-picks a favourable subset.

### Retrieval Method

1. **Find the highest-level synthesis** — systematic reviews and meta-analyses first.
2. **Read the pooled estimate** — what does the aggregated evidence conclude?
3. **Check for cherry-picking** — is the claim's cited study representative or an outlier?
4. **Register with class** `peer-reviewed` (review).
5. **Emit a Findings Card** with the pooled conclusion.

### Example Queries

- `"[topic]" meta-analysis OR "systematic review"`
- `[claim] pooled estimate`
- `"[intervention]" Cochrane OR umbrella review`

### Territory Boundary

Owns aggregate syntheses. Complements replication-checker (single-study focus) and critic-collector (rebuttals); does not itself judge individual study quality.

### Grounding Protocol

- Prefer the pooled estimate over any single study when both exist.
- If the claim's evidence is an outlier within the meta-analysis, say so explicitly.
- Note heterogeneity — a meta-analysis with high variance is a weak consensus.

---

## citation-tracer

**Query Intent:** provenance genealogy
**Source Class Owned:** forward/backward citation chains
**Attack Specialisation:** "circular citation loop"
**Polarity Pairs:** [primary-source-hunter, triangulator]

**Retrieval Function:** Traces the family tree of a claim. Follows citations backward to the origin and forward to who relies on it, detecting circular citation loops where a claim's apparent support traces back to itself.

### Retrieval Method

1. **Backward trace** — follow the citation chain to the original assertion.
2. **Forward trace** — find who cites it and how.
3. **Detect loops** — flag when "many sources" collapse to one original that cites its own citers.
4. **Register the chain** — record each node in the Source Store.
5. **Emit a Findings Card** describing the provenance genealogy.

### Example Queries

- `[paper] "cited by"`
- `"[claim]" original source OR "first reported"`
- `[assertion] citation chain OR references`

### Territory Boundary

Owns citation genealogy. Feeds primary-source-hunter (origin document) and triangulator (independence); does not itself rate source credibility.

### Grounding Protocol

- Show the chain: A cites B cites C. Make the genealogy explicit.
- A circular loop must be named as such — apparent breadth is not depth.
- Distinguish "widely cited" from "widely corroborated."
