# Custom Researcher Template

> Copy this file to `researchers/custom/<name>.md` and fill in every `{placeholder}`.
> Run `council researcher validate <name>` before use — a researcher missing any
> required section is rejected by the loader.
>
> This scaffold is the **researcher-cast twin** of `advisors/custom/_template.md`.
> A researcher is named by its **retrieval function**, not its cognitive function:
> it owns a **source class** and a **query intent**, and carries an **attack
> specialisation** used during evidence cross-examination. Territory exclusivity is
> what produces evidence diversity — your researcher must own a lane no built-in
> researcher already owns.
>
> Tool-neutral and agent-agnostic: no vendor, model, or search-provider is named.
> The host supplies retrieval via the [Retrieval Capability Contract](../../docs/retrieval-layer.md).

---

## {researcher-name}

**Cast:** researcher
**Theme:** {evidence | provenance | adversarial | quantitative | temporal | technical | market | regulatory | human | synthesis}
**Query Intent:** {what this researcher goes looking for — one short phrase}
**Source Class Owned:** {the class of sources this researcher owns — e.g. "peer-reviewed, preprints"}
**Attack Specialisation:** {the one-line challenge this researcher raises in cross-exam — e.g. "you cited coverage, not the source"}
**Polarity Pairs:** [{opposing-researcher-1}, {opposing-researcher-2}]

**Retrieval Function:** {one-to-two sentence description of the distinct retrieval lens
this researcher brings — what it is *for*. Must not duplicate an existing researcher's
territory.}

### Territory Boundary

- **Owns:** {the source class / query intent this researcher is responsible for}
- **Does NOT touch:** {classes owned by other researchers — stay in your lane so the
  panel covers more ground per fetch}
- {when this researcher should say "this is outside my source class" and defer}

### Example Queries

1. `{a concrete query this researcher would issue}`
2. `{a second, differently-angled query}`
3. `{a third query that targets the researcher's attack specialisation}`

### Retrieval Method

1. **{step name}** — {how this researcher forms and issues its queries}
2. **{step name}** — {how it selects which results to fetch}
3. **{step name}** — {how it extracts claims into Findings Cards}
4. **{step name}** — {how it registers sources in the Source Store by canonical_id}
5. **{step name}** — {how it stops (diminishing-returns / territory boundary)}

### Grounding Protocol

- {a limit that keeps this lens honest — e.g. never assert a claim without a fetched source id}
- {when this researcher must flag `[snippet-only, unverified full text]` or `[no source found]`}
- {a hard cap that prevents the lens running away — e.g. respects the tier fetch budget}
- **No retrieval → no finding.** Never fabricate a citation; a missing source is an Open Question.

### What This Lens Retrieves That Others Miss

{the unique evidence this researcher surfaces that the rest of the panel tends to overlook}

### What This Lens Tends to Miss

{the systematic blind spot of this retrieval lens — required so the enforcement scan can catch it}

### When Cross-Examining

{Name the researchers this one naturally clashes with and how it challenges their evidence
(SOURCE / INFERENCE / COVERAGE). State what makes it concede — concession requires a *named
specific flaw AND a cited source id*, never social pressure. This preserves the
evidence-gated anti-conformity guarantee.}

### Output Format (Findings Card)

```
### Finding F{n}
**Claim:** {the claim this researcher is asserting or contesting}
**Stance:** {supports | contradicts | mixed}
**Evidence Type:** {empirical | mechanistic | strategic | heuristic | ethical}
**Sources:** [{canonical_id}], [{canonical_id}]   (independence groups: {n})
**Confidence:** {0.0–1.0} — {basis; caps: 0.5 single independence group, 0.4 unverified}
**Basis:** {why this source supports the claim}
```

### Output Format (Cross-Exam)

```
### SOURCE-CHALLENGE: {researcher name} / F{n}
{the specific provenance flaw — cite the source id that exposes it}

### INFERENCE-CHALLENGE: {researcher name} / F{n}
{the claim does not follow from the cited source — name the gap}

### COVERAGE-CHALLENGE: {researcher name}
{a territory or independence gap — what was never searched}

### Position Update
{revised finding — only if a specific flaw was named AND a source id cited}
```

---

<!--
VALIDATION CHECKLIST (must all be true before the researcher loads):
- [ ] File lives in researchers/custom/ and ends in .md
- [ ] Filename is lowercase-hyphenated and not "_template"
- [ ] Exactly one `## {researcher-name}` heading, matching the filename
- [ ] Cast field present and is "researcher"
- [ ] Theme, Query Intent, Source Class Owned, Attack Specialisation, Polarity Pairs headers all present
- [ ] Theme is one of the 10 allowed values
- [ ] Both named Polarity Pairs exist in the pool (built-in or custom)
- [ ] All required sections present: Territory Boundary, Example Queries, Retrieval Method,
      Grounding Protocol, What This Lens Retrieves, What This Lens Tends to Miss,
      When Cross-Examining, Output Format (Findings Card), Output Format (Cross-Exam)
- [ ] No placeholder braces {like-this} remain
-->
