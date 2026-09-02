# Custom Advisors

Define your own advisors and drop them into the pool alongside the built-in
members. Custom advisors are discovered automatically and become available to
auto-selection and to any profile that lists them — no code changes required.

The builder is **agent-agnostic and tool-neutral**: an advisor is just a markdown
file that follows the template. There is no runtime, no vendor lock, and no model
dependency.

## Quick start

```bash
council advisor create risk-quant     # scaffolds advisors/custom/risk-quant.md
$EDITOR advisors/custom/risk-quant.md  # fill in every {placeholder}
council advisor validate risk-quant    # check structure before use
council advisor list                   # see all custom members
council install                        # re-copy into your AI clients
```

Then reference it in a session or add it to a profile in
`settings/council-of-minds.config.json`.

## Files

| File | Purpose |
|------|---------|
| `_template.md` | Cast-agnostic scaffold. Never loaded as an advisor (name is ignored). |
| `<name>.md` | Your custom advisor. Filename must be lowercase-hyphenated. |

## Cast field

The template carries a `Cast:` field so the same scaffold can define either kind of Mind:

- `Cast: advisor` — a reasoning Mind. Fill in and drop into `advisors/custom/`.
- `Cast: researcher` — a retrieval Mind. Fill in and drop into `researchers/custom/`
  (see `researchers/custom/README.md`). Both casts are live.

## Required sections

A custom advisor is **rejected by the loader** unless it contains all of:

1. A single `## <member-name>` heading matching the filename
2. `**Cast:**` — `advisor` or `researcher`
3. `**Reasoning Method:**`, `**Polarity Pairs:**`, `**Evidence Type:**`
4. `### Analytical Method`
5. `### Grounding Protocol`
6. `### What This Lens Sees That Others Miss`
7. `### What This Lens Tends to Miss`
8. `### When Deliberating`
9. `### Output Format (Standalone)`
10. `### Output Format (Council Round 2)`

Additional rules:

- **Evidence Type** must be one of: `empirical`, `mechanistic`, `strategic`,
  `heuristic`, `ethical`, `experiential`, `generative`.
- **Polarity Pairs** must name two members that exist in the pool (built-in or
  another custom advisor). Polarity pairs preserve the productive-tension and
  evidence-diversity guarantees the enforcement scan depends on.
- **No leftover `{placeholders}`.** `council advisor validate` fails on any
  remaining brace placeholder.
- The `When Deliberating` section must state that concession requires a *named
  specific flaw* — this is what keeps the anti-conformity guarantee intact for
  custom members.

## Integration

- **Auto-selection:** custom advisors are scored by any `autoSelectKeywords`
  entry you add for them in `settings/council-of-minds.config.json`. Without
  keywords they can still be summoned by name or via a profile.
- **Profiles:** add the custom advisor's name to any profile's `advisors` array.
- **Cost budget & enforcement:** custom advisors obey the same panel-size limits
  (4–6), dissent quota, and evidence-diversity thresholds as built-in members.

## Not committed by default

Files in `advisors/custom/` other than `_template.md` and this `README.md` are
yours. Keep them local or commit them to your own fork — the upstream project
ships only the scaffold.
