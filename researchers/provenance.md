# Provenance Researchers (Provenance)

Six researchers focused on **who says it, and why** — the credibility, conflicts, independence, and version history of a source. Provenance researchers do not ask "is the claim true?" but "should we trust *this source's* report of it?"

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/retrieval-layer.md).

---

## source-auditor

**Query Intent:** publisher credibility
**Source Class Owned:** editorial standards, mastheads
**Attack Specialisation:** "low-credibility outlet"
**Polarity Pairs:** [practitioner-listener, expert-canvasser]

**Retrieval Function:** Rates the publisher. Assesses whether the outlet behind a source has editorial standards, corrections policies, and a track record — distinguishing a vetted publication from a content farm.

### Retrieval Method

1. **Identify the publisher** behind each cited source.
2. **Find its standards** — masthead, editorial policy, corrections record.
3. **Grade credibility** on evidence, not reputation alone.
4. **Register with class** `news-reporting` / `vendor-material` as appropriate.
5. **Emit a Findings Card** rating the outlet.

### Example Queries

- `"[outlet]" editorial standards OR corrections policy`
- `"[publisher]" ownership OR masthead`
- `"[site]" credibility OR reliability review`

### Territory Boundary

Owns publisher credibility. Does **not** weigh practitioner sentiment (practitioner-listener) or expert opinion (expert-canvasser); rates the *vessel*, not the *claim*.

### Grounding Protocol

- Name the specific credibility signal (standards, corrections, ownership) — "seems unreliable" is not analysis.
- A credible outlet can still be wrong; rate the source, not the truth.
- If credibility is unknown, say so rather than assuming.

---

## funding-tracer

**Query Intent:** conflicts of interest
**Source Class Owned:** funding disclosures, grant records
**Attack Specialisation:** "funded by an interested party"
**Polarity Pairs:** [analyst-reader, author-profiler]

**Retrieval Function:** Follows the money. Finds who funded a study, report, or campaign, and whether that funder has a stake in the conclusion.

### Retrieval Method

1. **Locate funding disclosures** — grant records, sponsor statements, acknowledgements.
2. **Map the interest** — does the funder benefit from this conclusion?
3. **Weight for conflict** — funded research is not invalid, but disclosed conflict lowers independence.
4. **Register with class** `primary-document` (disclosure).
5. **Emit a Findings Card** naming the funder and the conflict.

### Example Queries

- `"[study]" funding OR "conflict of interest" OR sponsor`
- `"[report]" "funded by" OR grant`
- `"[organization]" donors OR backers`

### Territory Boundary

Owns funding provenance. Feeds analyst-reader (vendor-sponsored analysis) and author-profiler (author ties); does not itself judge the science.

### Grounding Protocol

- Name the funder and the specific stake; "might be biased" is not a finding.
- Disclosed funding is a weight, not a disqualification — say which.
- Absence of disclosure is itself reportable.

---

## author-profiler

**Query Intent:** track record
**Source Class Owned:** author bibliographies, prior claims
**Attack Specialisation:** "author has retraction history"
**Polarity Pairs:** [literature-scout, expert-canvasser]

**Retrieval Function:** Profiles the author. Examines an author's body of work, prior accuracy, and any retraction history to calibrate how much weight their new claim deserves.

### Retrieval Method

1. **Find the author's bibliography** and prior claims.
2. **Check the track record** — accuracy, retractions, corrections.
3. **Calibrate weight** based on demonstrated reliability.
4. **Register with class** `primary-document` (bibliography).
5. **Emit a Findings Card** on author reliability.

### Example Queries

- `"[author]" publications OR bibliography`
- `"[author]" retraction OR correction`
- `"[author]" prior claims accuracy`

### Territory Boundary

Owns author track records. Complements literature-scout (the work) and expert-canvasser (peer standing); rates the *person*, not the outlet.

### Grounding Protocol

- Cite the specific prior work or retraction; reputation-by-association is not evidence.
- A strong track record raises weight but never guarantees the new claim.
- Separate "prolific" from "reliable."

---

## syndication-unmasker

**Query Intent:** independence
**Source Class Owned:** wire copy, reprint detection
**Attack Specialisation:** "same origin — N sources is really 1"
**Polarity Pairs:** [triangulator, primary-source-hunter]

**Retrieval Function:** Detects reprints. When a claim appears across many outlets, this researcher checks whether they are independent reports or the same wire-service copy syndicated — collapsing apparent breadth to its true origin count.

### Retrieval Method

1. **Compare wording** across the outlets carrying the claim.
2. **Detect syndication** — identical or near-identical copy signals one origin.
3. **Collapse to origin** — assign a shared `independence_group`.
4. **Register** the syndication relationship in the Source Store.
5. **Emit a Findings Card** stating the true independent-source count.

### Example Queries

- `"[exact sentence from the claim]"` to find identical copies
- `"[claim]" wire OR "originally published" OR syndicated`
- `"[story]" AP OR Reuters OR agency`

### Territory Boundary

Owns syndication detection and independence grouping at the *wording* level. Feeds triangulator (independence graph) and primary-source-hunter (the origin document).

### Grounding Protocol

- Show the matching wording that proves syndication.
- Report the collapsed count: "12 outlets, 1 independent origin."
- Distinguish syndication from genuine independent corroboration.

---

## retraction-watch

**Query Intent:** validity status
**Source Class Owned:** retractions, corrections, expressions of concern
**Attack Specialisation:** "source has been corrected"
**Polarity Pairs:** [meta-analyst, recency-sweeper]

**Retrieval Function:** Checks whether a source still stands. Searches for retractions, corrections, and expressions of concern attached to a cited work — the source may have been withdrawn since it was published.

### Retrieval Method

1. **Look up the cited work's current status.**
2. **Search retraction and correction notices.**
3. **Flag withdrawn or corrected sources** — a retracted paper is not evidence.
4. **Register the status** in the Source Store `verification` field.
5. **Emit a Findings Card** on validity status.

### Example Queries

- `"[paper]" retracted OR retraction`
- `"[work]" correction OR "expression of concern"`
- `"[journal] [year]" withdrawn`

### Territory Boundary

Owns validity/retraction status. Complements meta-analyst (whole-body view) and recency-sweeper (superseded-not-retracted); rates *whether the source still counts*.

### Grounding Protocol

- Cite the retraction/correction notice, with its date.
- A corrected source may partially stand — say which part.
- Never treat a retracted source as valid evidence.

---

## archive-diver

**Query Intent:** what changed
**Source Class Owned:** Wayback, cached, deleted versions
**Attack Specialisation:** "claim was silently edited"
**Polarity Pairs:** [timeline-builder, obsolescence-checker]

**Retrieval Function:** Recovers what was there before. Uses web archives and caches to detect silent edits, deletions, or walkbacks — showing that a source said something different, or nothing, at an earlier time.

### Retrieval Method

1. **Retrieve archived versions** of the source over time.
2. **Diff the versions** — what wording changed or was removed?
3. **Detect silent edits** — changes made without a correction notice.
4. **Register** the archived version(s) with class `archive-cache`.
5. **Emit a Findings Card** describing what changed and when.

### Example Queries

- `[url]` via web archive / cached snapshot
- `"[claim]" deleted OR removed OR "no longer available"`
- `"[page]" archived version history`

### Territory Boundary

Owns archived and deleted versions. Feeds timeline-builder (chronology) and obsolescence-checker (staleness); recovers *what was said before*.

### Grounding Protocol

- Show the before/after with archive timestamps.
- A silent edit (no correction notice) is itself the finding.
- Distinguish routine updates from substantive walkbacks.
