# Retrieval Layer (v4.0-alpha)

The retrieval layer is the foundation of the **Research Council** — the second chamber of Council of Minds. Where the 60 advisors reason from prior knowledge, the 60 researchers retrieve external evidence. This document specifies the plumbing that makes that possible: the capability contract, the Source Store, and the rules that govern fetching.

Everything here is **tool-neutral and agent-agnostic**. No vendor, model, or specific search provider is named. Any host that can *search the web* and *fetch a URL* satisfies the contract; hosts that cannot degrade gracefully to a labelled prior-knowledge briefing.

> Config: [`settings/research-council.config.json`](../settings/research-council.config.json)
> Status: Phase 15 (foundation) + Phase 16 (researcher cast) implemented. Orchestrator round flow (R0–R6), profiles, and budget tiers arrive in Phases 17–19.

---

## 1. Retrieval Capability Contract

The Research Council depends on two abstract capabilities. The host supplies them; the council never assumes a particular implementation.

| Capability | Signature | Returns |
|-----------|-----------|---------|
| `search`  | `search(query, filters)` | ranked list of `{title, url, snippet, publish_date?, source?}` |
| `fetch`   | `fetch(url)` | `{url, canonical_url?, title?, publish_date?, author?, publisher?, text}` |

`search` filters (all optional): `recencyWindow`, `sourceClass`, `language`, `jurisdiction`, `siteScope`.

### Capability probe

At **session start**, before any researcher is dispatched, the council probes the host:

1. Issue one trivial `search` query → success enables retrieval.
2. `fetch` one known URL → success enables full-text.

The probe resolves to one of three states:

- **full** — both `search` and `fetch` available → the council may emit a **Research Verdict**.
- **searchOnly** — snippets but no full text → allowed, but every finding is flagged `[snippet-only, unverified full text]`.
- **none** — neither available → the `onCapabilityMissing` policy applies.

### onCapabilityMissing → degrade-to-briefing

The single unrecoverable failure mode is **silently fabricating citations**. Therefore, when retrieval is unavailable the council **MUST NOT** emit a Research Verdict. Instead it emits a clearly labelled **PRIOR-KNOWLEDGE BRIEFING** that:

- (a) states retrieval was unavailable,
- (b) carries **no** citations,
- (c) caps every claim's confidence at `low`, and
- (d) lists the queries that *would* have been run, so the user can retrieve manually.

Never present prior-knowledge claims as if they were retrieved and sourced.

---

## 2. Source Store

A shared evidence ledger. Every fetched artifact is registered **once**; researchers reference sources by `canonical_id` rather than passing raw text around.

### Record schema

| Field | Meaning |
|-------|---------|
| `canonical_id` | stable hash identifying the source (see below) |
| `independence_group` | id shared by sources that are **not** independent |
| `first_claimer` | canonical_id of the earliest source making a claim, if known |
| `fetched_by` | researcher id that retrieved this source |
| `fetched_at` | ISO-8601 retrieval timestamp |
| `publish_date` | ISO-8601 publish date if known, else null |
| `class` | source class (see Source Classes) |
| `verification` | `unverified` \| `verified` \| `demoted` (set by the Verification Ledger, Phase 17) |
| `url` | resolved URL or DOI |
| `title` | source title |

### Canonical ID algorithm

Deterministic identity so the same source fetched twice collides:

```
canonical_id = hash( normalized_url | DOI | (title + publish_date) )
```

Precedence: **DOI → normalized_url → title+publish_date**.

URL normalization: lowercase host · strip scheme and `www.` · strip tracking params (`utm_*`, `ref`, `fbclid`, `gclid`) · strip trailing slash and fragment · resolve known shorteners before hashing.

### Independence grouping

**N sources from one origin count as ONE** for coverage and confidence. Group by the union of `{publisher, author, syndication_origin}`. Signals:

- same publisher / domain owner
- same author or byline
- wire-service / syndication origin (a reprint of the same copy)
- same funding source for the underlying study

Effect: citation-coverage and confidence metrics count **independence groups**, not raw source count. Three papers from one lab, or ten outlets running the same wire story, are one group.

### Source classes

`peer-reviewed`, `preprint`, `primary-document`, `dataset`, `standard-spec`, `code-repository`, `official-docs`, `filing-financial`, `regulatory-legal`, `news-reporting`, `analyst-report`, `vendor-material`, `community-forum`, `expert-commentary`, `archive-cache`.

---

## 3. Fetch-time dedupe with quota refund

Before recording a fetch, compute its `canonical_id`. If it already exists in the Source Store:

- do **not** double-count it, and
- **refund** the fetch against the researcher's budget, requiring the next fetch to target a *different* `independence_group`.

A collision is not wasted budget — it is a **diversity push**. The panel is steered toward independent sources rather than penalised for overlap.

---

## 4. Diminishing-returns stop

Halt a researcher's retrieval when the **last 3 fetches each yield < 20% novel claims** relative to the Source Store. Novelty = the fraction of claims in a fetched source not already asserted by a registered source. A floor applies: every researcher may always run at least its tier-minimum fetches before this rule can trigger.

---

## 5. What this layer does NOT do yet

Deferred to later phases so Phase 15/16 stay in scope:

- **Round flow R0–R6** (Charter Gate, lens/query generation, retrieval+analysis, fact-check, cross-exam, progressive retrieval, enforcement scan, crystallization) — Phase 17.
- **Research Verdict output contract** — Phase 18.
- **15 research profiles + budget tiers + triggers** — Phase 19.
- **Chamber chaining (Research → Decision)** — Phase 20.

See the roadmap in `.kiro/steering/roadmap-status.md` for the full v4.0 plan.
