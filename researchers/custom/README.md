# Custom Researchers

Define your own retrieval lenses and drop them into the pool alongside the 60
built-in researchers. Custom researchers are discovered automatically and become
available to research auto-selection and to any research profile that lists them —
no code changes required.

The builder is **agent-agnostic and tool-neutral**: a researcher is just a markdown
file that follows the template. There is no runtime, no vendor lock, and no model
or search-provider dependency — the host supplies retrieval via the
[Retrieval Capability Contract](../../docs/retrieval-layer.md).

This is the **research-chamber twin** of `advisors/custom/`. Where an advisor is a
way of *thinking*, a researcher is a way of *looking* — it owns a source class and a
query intent, and it must occupy territory no built-in researcher already owns.

## Quick start

```bash
council researcher create billing-telemetry     # scaffolds researchers/custom/billing-telemetry.md
$EDITOR researchers/custom/billing-telemetry.md  # fill in every {placeholder}
council researcher validate billing-telemetry    # check structure before use
council researcher list                          # see all custom researchers
council install                                  # re-copy into your AI clients
```

Then reference it in a research session or add it to a profile in
`settings/research-council.config.json`.

## Files

| File | Purpose |
|------|---------|
| `_template.md` | Cast-agnostic scaffold. Never loaded as a researcher (name is ignored). |
| `<name>.md` | Your custom researcher. Filename must be lowercase-hyphenated. |

## Required sections

A custom researcher is **rejected by the loader** unless it contains all of:

1. A single `## <researcher-name>` heading matching the filename
2. `**Cast:**` — must be `researcher`
3. `**Theme:**`, `**Query Intent:**`, `**Source Class Owned:**`,
   `**Attack Specialisation:**`, `**Polarity Pairs:**`
4. `### Territory Boundary`
5. `### Example Queries`
6. `### Retrieval Method`
7. `### Grounding Protocol`
8. `### What This Lens Retrieves That Others Miss`
9. `### What This Lens Tends to Miss`
10. `### When Cross-Examining`
11. `### Output Format (Findings Card)`
12. `### Output Format (Cross-Exam)`

Additional rules:

- **Theme** must be one of: `evidence`, `provenance`, `adversarial`, `quantitative`,
  `temporal`, `technical`, `market`, `regulatory`, `human`, `synthesis`.
- **Polarity Pairs** must name two researchers that exist in the pool (built-in or
  another custom researcher). Polarity pairs drive the sparse O(N) evidence
  cross-examination.
- **No leftover `{placeholders}`.** `council researcher validate` fails on any
  remaining brace placeholder.
- The `When Cross-Examining` section must state that concession requires a *named
  specific flaw AND a cited source id* — this keeps the evidence-gated
  anti-conformity guarantee intact for custom researchers.
- **Territory exclusivity:** your researcher must own a source class / query intent
  that no built-in researcher already owns. Overlap wastes fetch budget.

## Integration

- **Auto-selection:** custom researchers are eligible for research panel selection;
  the selector still enforces **≥1 Synthesis + ≥1 Adversarial** seat and the 4–6
  (up to 8 at deep tier) panel size.
- **Profiles:** add the custom researcher's name to any research profile's list in
  `settings/research-council.config.json`.
- **Budget & enforcement:** custom researchers obey the same retrieval budget tiers,
  diminishing-returns stop, and enforcement gates as built-in researchers.

## Not committed by default

Files in `researchers/custom/` other than `_template.md` and this `README.md` are
yours. Keep them local or commit them to your own fork — the upstream project ships
only the scaffold.
