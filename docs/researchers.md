# Researchers — The Second Chamber (v4.0)

Council of Minds has two chambers. The **60 advisors** reason from prior knowledge and return a *decision verdict*. The **60 researchers** documented here retrieve external evidence and return a *research verdict*.

| | Advisors | Researchers |
|---|---|---|
| Named by | cognitive **function** | retrieval **function** |
| Knowledge source | prior knowledge only | external retrieval only |
| Unit of output | a position + confidence | a Findings Card + sources |
| Deliberation | debate positions | audit each other's **evidence** |

Researchers are 10 themes × 6 = **60**, mirroring the advisor structure. Each researcher **owns a source class** and a **query intent**, and carries an **attack specialisation** used during evidence cross-examination. Territory exclusivity is the mechanism that produces evidence diversity — without it, all researchers fetch the same top-3 results.

Every researcher operates under the [Retrieval Capability Contract](./retrieval-layer.md) and registers findings in the shared **Source Store** by `canonical_id`.

> Full definitions: `researchers/*.md`. Config: `settings/research-council.config.json`.
> Selector rule: every research panel MUST include **≥1 Synthesis (R10)** and **≥1 Adversarial (R3)** researcher.
> Panels & round flow: [research profiles](research-profiles.md) · [Research Round Flow (R0–R6)](../council-of-minds.md) · [Research Verdict contract](research-verdict-contract.md).

---

## Theme R1 — Evidence

Core epistemic retrieval. See [`researchers/evidence.md`](../researchers/evidence.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| literature-scout | mechanism, prior work | "unaware of prior art" |
| primary-source-hunter | original wording | "you cited coverage, not the source" |
| dataset-digger | magnitudes from raw data | "no underlying data exists" |
| replication-checker | does it reproduce | "single-study claim" |
| meta-analyst | aggregate consensus | "cherry-picked from a larger body" |
| citation-tracer | provenance genealogy | "circular citation loop" |

## Theme R2 — Provenance

Who says it, why. See [`researchers/provenance.md`](../researchers/provenance.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| source-auditor | publisher credibility | "low-credibility outlet" |
| funding-tracer | conflicts of interest | "funded by an interested party" |
| author-profiler | track record | "author has retraction history" |
| syndication-unmasker | independence | "same origin — N sources is really 1" |
| retraction-watch | validity status | "source has been corrected" |
| archive-diver | what changed | "claim was silently edited" |

## Theme R3 — Adversarial

Disconfirmation. See [`researchers/adversarial.md`](../researchers/adversarial.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| counter-evidence-scout | the opposite case | "you never searched for disconfirmation" |
| null-result-finder | non-findings | "publication bias" |
| critic-collector | published rebuttals | "this was formally rebutted" |
| failure-case-hunter | real-world breakdowns | "works in paper, fails in field" |
| steelman-builder | strongest opposition | "you attacked the weak version" |
| fraud-sniffer | too-good-to-be-true | "data pattern is implausible" |

## Theme R4 — Quantitative

The numbers. See [`researchers/quantitative.md`](../researchers/quantitative.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| base-rate-finder | denominators, priors | "no base rate given" |
| effect-size-reader | magnitude vs significance | "significant but trivial" |
| benchmark-reader | measured performance | "benchmark contaminated or gamed" |
| trend-fitter | rates, inflections | "extrapolated past the data" |
| cost-modeler | unit economics | "cost claim unsourced" |
| uncertainty-quantifier | error bars, n | "point estimate hides a huge CI" |

## Theme R5 — Temporal

Time, recency, staleness. See [`researchers/temporal.md`](../researchers/temporal.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| recency-sweeper | last-N-days frontier | "superseded last month" |
| timeline-builder | chronology of the claim | "causality reversed by dates" |
| precedent-digger | prior cycles | "this happened before" |
| version-tracker | which version | "claim is about an old version" |
| obsolescence-checker | what is now stale | "source is dead or stale" |
| embargo-watcher | announced-not-shipped | "vaporware treated as shipped" |

## Theme R6 — Technical

Implementation reality. See [`researchers/technical.md`](../researchers/technical.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| code-reader | implementation reality | "code does not do what docs claim" |
| spec-reader | normative definition | "the spec says otherwise" |
| api-doc-reader | official limits | "undocumented assumption" |
| issue-tracker-miner | known limitations | "known open bug contradicts this" |
| architecture-mapper | system shape | "architecture makes this impossible" |
| reproducer | does it actually run | "could not reproduce" |

## Theme R7 — Market

Commercial reality. See [`researchers/market.md`](../researchers/market.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| competitor-mapper | who else does this | "novelty claim false — N others exist" |
| pricing-scout | published cost | "price is wrong or stale" |
| adoption-reader | actual usage | "no evidence of real adoption" |
| filing-reader | audited numbers | "contradicted by their own filing" |
| analyst-reader | market sizing | "vendor-sponsored analysis" |
| customer-voice | lived experience | "users report the opposite" |

## Theme R8 — Regulatory

Law and compliance. See [`researchers/regulatory.md`](../researchers/regulatory.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| statute-reader | what the law says | "misstates the statute" |
| caselaw-reader | how it was applied | "precedent contradicts this" |
| regulator-watcher | current guidance | "guidance changed" |
| compliance-mapper | required controls | "fails a mandatory control" |
| jurisdiction-comparer | where it applies | "true in one jurisdiction only" |
| policy-tracer | legislative intent | "intent differs from text" |

## Theme R9 — Human

Qualitative / social. See [`researchers/human.md`](../researchers/human.md).

| Researcher | Query intent | Attack specialisation |
|---|---|---|
| practitioner-listener | real usage reports | "practitioners disagree" |
| expert-canvasser | expert commentary | "domain experts say otherwise" |
| sentiment-reader | aggregate opinion + skew | "sample is self-selected" |
| ethnographer | workflow context | "ignores the actual workflow" |
| dissent-locator | heterodox positions | "a credible minority view exists" |
| translation-scout | non-English record | "anglophone blind spot" |

## Theme R10 — Synthesis

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

## Research Polarity Pairs

Cross-theme polarity pairs drive the sparse, O(N) evidence cross-examination. Pairing a *supporting* lens against a *disconfirming* one produces the most valuable audits.

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
| literature-scout | R1 Evidence | peer-reviewed, preprints | mechanism, prior work |
| primary-source-hunter | R1 Evidence | filings, transcripts, raw docs | original wording |
| dataset-digger | R1 Evidence | datasets, statistical releases | magnitudes from raw data |
| replication-checker | R1 Evidence | replications, failed replications | does it reproduce |
| meta-analyst | R1 Evidence | systematic reviews, meta-analyses | aggregate consensus |
| citation-tracer | R1 Evidence | forward/backward citation chains | provenance genealogy |
| source-auditor | R2 Provenance | editorial standards, mastheads | publisher credibility |
| funding-tracer | R2 Provenance | funding disclosures, grant records | conflicts of interest |
| author-profiler | R2 Provenance | author bibliographies, prior claims | track record |
| syndication-unmasker | R2 Provenance | wire copy, reprint detection | independence |
| retraction-watch | R2 Provenance | retractions, corrections, EoCs | validity status |
| archive-diver | R2 Provenance | Wayback, cached, deleted versions | what changed |
| counter-evidence-scout | R3 Adversarial | contradicting literature | the opposite case |
| null-result-finder | R3 Adversarial | negative results, file-drawer | non-findings |
| critic-collector | R3 Adversarial | comment letters, critiques | published rebuttals |
| failure-case-hunter | R3 Adversarial | incident reports, postmortems | real-world breakdowns |
| steelman-builder | R3 Adversarial | adversarial literature | strongest opposition |
| fraud-sniffer | R3 Adversarial | anomaly reports, forensic analyses | too-good-to-be-true |
| base-rate-finder | R4 Quantitative | prevalence data, census | denominators, priors |
| effect-size-reader | R4 Quantitative | effect sizes, confidence intervals | magnitude vs significance |
| benchmark-reader | R4 Quantitative | leaderboards, eval suites | measured performance |
| trend-fitter | R4 Quantitative | time series | rates, inflections |
| cost-modeler | R4 Quantitative | pricing pages, TCO studies | unit economics |
| uncertainty-quantifier | R4 Quantitative | variance, sample sizes | error bars, n |
| recency-sweeper | R5 Temporal | newest publications, changelogs | last-N-days frontier |
| timeline-builder | R5 Temporal | dated event sequences | chronology of the claim |
| precedent-digger | R5 Temporal | historical analogues, archives | prior cycles |
| version-tracker | R5 Temporal | release notes, deprecations | which version |
| obsolescence-checker | R5 Temporal | deprecation notices, end-of-life | what is now stale |
| embargo-watcher | R5 Temporal | roadmaps, forward statements | announced-not-shipped |
| code-reader | R6 Technical | repos, source files | implementation reality |
| spec-reader | R6 Technical | RFCs, standards, schemas | normative definition |
| api-doc-reader | R6 Technical | reference docs, quotas | official limits |
| issue-tracker-miner | R6 Technical | issues, PRs, discussions | known limitations |
| architecture-mapper | R6 Technical | design docs, ADRs, diagrams | system shape |
| reproducer | R6 Technical | executed artifacts, logs | does it actually run |
| competitor-mapper | R7 Market | product pages, directories | who else does this |
| pricing-scout | R7 Market | price lists, tiers, contracts | published cost |
| adoption-reader | R7 Market | downloads, stars, job posts | actual usage |
| filing-reader | R7 Market | 10-K, S-1, annual reports | audited numbers |
| analyst-reader | R7 Market | industry analyst reports | market sizing |
| customer-voice | R7 Market | reviews, complaints, case studies | lived experience |
| statute-reader | R8 Regulatory | laws, regulations, directives | what the law says |
| caselaw-reader | R8 Regulatory | judgments, enforcement actions | how it was applied |
| regulator-watcher | R8 Regulatory | consultations, guidance notes | current guidance |
| compliance-mapper | R8 Regulatory | standards, certifications | required controls |
| jurisdiction-comparer | R8 Regulatory | cross-border comparisons | where it applies |
| policy-tracer | R8 Regulatory | drafts, lobbying records, hansard | legislative intent |
| practitioner-listener | R9 Human | forums, HN, Reddit, Discord | real usage reports |
| expert-canvasser | R9 Human | interviews, talks, podcasts, AMAs | expert commentary |
| sentiment-reader | R9 Human | review aggregates, polls | aggregate opinion + skew |
| ethnographer | R9 Human | user research, field studies | workflow context |
| dissent-locator | R9 Human | minority expert views | heterodox positions |
| translation-scout | R9 Human | regional/foreign-language sources | non-English record |
| gap-mapper | R10 Synthesis | collected findings set | what is missing |
| contradiction-mapper | R10 Synthesis | cross-findings comparison | what conflicts |
| triangulator | R10 Synthesis | source independence graph | independent confirmation |
| claim-normalizer | R10 Synthesis | semantically equal claims | dedupe/merge claims |
| coverage-auditor | R10 Synthesis | territory/recency/independence | compliance metrics |
| brief-writer | R10 Synthesis | verdict assembly | final synthesis |
