# Research Examples

Worked examples of the researcher Minds — one per research profile. Each shows the trigger, the
Charter (restated question + sub-questions + scope), the selected panel (with the mandatory
Synthesis + Adversarial seats), and an abbreviated Research Verdict. The full verdict contract is
in the *What a Researcher Returns* section of [`../researchers.md`](../researchers.md); the
profiles themselves are in [`../researchers.md#research-profiles`](../researchers.md#research-profiles).

> Sources shown as `[S1]`, `[S2]` are illustrative placeholders. A real run registers each in the
> Source Store with a canonical id and independence group. Every research verdict reports what the
> evidence *says* — not professional advice.

Every research panel MUST seat **≥1 Synthesis** and **≥1 Adversarial** researcher; where a
profile's default panel lacks one, the orchestrator tops it up at selection (shown per example).

---

## landscape-scan — "what exists in this space today?"

**Trigger:** `research council: what open-source multi-agent debate frameworks exist as of this quarter?`

Auto-detect routes to research mode (recency term "as of this quarter", asks what IS, no options
enumerated).

**Charter** — Restated: enumerate current open-source multi-agent debate/deliberation frameworks.
Sub-questions: (1) which projects exist? (2) how actively maintained? (3) what does each do
differently? (4) which are actually adopted? Scope: sources ≤ 6 months preferred; open-source
only; out-of-scope: closed SaaS.

**Panel:** competitor-mapper, recency-sweeper, adoption-reader, literature-scout,
**gap-mapper (Synthesis)**; orchestrator adds **counter-evidence-scout (Adversarial)**.

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

---

## claim-verification — "is this true?"

**Trigger:** `cite this: "GPT-style models cut customer-support handle time by 40%."`

Explicit trigger `cite this:` → research mode. This profile already carries both mandatory seats
(counter-evidence-scout = Adversarial, triangulator = Synthesis).

**Charter** — Restated: is the "40% handle-time reduction" claim supported by independent evidence?
Sub-questions: (1) where did the number originate? (2) is it independently replicated? (3) is there
disconfirming evidence? (4) is the "40%" a like-for-like measure? Scope: primary sources preferred;
≤ 24 months.

**Panel:** primary-source-hunter, citation-tracer, **counter-evidence-scout (Adversarial)**,
syndication-unmasker, **triangulator (Synthesis)**.

**Fact-Check highlight:** Entailment FAIL on [S2] — the cited blog says "up to 40%", not "40%" →
auto-raises an INFERENCE CHALLENGE into Cross-Exam. Claim demoted from "40%" to "up to 40% in one
vendor case study".

```
## Research Verdict: 40% support handle-time claim
Verdict ID: rv-2026-09-02-cv7

### Bottom Line
The "40%" figure traces to a single vendor case study [S1]; it is NOT independently
replicated [triangulator]. Independent studies report 12–22% [S4][S6].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | "40%" originates in one vendor case study | supports | high (0.8) | 1→cap 0.5 | [S1] |
| F2 | Independent studies show 12–22% | contradicts | med (0.65) | 2 | [S4],[S6] |
| F3 | Many "sources" reprint [S1] | supports | high (0.85) | 1 | [S2],[S3] (syndicated) |

### Minority Report
None credible — even the vendor source is a single case study.
What would change my mind: an independent RCT reproducing ≥35%.

### Open Questions
No evidence on which support tiers the vendor measured (like-for-like unverified).

### Falsifiers
If an independent, pre-registered study reports ≥35%, F2 weakens.

### Coverage & Limits
Citation coverage 100% · citation accuracy 80% (1 entailment fail) · independence groups: 3.
```

---

## literature-review — "academic state of the art"

**Trigger:** `research council: what is the current evidence on spaced-repetition for adult skill retention?`

**Charter** — Restated: summarise the peer-reviewed evidence base for spaced repetition in adult
skill retention. Sub-questions: (1) what does the primary literature find? (2) do meta-analyses
agree? (3) does it replicate? (4) any null/negative results? Scope: peer-reviewed + preprints;
≤ 10 years, meta-analyses preferred.

**Panel:** literature-scout, meta-analyst, replication-checker, **null-result-finder
(Adversarial)**, citation-tracer; orchestrator adds **gap-mapper (Synthesis)**.

```
## Research Verdict: spaced repetition for adult skill retention
Verdict ID: rv-2026-09-02-lit4

### Bottom Line
Meta-analytic evidence supports a moderate positive effect [S1][S3]; effect sizes shrink in
field (vs lab) settings [S5], and a file-drawer of null results tempers the headline [S7].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Meta-analyses show moderate positive effect | supports | high (0.8) | 2 | [S1],[S3] |
| F2 | Field effect sizes < lab effect sizes | mixed | med (0.6) | 2 | [S5],[S6] |
| F3 | Publication bias likely inflates F1 | contradicts | med (0.55) | 1→cap 0.5 | [S7] |

### Contested Findings
F1 vs F3: meta-analyst reports a robust effect; null-result-finder argues the funnel plot is
asymmetric — recorded, not resolved.

### Minority Report
null-result-finder: correcting for publication bias could halve the effect.
What would change my mind: a registered-report meta-analysis with pre-registered inclusion.

### Open Questions
No evidence on retention beyond 12 months (all studies short-horizon).

### Falsifiers
If a large pre-registered trial finds no field effect, F1 weakens.

### Coverage & Limits
Citation coverage 100% · independence groups: 4 · recency compliance 85%. NOT a clinical recommendation.
```

---

## technical-due-diligence — "does this software do what it claims?"

**Trigger:** `research council: does library X actually implement zero-copy streaming as its README claims?`

**Charter** — Restated: verify library X's zero-copy streaming claim against its implementation.
Sub-questions: (1) what does the code do? (2) what does the spec/API doc say? (3) any open issues
contradicting it? (4) does it reproduce? Scope: current release + latest main; ≤ 12 months.

**Panel:** code-reader, spec-reader, issue-tracker-miner, reproducer, architecture-mapper;
orchestrator adds **failure-case-hunter (Adversarial)** and **contradiction-mapper (Synthesis)**.

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

---

## market-research — "sizing, pricing, players"

**Trigger:** `sourced council: what is the current pricing and adoption of the top vector databases?`

Explicit trigger `sourced council:` → research mode.

**Charter** — Restated: compile current pricing tiers and adoption signals for leading vector DBs.
Sub-questions: (1) who are the players? (2) published pricing? (3) adoption evidence? (4) what do
customers report? Scope: ≤ 6 months for pricing; out-of-scope: unannounced pricing.

**Panel:** competitor-mapper, pricing-scout, adoption-reader, filing-reader, customer-voice;
orchestrator adds **counter-evidence-scout (Adversarial)** and **triangulator (Synthesis)**.

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

---

## competitive-intel — "rival capability + roadmap"

**Trigger:** `research council: what has competitor Acme shipped and signalled on its roadmap this year?`

**Charter** — Restated: assemble Acme's shipped capability and announced-but-unshipped roadmap.
Sub-questions: (1) what shipped? (2) what is announced but not shipped? (3) audited scale? (4) how
do customers rate it? Scope: ≤ 12 months; distinguish shipped from vaporware.

**Panel:** competitor-mapper, **embargo-watcher**, filing-reader, adoption-reader, customer-voice;
orchestrator adds **counter-evidence-scout (Adversarial)** and **triangulator (Synthesis)**.

```
## Research Verdict: Acme capability + roadmap
Verdict ID: rv-2026-09-02-ci2

### Bottom Line
Three features shipped and verifiable [S1][S2]; the flagship "auto-scaling" is announced but
unshipped [S4 embargo-watcher: roadmap, not release]. Customer sentiment is mixed on reliability [S6].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | 3 features shipped in last year | supports | high (0.8) | 2 | [S1],[S2] |
| F2 | "Auto-scaling" is roadmap, not shipped | contradicts | high (0.8) | 1→cap 0.5 | [S4] |
| F3 | Reliability complaints recurring | mixed | med (0.55) | 2 | [S6],[S7] |

### Minority Report
counter-evidence-scout: a private beta of F2 may exist off the public roadmap.
What would change my mind: a dated changelog entry or GA announcement [held: none found].

### Open Questions
No audited revenue figure (Acme is private; no filing).

### Falsifiers
If a GA release note for "auto-scaling" is found, F2 flips to shipped.

### Coverage & Limits
Citation coverage 100% · independence groups: 4 · recency compliance 90% · vaporware flagged.
```

---

## regulatory-scan — "legal exposure"

**Trigger:** `research council: what are the current data-residency obligations for storing EU user data?`

Auto-detect: recency term "current", asks what IS.

**Charter** — Restated: identify current EU data-residency obligations relevant to storing EU user
data. Sub-questions: (1) what does the statute say? (2) how has it been applied? (3) latest regulator
guidance? (4) does it vary by member state? Scope: current in-force law; ≤ 18 months for guidance;
jurisdiction: EU + member-state overlays.

**Panel:** statute-reader, caselaw-reader, regulator-watcher, jurisdiction-comparer,
compliance-mapper; orchestrator adds **critic-collector (Adversarial)** and
**contradiction-mapper (Synthesis)**.

> This is a research verdict on what the law *says*, not legal advice; it flags where qualified
> counsel is required.

```
## Research Verdict: EU data-residency obligations (current)
Verdict ID: rv-2026-09-02-reg9

### Bottom Line
No blanket EU-wide data-localisation mandate exists [S1 statute]; obligations arise from
transfer rules and sector/member-state overlays [S2][S4]. Residency ≠ localisation.

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | No general EU localisation mandate | supports | high (0.8) | 2 | [S1],[S3] |
| F2 | Transfer rules govern cross-border storage | supports | high (0.8) | 2 | [S2],[S4] |
| F3 | Some member states add stricter overlays | supports | med (0.6) | 1→cap 0.5 | [S5] |

### Contested Findings
F3: jurisdiction-comparer found one overlay; contradiction-mapper flags it may be sector-specific,
not general — recorded, not resolved.

### Minority Report
critic-collector: recent regulator guidance [S6] may tighten transfer rules — treat F2 as time-sensitive.
What would change my mind: a superseding guidance note post-dating [S2].

### Open Questions
No evidence gathered on pending legislation (embargo/roadmap) — out of Charter scope.

### Falsifiers
If a member-state law imposing general localisation is found in force, F1 falls for that state.

### Coverage & Limits
Citation coverage 100% · recency compliance 80% · territory compliance pass ·
Retrieval capability: full. NOT legal advice — verify with qualified counsel.
```

---

## provenance-audit — "who is behind this claim?"

**Trigger:** `research council: how credible is the study behind the "microdosing boosts productivity" headline?`

**Charter** — Restated: audit the provenance, funding, and independence of the study underpinning the
claim. Sub-questions: (1) who published it? (2) who funded it? (3) author track record? (4) has it been
corrected/retracted? Scope: the source and its origin graph, not the topic itself.

**Panel:** source-auditor, funding-tracer, author-profiler, syndication-unmasker,
**retraction-watch**; orchestrator adds **counter-evidence-scout (Adversarial)** and
**triangulator (Synthesis)**.

```
## Research Verdict: provenance of the microdosing-productivity study
Verdict ID: rv-2026-09-02-prov6

### Bottom Line
The claim rests on a single non-peer-reviewed preprint [S1] funded by an interested party
[S2 funding-tracer]; the "dozens of studies" framing is syndication of that one preprint [S3].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Underlying source is one preprint | supports | high (0.85) | 1→cap 0.5 | [S1] |
| F2 | Funded by a supplement vendor | contradicts | high (0.8) | 1→cap 0.5 | [S2] |
| F3 | "N sources" collapse to one origin | supports | high (0.85) | 1 | [S3],[S4] (syndicated) |

### Minority Report
counter-evidence-scout: a conflict of interest does not itself falsify the result.
What would change my mind: an independent, differently-funded replication.

### Open Questions
No correction or retraction found — but the preprint has not been formally reviewed either.

### Falsifiers
If an independent peer-reviewed replication is found, F1's single-source weakness lifts.

### Coverage & Limits
Citation coverage 100% · independence groups: 2 · territory compliance pass.
```

---

## incident-forensics — "what actually happened?"

**Trigger:** `research council: what actually caused the widely-reported service outage on the 14th?`

**Charter** — Restated: reconstruct the causal chain of the reported outage from primary evidence.
Sub-questions: (1) documented timeline? (2) known contributing bugs? (3) what changed just before?
(4) do accounts contradict? Scope: postmortems, status pages, issue trackers; ≤ 3 months.

**Panel:** failure-case-hunter, timeline-builder, issue-tracker-miner, archive-diver,
**contradiction-mapper (Synthesis)**; orchestrator confirms **failure-case-hunter (Adversarial)** seats the adversarial slot.

```
## Research Verdict: cause of the 14th outage
Verdict ID: rv-2026-09-02-inc8

### Bottom Line
A config change [S2] preceded the outage window [S1 status page]; an open issue describes the
same failure mode [S3]. Early "DDoS" reports [S5] are contradicted by the vendor postmortem [S1].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Config change shipped before the window | supports | high (0.8) | 2 | [S1],[S2] |
| F2 | Open issue matches the failure mode | supports | med (0.6) | 1→cap 0.5 | [S3] |
| F3 | "DDoS" narrative is unsupported | contradicts | med (0.65) | 2 | [S1],[S4] |

### Contested Findings
F1 vs F3: some news [S5] still attributes DDoS; timeline-builder shows the config change predates
any traffic spike — recorded, contradiction flagged.

### Minority Report
An unlogged dependency failure could be the true root cause.
What would change my mind: an upstream provider postmortem for the same window [held: none found].

### Open Questions
No evidence on why the config change passed review (archive-diver found no PR discussion).

### Falsifiers
If an upstream DDoS postmortem overlapping the exact window is found, F3 weakens.

### Coverage & Limits
Citation coverage 100% · independence groups: 3 · recency compliance 100%.
```

---

## trend-forecast — "where is this heading?"

**Trigger:** `research council: where is on-device LLM inference heading over the next 18 months?`

**Charter** — Restated: project the near-term trajectory of on-device LLM inference from observable
signals. Sub-questions: (1) measured rate of change? (2) newest datapoints? (3) announced-not-shipped?
(4) prior analogous cycles? Scope: ≤ 12 months for signals; explicit uncertainty on projections.

**Panel:** trend-fitter, recency-sweeper, **embargo-watcher**, precedent-digger,
uncertainty-quantifier; orchestrator adds **counter-evidence-scout (Adversarial)** and
**gap-mapper (Synthesis)**.

```
## Research Verdict: on-device LLM inference, next 18 months
Verdict ID: rv-2026-09-02-trd3

### Bottom Line
Model size at fixed quality is falling on a measurable curve [S1 trend-fitter]; two announced
accelerators [S4 embargo] are unshipped. Projection carries wide error bars [uncertainty-quantifier].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Quality-per-parameter improving steadily | supports | med (0.65) | 2 | [S1],[S2] |
| F2 | Two accelerators announced, not shipped | mixed | med (0.55) | 1→cap 0.5 | [S4] |
| F3 | Prior cycles overshot vendor timelines | supports | med (0.6) | 2 | [S6],[S7] (precedent) |

### Minority Report
counter-evidence-scout: extrapolating the curve past the datapoints is unwarranted.
What would change my mind: a plateau in the last two quarters' datapoints.

### Open Questions
No independent benchmark for the announced accelerators (embargoed) — gap-mapper flags.

### Falsifiers
If the next two quarters show no size-at-quality reduction, F1 falls.

### Coverage & Limits
Citation coverage 90% (one projection is [panel inference, unsourced]) · independence groups: 3.
```

---

## quantitative-scan — "get the numbers right"

**Trigger:** `research council: what is the measured false-positive rate of technique Y, with base rates?`

**Charter** — Restated: assemble the measured false-positive rate of technique Y with the relevant
base rate and uncertainty. Sub-questions: (1) raw data? (2) base rate/denominator? (3) effect size vs
significance? (4) sample sizes? Scope: datasets + peer-reviewed; report CIs, not point estimates.

**Panel:** dataset-digger, base-rate-finder, effect-size-reader, uncertainty-quantifier,
benchmark-reader; orchestrator adds **null-result-finder (Adversarial)** and
**triangulator (Synthesis)**.

```
## Research Verdict: false-positive rate of technique Y
Verdict ID: rv-2026-09-02-qs1

### Bottom Line
Reported FPR is 3% [S1] but the base rate is low [S3 base-rate-finder], so positive predictive
value is poor; the "3%" hides a wide CI [S4 uncertainty-quantifier].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Reported FPR ≈ 3% | supports | med (0.6) | 1→cap 0.5 | [S1] |
| F2 | Base rate is low (~1%) | supports | high (0.8) | 2 | [S3],[S5] |
| F3 | 3% point estimate hides a 1–7% CI | contradicts | med (0.6) | 1→cap 0.5 | [S4] |

### Minority Report
null-result-finder: the FPR study's sample is too small to be significant.
What would change my mind: a pre-registered study with n > 10k.

### Open Questions
No raw confusion matrix published — PPV computed from reported margins only.

### Falsifiers
If a larger dataset narrows the CI below 2%, F3 falls.

### Coverage & Limits
Citation coverage 100% · citation accuracy 100% · independence groups: 3 · CIs reported throughout.
```

---

## vendor-evaluation — "buy/adopt assessment"

**Trigger:** `research council: should we adopt SaaS vendor Z — what do price, docs, adoption, and users say?`

A buy/adopt evidence gather (the *decision* is a separate step; see [chained](chained.md)).

**Charter** — Restated: assemble the evidence needed to assess adopting vendor Z. Sub-questions:
(1) published pricing? (2) documented API limits? (3) real adoption? (4) reported failure modes?
Scope: ≤ 6 months; vendor material flagged as such.

**Panel:** pricing-scout, customer-voice, api-doc-reader, adoption-reader,
**failure-case-hunter (Adversarial)**; orchestrator adds **triangulator (Synthesis)**.

```
## Research Verdict: vendor Z adoption evidence
Verdict ID: rv-2026-09-02-ven4

### Bottom Line
Pricing is published and predictable [S1]; documented rate limits are tight for our workload
[S2 api-doc-reader]; users report support latency [S4]; two postmortems describe a recurring
outage pattern [S5 failure-case-hunter].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Pricing published, per-seat | supports | high (0.8) | 1→cap 0.5 | [S1] |
| F2 | Rate limits below our peak | contradicts | med (0.65) | 2 | [S2],[S3] |
| F3 | Recurring outage pattern reported | mixed | med (0.55) | 2 | [S4],[S5] |

### Minority Report
failure-case-hunter: the outages predate a since-shipped fix.
What would change my mind: a post-fix uptime report from an independent monitor.

### Open Questions
No independent uptime telemetry (only vendor status page + user anecdotes).

### Falsifiers
If the vendor raises rate limits to cover our peak, F2 falls.

### Coverage & Limits
Citation coverage 100% · independence groups: 4 · vendor material flagged · recency compliance 90%.
```

---

## academic-survey — "survey-grade coverage"

**Trigger:** `research council: produce a survey-grade map of research on federated learning for healthcare.`

**Charter** — Restated: map the research landscape for federated learning in healthcare to survey
depth. Sub-questions: (1) core literature? (2) meta-analyses/reviews? (3) citation genealogy? (4)
non-English work? Scope: peer-reviewed + preprints; ≤ 8 years; flag coverage gaps explicitly.

**Panel:** literature-scout, meta-analyst, citation-tracer, **translation-scout**,
**gap-mapper (Synthesis)**; orchestrator adds **null-result-finder (Adversarial)**.

```
## Research Verdict: federated learning for healthcare — survey map
Verdict ID: rv-2026-09-02-surv2

### Bottom Line
The field clusters around three sub-areas [S1][S3][S6]; a citation-genealogy shows two seminal
papers dominate [S4]; substantial non-English (CN/DE) work is under-cited in English reviews [S8].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | 3 dominant sub-areas | supports | high (0.8) | 3 | [S1],[S3],[S6] |
| F2 | 2 seminal papers anchor citations | supports | high (0.85) | 2 | [S4],[S5] |
| F3 | Non-English work under-represented in reviews | mixed | med (0.6) | 2 | [S8],[S9] |

### Minority Report
null-result-finder: negative/failed FL deployments are largely unpublished.
What would change my mind: a registry of failed clinical FL pilots.

### Open Questions
No coverage of 2018-era foundational work outside the top-cited two (gap-mapper: pre-2019 gap).

### Falsifiers
If a fourth well-cited sub-area is found, F1's "three" count falls.

### Coverage & Limits
Citation coverage 100% · independence groups: 5 · recency compliance 80% · translation coverage: CN, DE.
```

---

## red-team-research — "try to break this claim"

**Trigger:** `research council: try to break the claim that our new algorithm is state-of-the-art.`

Adversarial by construction — this profile's default panel is all-adversarial; a Synthesis seat is
added to audit the collected set.

**Charter** — Restated: assemble the strongest disconfirming evidence against the SOTA claim.
Sub-questions: (1) contradicting results? (2) unpublished null results? (3) published rebuttals?
(4) is the benchmark gamed? Scope: seek disconfirmation first; ≤ 24 months.

**Panel:** counter-evidence-scout, steelman-builder, critic-collector, fraud-sniffer,
null-result-finder (all Adversarial); orchestrator adds **contradiction-mapper (Synthesis)**.

```
## Research Verdict: SOTA claim, red-teamed
Verdict ID: rv-2026-09-02-rt5

### Bottom Line
The SOTA claim holds only on one benchmark [S1]; a competing method leads on two others
[S3][S4]. The headline benchmark shows contamination signals [S6 fraud-sniffer].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | SOTA only on benchmark A | contradicts | med (0.65) | 2 | [S1],[S3] |
| F2 | Competitor leads on B and C | contradicts | med (0.6) | 2 | [S3],[S4] |
| F3 | Benchmark A shows train/test overlap | contradicts | med (0.55) | 1→cap 0.5 | [S6] |

### Minority Report (steelman)
steelman-builder: on the metric that matters for our use case, benchmark A is the right one.
What would change my mind: proof that B/C reflect our workload better than A.

### Open Questions
No re-run of benchmark A with a decontaminated split (fraud-sniffer flags, cannot confirm).

### Falsifiers
If a decontaminated re-run of A still shows the lead, F3 falls and the claim strengthens.

### Coverage & Limits
Citation coverage 100% · independence groups: 3 · disconfirmation-first search documented.
```

---

## feasibility-study — "can this actually be done?"

**Trigger:** `research council: is it feasible to run our full pipeline entirely on-device within a 2GB memory budget?`

**Charter** — Restated: assess whether the pipeline can run on-device inside 2GB from evidence, not
opinion. Sub-questions: (1) what do the specs require? (2) does a reference impl reproduce it? (3)
unit cost/footprint? (4) prior attempts? Scope: specs + reproducible artifacts + precedent; ≤ 18 months.

**Panel:** spec-reader, reproducer, cost-modeler, precedent-digger,
**failure-case-hunter (Adversarial)**; orchestrator adds **gap-mapper (Synthesis)**.

```
## Research Verdict: on-device pipeline within 2GB
Verdict ID: rv-2026-09-02-fea7

### Bottom Line
The model tier fits in ~1.3GB [S1 spec][S2 repro], but the preprocessing stage's peak footprint
pushes total over 2GB under load [S3 reproducer]; a prior attempt hit the same wall [S5 precedent].

### Findings
| # | Claim | Stance | Confidence | Indep. groups | Sources |
|---|-------|--------|-----------|--------------|---------|
| F1 | Model tier fits ~1.3GB | supports | high (0.8) | 2 | [S1],[S2] |
| F2 | Preprocessing peak breaks 2GB total | contradicts | med (0.65) | 1→cap 0.5 | [S3 repro] |
| F3 | Prior on-device attempt failed on memory | supports | med (0.6) | 2 | [S5],[S6] |

### Minority Report
failure-case-hunter: streaming the preprocessing could stay under budget.
What would change my mind: a reproducible streaming impl measured under peak load.

### Open Questions
No cost model for the streaming variant (cost-modeler: not yet built) — gap-mapper flags.

### Falsifiers
If a streaming preprocessing impl reproduces under 2GB peak, F2 falls and feasibility holds.

### Coverage & Limits
Citation coverage 100% · independence groups: 4 · reproducibility: F2 reproduced, streaming not tested.
```

---

See [decision.md](decision.md) for the decision-side examples and [chained.md](chained.md) for a
Research → Decision chained run.
