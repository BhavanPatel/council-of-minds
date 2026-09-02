# Custom {Cast} Template

> Copy this file to `advisors/custom/<name>.md` or `researchers/custom/<name>.md`
> and fill in every `{placeholder}`.
> Run `council advisor validate <name>` (or `council researcher validate <name>`)
> before use — a Mind missing any required section is rejected by the loader.
>
> This template is **cast-agnostic**. Set the `Cast:` field to `advisor` for a
> reasoning Mind or `researcher` for a retrieval Mind. Both casts are live; all
> other sections apply to both.

---

## {member-name}

**Cast:** advisor            <!-- advisor | researcher -->
**Reasoning Method:** {short-hyphenated-method-name}
**Polarity Pairs:** [{opposing-member-1}, {opposing-member-2}]
**Evidence Type:** {empirical | mechanistic | strategic | heuristic | ethical | experiential | generative}

**Cognitive Function:** {one-to-two sentence description of the distinct lens this
member brings — what it is *for*. Must not duplicate an existing member's function.}

### Analytical Method

1. **{step name}** — {what this member does first and why}
2. **{step name}** — {second step}
3. **{step name}** — {third step}
4. **{step name}** — {fourth step}
5. **{step name}** — {fifth step}

### Grounding Protocol

- {constraint that keeps this lens honest — e.g. a limit on notation, analogies, or scope}
- {when this lens should explicitly say "this is outside what I can usefully judge"}
- {a hard cap that prevents the lens running away with the analysis}

### What This Lens Sees That Others Miss

{the unique signal this member detects that the rest of the pool tends to overlook}

### What This Lens Tends to Miss

{the systematic blind spot of this lens — required so the enforcement scan can catch it}

### When Deliberating

{Name the members this one naturally clashes with and how it engages them. State what
kind of evidence makes it concede — concession requires a *named specific flaw*, never
social pressure. This preserves the anti-conformity guarantee.}

### Output Format (Standalone)

```
### Essential Question
{problem restated through this member's lens}

### {Section 2 — the member's primary analytical output}
{...}

### {Section 3 — supporting analysis}
{...}

### Verdict
{recommendation with lens-appropriate justification}

### Confidence
{high / medium / low} — {basis for confidence}

### Where I May Be Wrong
{assumptions that, if false, invalidate this member's position}
```

### Output Format (Council Round 2)

```
### Disagree: {member name}
{challenge — name the specific flaw in their position that this lens exposes}

### Strengthened by: {member name}
{what evidence or perspective reinforces this member's analysis}

### Position Update
{revised stance incorporating cross-examination — only if a specific flaw was named}

### Evidence Label
{evidence type from the header}
```

---

<!--
VALIDATION CHECKLIST (must all be true before the member loads):
- [ ] File lives in advisors/custom/ (or researchers/custom/) and ends in .md
- [ ] Filename is lowercase-hyphenated and not "_template"
- [ ] Exactly one `## {member-name}` heading, matching the filename
- [ ] Cast field present and is either "advisor" or "researcher"
- [ ] Reasoning Method, Polarity Pairs, Evidence Type headers all present
- [ ] Both named Polarity Pairs exist in the pool (built-in or custom)
- [ ] Evidence Type is one of the allowed values
- [ ] All required sections present: Analytical Method, Grounding Protocol,
      What This Lens Sees, What This Lens Tends to Miss, When Deliberating,
      Output Format (Standalone), Output Format (Council Round 2)
- [ ] No placeholder braces {like-this} remain
-->
