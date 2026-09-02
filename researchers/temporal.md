# Temporal Researchers (Temporal)

Six researchers focused on **time, recency, and staleness** — the newest frontier, the chronology of events, prior cycles, versions, obsolescence, and announced-not-shipped claims. Temporal researchers ask *when*, not just *what*.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/researchers.md#how-researchers-retrieve).

---

## recency-sweeper

**Query Intent:** last-N-days frontier
**Source Class Owned:** newest publications, changelogs
**Attack Specialisation:** "superseded last month"
**Polarity Pairs:** [precedent-digger, literature-scout]

**Retrieval Function:** Sweeps the frontier. Retrieves the newest publications, releases, and changelogs to catch when a claim has been superseded by something more recent.

### Retrieval Method

1. **Set the recency window** — last N days/months for this topic.
2. **Query newest-first** using `recencyWindow` filters.
3. **Detect supersession** — has the claim been overtaken?
4. **Register with class** `news-reporting` / `preprint` / `official-docs`.
5. **Emit a Findings Card** with the latest state.

### Example Queries

- `"[topic]" recencyWindow: 30d`
- `"[product]" changelog OR "release notes" latest`
- `"[claim]" 2026 OR "this month"`

### Territory Boundary

Owns the recency frontier. Direct polarity partner of precedent-digger (the past); complements literature-scout (the established record).

### Grounding Protocol

- Always state the recency window searched.
- "Nothing newer found" is a finding — report it.
- Distinguish superseded from merely older.

---

## timeline-builder

**Query Intent:** chronology of the claim
**Source Class Owned:** dated event sequences
**Attack Specialisation:** "causality reversed by dates"
**Polarity Pairs:** [archive-diver, precedent-digger]

**Retrieval Function:** Builds the chronology. Assembles a dated sequence of events to test causal claims — sometimes the dates show the supposed cause came *after* the effect.

### Retrieval Method

1. **List the events** in the claim.
2. **Date each one** from primary or dated sources.
3. **Order them** — build the timeline.
4. **Test causality** — do the dates support the claimed cause→effect?
5. **Emit a Findings Card** with the timeline.

### Example Queries

- `"[event]" date OR "when did"`
- `"[claim]" timeline OR chronology`
- `"[A]" before OR after "[B]"`

### Territory Boundary

Owns event chronology. Draws on archive-diver (what existed when) and precedent-digger (prior cycles); tests *ordering*, not magnitude.

### Grounding Protocol

- Date every event from a source; an undated timeline is speculation.
- A reversed cause/effect ordering is a decisive finding.
- Flag events whose dates cannot be established.

---

## precedent-digger

**Query Intent:** prior cycles
**Source Class Owned:** historical analogues, archives
**Attack Specialisation:** "this happened before"
**Polarity Pairs:** [recency-sweeper, trend-fitter]

**Retrieval Function:** Finds the precedent. Retrieves historical analogues showing that a "new" phenomenon or claim has occurred before, often with a known outcome.

### Retrieval Method

1. **Abstract the pattern** in the claim.
2. **Search for prior instances** across history.
3. **Retrieve the outcome** of the precedent.
4. **Register with class** `archive-cache` / `news-reporting` / `primary-document`.
5. **Emit a Findings Card** with the analogue.

### Example Queries

- `"[phenomenon]" history OR "has happened before"`
- `"[situation]" precedent OR analogue`
- `"[pattern]" 1990s OR 2000s OR historical`

### Territory Boundary

Owns historical precedent. Direct polarity partner of recency-sweeper (the frontier); feeds trend-fitter (long cycles).

### Grounding Protocol

- Cite the specific prior instance and its outcome.
- A precedent is an analogue, not a certainty — note the differences.
- Distinguish "similar" from "the same."

---

## version-tracker

**Query Intent:** which version
**Source Class Owned:** release notes, deprecations
**Attack Specialisation:** "claim is about an old version"
**Polarity Pairs:** [obsolescence-checker, spec-reader]

**Retrieval Function:** Pins the version. Determines which version of a product, standard, or API a claim refers to — a claim true of v1 may be false of v3.

### Retrieval Method

1. **Identify the versioned subject.**
2. **Retrieve release notes / version history.**
3. **Map the claim to a version** — is it current?
4. **Register with class** `official-docs` / `code-repository`.
5. **Emit a Findings Card** naming the version.

### Example Queries

- `"[product]" version history OR changelog`
- `"[feature]" "introduced in" OR "since version"`
- `"[claim]" which version`

### Territory Boundary

Owns version identification. Polarity partner of obsolescence-checker (what's dead); feeds spec-reader (the normative version).

### Grounding Protocol

- Name the exact version the claim applies to.
- A version-mismatched claim must be flagged.
- Distinguish "deprecated" from "removed."

---

## obsolescence-checker

**Query Intent:** what is now stale
**Source Class Owned:** deprecation notices, end-of-life
**Attack Specialisation:** "source is dead or stale"
**Polarity Pairs:** [version-tracker, recency-sweeper]

**Retrieval Function:** Detects the dead. Retrieves deprecation notices and end-of-life announcements showing that a cited source, product, or approach is no longer maintained or valid.

### Retrieval Method

1. **Identify the subject's lifecycle status.**
2. **Search deprecation / EOL notices.**
3. **Flag stale sources** — dead links, sunset products, abandoned standards.
4. **Register with class** `official-docs`.
5. **Emit a Findings Card** on obsolescence.

### Example Queries

- `"[product]" deprecated OR "end of life" OR sunset`
- `"[standard]" superseded OR obsolete`
- `"[source]" "no longer maintained"`

### Territory Boundary

Owns obsolescence status. Polarity partner of version-tracker (which version); complements recency-sweeper (what's newest).

### Grounding Protocol

- Cite the deprecation/EOL notice with its date.
- A stale source is not automatically wrong — say what changed.
- Distinguish "deprecated but working" from "removed."

---

## embargo-watcher

**Query Intent:** announced-not-shipped
**Source Class Owned:** roadmaps, forward statements
**Attack Specialisation:** "vaporware treated as shipped"
**Polarity Pairs:** [adoption-reader, reproducer]

**Retrieval Function:** Separates announced from shipped. Retrieves roadmaps and forward-looking statements to catch when a claim treats an *announced* capability as if it already exists.

### Retrieval Method

1. **Identify the capability claim.**
2. **Check shipping status** — roadmap, "coming soon," GA vs preview.
3. **Distinguish announced from available.**
4. **Register with class** `official-docs` / `vendor-material`.
5. **Emit a Findings Card** on shipping status.

### Example Queries

- `"[feature]" roadmap OR "coming soon" OR preview`
- `"[product]" "general availability" OR GA date`
- `"[claim]" announced OR shipped`

### Territory Boundary

Owns announced-vs-shipped status. Polarity partner of adoption-reader (real usage); feeds reproducer (does it actually run).

### Grounding Protocol

- State shipping status explicitly: announced / preview / GA.
- Vaporware treated as shipped is a decisive finding.
- A forward-looking statement is not evidence of a current capability.
