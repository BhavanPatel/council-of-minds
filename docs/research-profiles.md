# Research Profiles (v4.0)

The Research Council (mode `research`) ships **15 research profiles** — curated panels of
researchers for common evidence tasks. Each profile seats **5 researchers** by default
(panel 4–6, up to 8 at Deep/Unlimited).

> **Selector constraint:** every research panel MUST include **≥1 Synthesis (R10)**
> researcher and **≥1 Adversarial (R3)** researcher. Without R10 nothing audits the
> collected set; without R3 the panel only confirms. Where a profile's default 5 does not
> already carry both, the orchestrator adds the missing seat at panel selection (noted per
> profile below).

Trigger a profile with `research council: [question]` and name the profile, or let
auto-selection pick one from the researcher registry.

| Profile | Researchers (default 5) | For |
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

## Mandatory-seat coverage

Profiles whose default 5 already carry both mandatory seats:
- **claim-verification** (counter-evidence-scout = R3, triangulator = R10)
- **incident-forensics** (failure-case-hunter = R3, contradiction-mapper = R10)
- **literature-review** (null-result-finder = R3; citation-tracer covers evidence provenance, gap-mapper R10 added on demand)
- **vendor-evaluation / feasibility-study** (failure-case-hunter = R3; R10 auditor added on demand)
- **red-team-research** (all five are R3-adversarial; contradiction-mapper R10 added on demand)

Profiles where the orchestrator adds a mandatory seat at panel selection (documented in
`settings/research-council.config.json` per-profile `note`): **landscape-scan**,
**market-research**, **technical-due-diligence**, **competitive-intel**, **regulatory-scan**,
**provenance-audit**, **trend-forecast**, **quantitative-scan**, **academic-survey**.

## Budget tiers

Research budget is spent on **retrieval dimensions**, not word limits. See the Research Cost
Budget Tiers table in [`council-of-minds.md`](../council-of-minds.md) and
`settings/research-council.config.json` → `budgetTiers`. Degradation order sacrifices
progressive passes first and **fact-check scope last**; rounds are never a throttle.

## See also

- [`docs/researchers.md`](researchers.md) — the 60 researchers, themes, and Territory Matrix
- [`docs/research-verdict-contract.md`](research-verdict-contract.md) — the Research Verdict output contract
- [`docs/retrieval-layer.md`](retrieval-layer.md) — the Retrieval Capability Contract and Source Store
- [`docs/examples/`](examples/) — worked research-council examples
