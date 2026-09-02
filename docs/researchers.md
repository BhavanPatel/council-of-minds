# Researcher Reference

Researchers are the retrieval Minds. Where an advisor reasons from prior knowledge and
returns a *judgement*, a researcher retrieves external evidence — from the internet,
sources, and data — and returns a *well-sourced answer*. A panel of a handful of researchers
gathers evidence in parallel, audits each other's sources, and produces a research verdict
with per-claim confidence, preserved dissent, and falsifiers.

| | Advisors | Researchers |
|---|---|---|
| Named by | cognitive **function** | retrieval **function** |
| Knowledge source | prior knowledge only | external retrieval only |
| Unit of output | a position + confidence | a Findings Card + sources |
| Deliberation | debate positions | audit each other's **evidence** |

Researchers are grouped into themes, one file per theme, mirroring the advisor structure.
Each researcher **owns a source class** and a **query intent**, and carries an **attack
specialisation** used during evidence cross-examination. Territory exclusivity is the
mechanism that produces evidence diversity — without it, all researchers fetch the same
top-3 results.

Every researcher operates under the [Retrieval Capability Contract](#how-researchers-retrieve)
and registers findings in the shared **Source Store** by `canonical_id`. The canonical
roster, themes, and polarity pairs live in
[`../settings/research-council.config.json`](../settings/research-council.config.json).

> Full definitions: `researchers/*.md`.
> Selector rule: every research panel MUST include **≥1 Synthesis** and **≥1 Adversarial** researcher.
> Panels: see [Research Profiles](#research-profiles) below · orchestration flow: [`../council-of-minds.md`](../council-of-minds.md).
> Calibration: findings are scored **per finding** over time — `researcher scores`, `source reliability`, and `research calibration report` reveal which lenses and source classes hold up. See the *Research Calibration & Analytics* section of [`../council-of-minds.md`](../council-of-minds.md). Chaining a research verdict into a decision: [chaining.md](chaining.md).
> Advanced: opt-in interactive checkpoints, research transcript + Source Store persistence, a multimodal retrieval lens, self-benchmark, and a **custom researcher builder** (`council researcher create|validate|list`, scaffold in [`../researchers/custom/`](../researchers/custom/)). See the *Advanced Research Features* section of [`../council-of-minds.md`](../council-of-minds.md).

The reasoning counterpart to researchers is documented in [advisors.md](advisors.md).

---

## Evidence

Core epistemic retrieval. See [`researchers/evidence.md`](../researchers/evidence.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| literature-scout | mechanism, prior work | "unaware of prior art" |
| primary-source-hunter | original wording | "you cited coverage, not the source" |
| dataset-digger | magnitudes from raw data | "no underlying data exists" |
| replication-checker | does it reproduce | "single-study claim" |
| meta-analyst | aggregate consensus | "cherry-picked from a larger body" |
| citation-tracer | provenance genealogy | "circular citation loop" |

## Provenance

Who says it, why. See [`researchers/provenance.md`](../researchers/provenance.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| source-auditor | publisher credibility | "low-credibility outlet" |
| funding-tracer | conflicts of interest | "funded by an interested party" |
| author-profiler | track record | "author has retraction history" |
| syndication-unmasker | independence | "same origin — N sources is really 1" |
| retraction-watch | validity status | "source has been corrected" |
| archive-diver | what changed | "claim was silently edited" |

## Adversarial

Disconfirmation. See [`researchers/adversarial.md`](../researchers/adversarial.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| counter-evidence-scout | the opposite case | "you never searched for disconfirmation" |
| null-result-finder | non-findings | "publication bias" |
| critic-collector | published rebuttals | "this was formally rebutted" |
| failure-case-hunter | real-world breakdowns | "works in paper, fails in field" |
| steelman-builder | strongest opposition | "you attacked the weak version" |
| fraud-sniffer | too-good-to-be-true | "data pattern is implausible" |

## Quantitative

The numbers. See [`researchers/quantitative.md`](../researchers/quantitative.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| base-rate-finder | denominators, priors | "no base rate given" |
| effect-size-reader | magnitude vs significance | "significant but trivial" |
| benchmark-reader | measured performance | "benchmark contaminated or gamed" |
| trend-fitter | rates, inflections | "extrapolated past the data" |
| cost-modeler | unit economics | "cost claim unsourced" |
| uncertainty-quantifier | error bars, n | "point estimate hides a huge CI" |

## Temporal

Time, recency, staleness. See [`researchers/temporal.md`](../researchers/temporal.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| recency-sweeper | last-N-days frontier | "superseded last month" |
| timeline-builder | chronology of the claim | "causality reversed by dates" |
| precedent-digger | prior cycles | "this happened before" |
| version-tracker | which version | "claim is about an old version" |
| obsolescence-checker | what is now stale | "source is dead or stale" |
| embargo-watcher | announced-not-shipped | "vaporware treated as shipped" |

## Technical

Implementation reality. See [`researchers/technical.md`](../researchers/technical.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| code-reader | implementation reality | "code does not do what docs claim" |
| spec-reader | normative definition | "the spec says otherwise" |
| api-doc-reader | official limits | "undocumented assumption" |
| issue-tracker-miner | known limitations | "known open bug contradicts this" |
| architecture-mapper | system shape | "architecture makes this impossible" |
| reproducer | does it actually run | "could not reproduce" |

## Market

Commercial reality. See [`researchers/market.md`](../researchers/market.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| competitor-mapper | who else does this | "novelty claim false — N others exist" |
| pricing-scout | published cost | "price is wrong or stale" |
| adoption-reader | actual usage | "no evidence of real adoption" |
| filing-reader | audited numbers | "contradicted by their own filing" |
| analyst-reader | market sizing | "vendor-sponsored analysis" |
| customer-voice | lived experience | "users report the opposite" |

## Regulatory

Law and compliance. See [`researchers/regulatory.md`](../researchers/regulatory.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| statute-reader | what the law says | "misstates the statute" |
| caselaw-reader | how it was applied | "precedent contradicts this" |
| regulator-watcher | current guidance | "guidance changed" |
| compliance-mapper | required controls | "fails a mandatory control" |
| jurisdiction-comparer | where it applies | "true in one jurisdiction only" |
| policy-tracer | legislative intent | "intent differs from text" |

## Human

Qualitative / social. See [`researchers/human.md`](../researchers/human.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| practitioner-listener | real usage reports | "practitioners disagree" |
| expert-canvasser | expert commentary | "domain experts say otherwise" |
| sentiment-reader | aggregate opinion + skew | "sample is self-selected" |
| ethnographer | workflow context | "ignores the actual workflow" |
| dissent-locator | heterodox positions | "a credible minority view exists" |
| translation-scout | non-English record | "anglophone blind spot" |

## Synthesis

Operate on the Source Store, not the web. See [`researchers/synthesis.md`](../researchers/synthesis.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| gap-mapper | what is missing | "no evidence gathered on X" |
| contradiction-mapper | what conflicts | "F2 and F7 cannot both hold" |
| triangulator | independent confirmation | "not independently confirmed" |
| claim-normalizer | dedupe/merge claims | "same claim counted twice" |
| coverage-auditor | compliance metrics | "citation coverage below threshold" |
| brief-writer | final synthesis | n/a (chairman-equivalent) |

---

## Research Profiles

A research profile is a curated panel of researchers for a common evidence task. Trigger one
with `research council: [question]` and name the profile, or let auto-selection pick one from
the researcher registry. Each profile seats a handful of researchers by default (panels can
grow slightly at the deeper budget tiers). The canonical profile definitions live in
[`../settings/research-council.config.json`](../settings/research-council.config.json).

> **Selector constraint:** every research panel MUST include **≥1 Synthesis** researcher
> and **≥1 Adversarial** researcher. Without Synthesis nothing audits the collected set;
> without Adversarial the panel only confirms. Where a profile's default panel does not
> already carry both, the orchestrator adds the missing seat at panel selection (noted per
> profile below).

The research profiles pick researchers (retrieval lenses); the [decision profiles](advisors.md#profiles)
pick advisors (cognitive lenses). The two are the halves of one profiles system.

| Profile | Researchers (default panel) | For |
|---------|-------------------------|-----|
| **landscape-scan** | competitor-mapper, recency-sweeper, adoption-reader, literature-scout, gap-mapper | What exists in this space today |
| **claim-verification** | primary-source-hunter, citation-tracer, counter-evidence-scout, syndication-unmasker, triangulator | Is this true |
| **literature-review** | literature-scout, meta-analyst, replication-checker, null-result-finder, citation-tracer | Academic state of the art |
| **technical-due-diligence** | code-reader, spec-reader, issue-tracker-miner, reproducer, architecture-mapper | Does this software do what it claims |
| **market-research** | competitor-mapper, pricing-scout, adoption-reader, filing-reader, customer-voice | Sizing, pricing, players |
| **competitive-intel** | competitor-mapper, embargo-watcher, filing-reader, adoption-reader, customer-voice | Rival capability + roadmap |
| **regulatory-scan** | statute-reader, caselaw-reader, regulator-watcher, jurisdiction-comparer, compliance-mapper | Legal exposure |
| **provenance-audit** | source-auditor, funding-tracer, author-profiler, syndication-unmasker, retraction-watch | Who is behind this claim |
| **incident-forensics** | failure-case-hunter, timeline-builder, issue-tracker-miner, archive-diver, contradiction-mapper | What actually happened |
| **trend-forecast** | trend-fitter, recency-sweeper, embargo-watcher, precedent-digger, uncertainty-quantifier | Where this is heading |
| **quantitative-scan** | dataset-digger, base-rate-finder, effect-size-reader, uncertainty-quantifier, benchmark-reader | Get the numbers right |
| **vendor-evaluation** | pricing-scout, customer-voice, api-doc-reader, adoption-reader, failure-case-hunter | Buy/adopt assessment |
| **academic-survey** | literature-scout, meta-analyst, citation-tracer, translation-scout, gap-mapper | Survey-grade coverage |
| **red-team-research** | counter-evidence-scout, steelman-builder, critic-collector, fraud-sniffer, null-result-finder | Try to break this claim |
| **feasibility-study** | spec-reader, reproducer, cost-modeler, precedent-digger, failure-case-hunter | Can this actually be done |

### Mandatory-seat coverage

Profiles whose default panel already carries both mandatory seats:
- **claim-verification** (counter-evidence-scout = Adversarial, triangulator = Synthesis)
- **incident-forensics** (failure-case-hunter = Adversarial, contradiction-mapper = Synthesis)
- **literature-review** (null-result-finder = Adversarial; citation-tracer covers evidence provenance, gap-mapper Synthesis added on demand)
- **vendor-evaluation / feasibility-study** (failure-case-hunter = Adversarial; Synthesis auditor added on demand)
- **red-team-research** (all five are adversarial; contradiction-mapper Synthesis added on demand)

Profiles where the orchestrator adds a mandatory seat at panel selection (documented in
`../settings/research-council.config.json` per-profile `note`): **landscape-scan**,
**market-research**, **technical-due-diligence**, **competitive-intel**, **regulatory-scan**,
**provenance-audit**, **trend-forecast**, **quantitative-scan**, **academic-survey**.

### Custom research profiles

Create persistent custom research profiles by editing the `profiles` block of
[`../settings/research-council.config.json`](../settings/research-council.config.json), or
name researchers ad hoc: `research council with code-reader, reproducer, spec-reader: [question]`.
Custom researchers themselves are authored from `researchers/custom/_template.md` via
`council researcher create <name>`.

### Budget tiers

Research budget is spent on **retrieval dimensions** (panel size, queries per researcher,
fetches, progressive passes, fact-check scope), not word limits. See the Research Cost Budget
Tiers table in [`../council-of-minds.md`](../council-of-minds.md) and
[`../settings/research-council.config.json`](../settings/research-council.config.json) →
`budgetTiers`. Degradation order sacrifices progressive passes first and **fact-check scope
last**; rounds are never a throttle.

---

## How Researchers Retrieve

The retrieval layer is the plumbing that lets researchers gather external evidence: the
capability contract, the Source Store, and the rules that govern fetching. Everything here is
**tool-neutral and agent-agnostic** — no vendor, model, or specific search provider is named.
Any host that can *search the web* and *fetch a URL* satisfies the contract; hosts that cannot
degrade gracefully to a labelled prior-knowledge briefing. Config:
[`../settings/research-council.config.json`](../settings/research-council.config.json).

### Retrieval Capability Contract

Researchers depend on two abstract capabilities. The host supplies them; the council never
assumes a particular implementation.

| Capability | Signature | Returns |
|-----------|-----------|---------|
| `search`  | `search(query, filters)` | ranked list of `{title, url, snippet, publish_date?, source?}` |
| `fetch`   | `fetch(url)` | `{url, canonical_url?, title?, publish_date?, author?, publisher?, text}` |

`search` filters (all optional): `recencyWindow`, `sourceClass`, `language`, `jurisdiction`, `siteScope`.

**Capability probe.** At session start, before any researcher is dispatched, the council
probes the host: issue one trivial `search` query, then `fetch` one known URL. The probe
resolves to one of three states:

- **full** — both `search` and `fetch` available → the council may emit a **Research Verdict**.
- **searchOnly** — snippets but no full text → allowed, but every finding is flagged `[snippet-only, unverified full text]`.
- **none** — neither available → the `onCapabilityMissing` policy applies.

**onCapabilityMissing → degrade-to-briefing.** The single unrecoverable failure mode is
**silently fabricating citations**. When retrieval is unavailable the council **MUST NOT**
emit a Research Verdict. Instead it emits a clearly labelled **PRIOR-KNOWLEDGE BRIEFING** that
(a) states retrieval was unavailable, (b) carries **no** citations, (c) caps every claim's
confidence at `low`, and (d) lists the queries that *would* have been run. Never present
prior-knowledge claims as if they were retrieved and sourced.

### Source Store

A shared evidence ledger. Every fetched artifact is registered **once**; researchers reference
sources by `canonical_id` rather than passing raw text around.

| Field | Meaning |
|-------|---------|
| `canonical_id` | stable hash identifying the source (see below) |
| `independence_group` | id shared by sources that are **not** independent |
| `first_claimer` | canonical_id of the earliest source making a claim, if known |
| `fetched_by` | researcher id that retrieved this source |
| `fetched_at` | ISO-8601 retrieval timestamp |
| `publish_date` | ISO-8601 publish date if known, else null |
| `class` | source class (see below) |
| `verification` | `unverified` \| `verified` \| `demoted` (set by the Verification Ledger during Fact-Check) |
| `url` | resolved URL or DOI |
| `title` | source title |

**Canonical ID algorithm.** Deterministic identity so the same source fetched twice collides:

```
canonical_id = hash( normalized_url | DOI | (title + publish_date) )
```

Precedence: **DOI → normalized_url → title+publish_date**. URL normalization: lowercase host ·
strip scheme and `www.` · strip tracking params (`utm_*`, `ref`, `fbclid`, `gclid`) · strip
trailing slash and fragment · resolve known shorteners before hashing.

**Independence grouping.** **N sources from one origin count as ONE** for coverage and
confidence. Group by the union of `{publisher, author, syndication_origin}`. Signals: same
publisher / domain owner; same author or byline; wire-service / syndication origin (a reprint
of the same copy); same funding source for the underlying study. Effect: citation-coverage and
confidence metrics count **independence groups**, not raw source count.

**Source classes.** `peer-reviewed`, `preprint`, `primary-document`, `dataset`,
`standard-spec`, `code-repository`, `official-docs`, `filing-financial`, `regulatory-legal`,
`news-reporting`, `analyst-report`, `vendor-material`, `community-forum`, `expert-commentary`,
`archive-cache`.

### Fetch-time dedupe with quota refund

Before recording a fetch, compute its `canonical_id`. If it already exists in the Source Store,
do **not** double-count it, and **refund** the fetch against the researcher's budget, requiring
the next fetch to target a *different* `independence_group`. A collision is not wasted budget —
it is a **diversity push** that steers the panel toward independent sources.

### Diminishing-returns stop

Halt a researcher's retrieval when the **last 3 fetches each yield < 20% novel claims** relative
to the Source Store. Novelty = the fraction of claims in a fetched source not already asserted
by a registered source. A floor applies: every researcher may always run at least its
tier-minimum fetches before this rule can trigger.

---

## What a Researcher Returns

The **Research Verdict** is the deliverable of a research council. Where a Decision Verdict
recommends *what to do*, a Research Verdict reports *what the evidence says* — with per-claim
confidence, preserved dissent, and falsifiers. It is assembled by **brief-writer** (Synthesis)
at the Crystallize & Vote round, after the per-claim confidence vote. Report generation is a
**first-class deliverable**, not an afterthought.

> Framing: this is **adversarial evidence auditing**, not accuracy amplification. The verdict's
> value is provenance, entailment, and coverage discipline — not a claim that debate made the
> answer more correct.

### Template

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
{Claims still in dispute after Cross-Exam / Progressive Retrieve. Present BOTH sides with the source ids each rests on.
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
 "council feedback: rv-{id} — F{n} was [confirmed|refuted|unresolved]".}

---
Session: research | Panel: {N} researchers | Rounds: Charter–Crystallize & Vote | Budget tier: {tier} |
Mandatory seats: {synthesis-researcher} (Synthesis), {adversarial-researcher} (Adversarial) |
Fact-check scope: {scope} | Progressive passes: {N} | Model diversity: {multi | single-varied}
```

### Mapping from the Decision Verdict

The Research Verdict reuses the Decision Verdict's spine so a solo research answer and a
chained research→decision answer feel like one system:

| Decision Verdict section | Research Verdict section |
|--------------------------|--------------------------|
| The Recommendation | **Bottom Line** |
| Kill Criteria | **Falsifiers** |
| Concrete Next Step | **Next Retrieval** |
| Minority Report | **Minority Report** (+ "what would change my mind" + held sources) |
| Points of Disagreement | **Contested Findings** |
| Unresolved Questions | **Open Questions** |
| Vote Tally (per-position) | **Confidence Ledger** (per-claim) |

### Hard rules

1. **No unsourced load-bearing claim in the Bottom Line** unless explicitly marked `[panel inference, unsourced]`.
2. **Confidence is PER-CLAIM**, never a single report-level number.
3. **Confidence caps:** single independence group → **0.5**; unverified/demoted → **0.4**.
4. **Minority Report must record "what would change my mind"** plus the sources it holds.
5. **Independence groups, not raw counts** — the Source Appendix groups reprints/syndication.
6. **Coverage Auditor metrics are mandatory** — citation coverage %, citation accuracy, independence-group count, recency compliance.
7. **Retrieval capability is disclosed** — a prior-knowledge briefing is never dressed up as a sourced verdict.
8. **Dissent and falsifiers are never dropped** to make the verdict look cleaner.

### Coverage Auditor

The **coverage-auditor** (Synthesis) computes the Coverage & Limits block:

- **Citation coverage** = load-bearing claims with ≥1 source ÷ total load-bearing claims.
- **Citation accuracy** = citations that passed the fact-checker's entailment check ÷ citations checked.
- **Independence-group count** = distinct `independence_group` values backing the verdict.
- **Recency compliance** = sources within the Charter's declared window ÷ total sources.
- **Territory compliance** = pass if every researcher stayed within its assigned source class + intent; fail names the lane collisions.

Coverage below threshold **gates the verdict** (Enforcement Scan) — the verdict is emitted with
the gap flagged, never with the gap hidden.

---

## Research Polarity Pairs

Cross-theme polarity pairs drive the sparse, O(N) evidence cross-examination. Pairing a
*supporting* lens against a *disconfirming* one produces the most valuable audits. The table
below is a **curated cross-theme subset** for illustration; the canonical, per-file polarity
pairs declared in each `researchers/*.md` (and mirrored in
[`../settings/research-council.config.json`](../settings/research-council.config.json)) are
authoritative.

| A | B |
|---|---|
| counter-evidence-scout | literature-scout |
| triangulator | primary-source-hunter |
| recency-sweeper | precedent-digger |
| benchmark-reader | failure-case-hunter |
| analyst-reader | customer-voice |
| syndication-unmasker | triangulator |
| null-result-finder | replication-checker |
| effect-size-reader | base-rate-finder |
| version-tracker | obsolescence-checker |
| code-reader | spec-reader |
| statute-reader | caselaw-reader |
| expert-canvasser | practitioner-listener |
| gap-mapper | coverage-auditor |
| contradiction-mapper | claim-normalizer |
| embargo-watcher | adoption-reader |

---

## Territory Matrix

The single authoritative map of **researcher → source class owned + query intent**. Territory exclusivity is what makes the panel gather diverse evidence rather than N copies of the same result. This section is always last.

| Researcher | Theme | Source Class Owned | Query Intent |
|---|---|---|---|
| literature-scout | Evidence | peer-reviewed, preprints | mechanism, prior work |
| primary-source-hunter | Evidence | filings, transcripts, raw docs | original wording |
| dataset-digger | Evidence | datasets, statistical releases | magnitudes from raw data |
| replication-checker | Evidence | replications, failed replications | does it reproduce |
| meta-analyst | Evidence | systematic reviews, meta-analyses | aggregate consensus |
| citation-tracer | Evidence | forward/backward citation chains | provenance genealogy |
| source-auditor | Provenance | editorial standards, mastheads | publisher credibility |
| funding-tracer | Provenance | funding disclosures, grant records | conflicts of interest |
| author-profiler | Provenance | author bibliographies, prior claims | track record |
| syndication-unmasker | Provenance | wire copy, reprint detection | independence |
| retraction-watch | Provenance | retractions, corrections, EoCs | validity status |
| archive-diver | Provenance | Wayback, cached, deleted versions | what changed |
| counter-evidence-scout | Adversarial | contradicting literature | the opposite case |
| null-result-finder | Adversarial | negative results, file-drawer | non-findings |
| critic-collector | Adversarial | comment letters, critiques | published rebuttals |
| failure-case-hunter | Adversarial | incident reports, postmortems | real-world breakdowns |
| steelman-builder | Adversarial | adversarial literature | strongest opposition |
| fraud-sniffer | Adversarial | anomaly reports, forensic analyses | too-good-to-be-true |
| base-rate-finder | Quantitative | prevalence data, census | denominators, priors |
| effect-size-reader | Quantitative | effect sizes, confidence intervals | magnitude vs significance |
| benchmark-reader | Quantitative | leaderboards, eval suites | measured performance |
| trend-fitter | Quantitative | time series | rates, inflections |
| cost-modeler | Quantitative | pricing pages, TCO studies | unit economics |
| uncertainty-quantifier | Quantitative | variance, sample sizes | error bars, n |
| recency-sweeper | Temporal | newest publications, changelogs | last-N-days frontier |
| timeline-builder | Temporal | dated event sequences | chronology of the claim |
| precedent-digger | Temporal | historical analogues, archives | prior cycles |
| version-tracker | Temporal | release notes, deprecations | which version |
| obsolescence-checker | Temporal | deprecation notices, end-of-life | what is now stale |
| embargo-watcher | Temporal | roadmaps, forward statements | announced-not-shipped |
| code-reader | Technical | repos, source files | implementation reality |
| spec-reader | Technical | RFCs, standards, schemas | normative definition |
| api-doc-reader | Technical | reference docs, quotas | official limits |
| issue-tracker-miner | Technical | issues, PRs, discussions | known limitations |
| architecture-mapper | Technical | design docs, ADRs, diagrams | system shape |
| reproducer | Technical | executed artifacts, logs | does it actually run |
| competitor-mapper | Market | product pages, directories | who else does this |
| pricing-scout | Market | price lists, tiers, contracts | published cost |
| adoption-reader | Market | downloads, stars, job posts | actual usage |
| filing-reader | Market | 10-K, S-1, annual reports | audited numbers |
| analyst-reader | Market | industry analyst reports | market sizing |
| customer-voice | Market | reviews, complaints, case studies | lived experience |
| statute-reader | Regulatory | laws, regulations, directives | what the law says |
| caselaw-reader | Regulatory | judgments, enforcement actions | how it was applied |
| regulator-watcher | Regulatory | consultations, guidance notes | current guidance |
| compliance-mapper | Regulatory | standards, certifications | required controls |
| jurisdiction-comparer | Regulatory | cross-border comparisons | where it applies |
| policy-tracer | Regulatory | drafts, lobbying records, hansard | legislative intent |
| practitioner-listener | Human | forums, HN, Reddit, Discord | real usage reports |
| expert-canvasser | Human | interviews, talks, podcasts, AMAs | expert commentary |
| sentiment-reader | Human | review aggregates, polls | aggregate opinion + skew |
| ethnographer | Human | user research, field studies | workflow context |
| dissent-locator | Human | minority expert views | heterodox positions |
| translation-scout | Human | regional/foreign-language sources | non-English record |
| gap-mapper | Synthesis | collected findings set | what is missing |
| contradiction-mapper | Synthesis | cross-findings comparison | what conflicts |
| triangulator | Synthesis | source independence graph | independent confirmation |
| claim-normalizer | Synthesis | semantically equal claims | dedupe/merge claims |
| coverage-auditor | Synthesis | territory/recency/independence | compliance metrics |
| brief-writer | Synthesis | verdict assembly | final synthesis |
