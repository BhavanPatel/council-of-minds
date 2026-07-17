# Council Profiles

Profiles determine which 4-6 advisors are selected for a council session. Each profile is optimized for a specific decision domain.

---

## Available Profiles

### engineering

**Advisors:** architect · deriver · shipper · systems-mapper · inverter · user-advocate

**Best for:** Technical architecture, code design, infrastructure decisions, build vs buy (technical), API design, migration decisions.

**Why these 6:** Covers formal structure (architect), ground truth (deriver), shipping reality (shipper), systemic effects (systems-mapper), failure avoidance (inverter), and developer experience (user-advocate). Natural tensions: architect vs shipper (elegance vs pragmatism), deriver vs systems-mapper (reductionist vs holistic).

---

### strategy

**Advisors:** strategist · realist · inverter · timer · tail-watcher · systems-mapper

**Best for:** Market positioning, competitive moves, organizational decisions, pricing, partnerships, market entry.

**Why these 6:** Covers competitive terrain (strategist), incentive reality (realist), failure modes (inverter), timing (timer), downside exposure (tail-watcher), and systemic dynamics (systems-mapper). Natural tensions: strategist vs timer (act now vs wait), realist vs tail-watcher (expected case vs extreme case).

---

### product

**Advisors:** user-advocate · shipper · realist · bias-hunter · reframer · deriver

**Best for:** Feature prioritization, product direction, UX decisions, roadmap tradeoffs, pricing models, launch strategy.

**Why these 6:** Covers user needs (user-advocate), shipping constraints (shipper), stakeholder dynamics (realist), decision biases (bias-hunter), reframing (reframer), and first principles (deriver). Natural tensions: user-advocate vs shipper (perfect UX vs ship now), bias-hunter vs realist (cognitive traps vs political reality).

---

### risk

**Advisors:** tail-watcher · bias-hunter · inverter · systems-mapper · stoic · strategist

**Best for:** High-stakes go/no-go decisions, investment decisions, irreversible actions, security decisions, compliance questions.

**Why these 6:** Covers tail risk (tail-watcher), cognitive biases (bias-hunter), failure inversion (inverter), systemic exposure (systems-mapper), moral clarity (stoic), and adversarial dynamics (strategist). Natural tensions: tail-watcher vs strategist (caution vs opportunity), stoic vs bias-hunter (duty vs rationality).

---

### ai-ml

**Advisors:** model-whisperer · frontier-scout · architect · deriver · tail-watcher · shipper

**Best for:** AI/ML product decisions, model selection, capability assessment, safety evaluation, build-vs-prompt-vs-fine-tune.

**Why these 6:** Covers current capabilities (model-whisperer), scaling trajectory (frontier-scout), formal boundaries (architect), first principles (deriver), risk exposure (tail-watcher), and shipping pragmatism (shipper). Natural tensions: frontier-scout vs shipper (long-term safety vs ship now), model-whisperer vs architect (empirical vs formal).

---

### innovation

**Advisors:** questioner · subtractor · reframer · taxonomist · deriver · inverter

**Best for:** Exploring new spaces, challenging assumptions, zero-to-one decisions, "should we build this at all?" questions.

**Why these 6:** Covers assumption destruction (questioner), subtraction (subtractor), reframing (reframer), classification (taxonomist), first principles (deriver), and inversion (inverter). Natural tensions: questioner vs taxonomist (destroy categories vs build them), subtractor vs deriver (do nothing vs derive from scratch).

---

### creative

**Advisors:** ideator · synthesizer · narrator · provocateur · aesthete · analogist

**Best for:** Brainstorming, naming, brand strategy, creative direction, narrative design, product storytelling, design critique, cross-domain ideation.

**Why these 6:** Covers divergent generation (ideator), structural fusion (synthesizer), narrative coherence (narrator), sacred-cow destruction (provocateur), form-function elegance (aesthete), and cross-domain transfer (analogist). Natural tensions: ideator vs subtractor (generate vs eliminate), provocateur vs stoic (destroy vs accept), aesthete vs shipper (elegance vs pragmatism).

---

### people

**Advisors:** empath · culture-reader · negotiator · motivator · devil's-advocate · historian

**Best for:** Hiring decisions, team dynamics, conflict resolution, organizational change, people management, stakeholder alignment, motivation design.

**Why these 6:** Covers emotional intelligence (empath), organizational dynamics (culture-reader), interest-based bargaining (negotiator), behavioral activation (motivator), systematic opposition (devil's-advocate), and historical precedent (historian). Natural tensions: empath vs architect (feelings vs structure), culture-reader vs shipper (readiness vs speed), devil's-advocate vs narrator (opposition vs story).

---

### finance

**Advisors:** financier · data-analyst · strategist · tail-watcher · realist

**Best for:** Investment decisions, pricing strategy, capital allocation, economic modeling, ROI analysis.

**Why these 5:** Covers quantitative modeling (financier), data rigor (data-analyst), competitive positioning (strategist), downside protection (tail-watcher), and political realism (realist). Natural tensions: financier vs stoic (profit vs duty), tail-watcher vs strategist (caution vs aggression).

---

### legal

**Advisors:** legalist · stoic · bias-hunter · historian · diplomat

**Best for:** Contracts, compliance, regulatory navigation, liability assessment, legal strategy.

**Why these 5:** Covers regulatory analysis (legalist), moral clarity (stoic), cognitive bias (bias-hunter), precedent (historian), and stakeholder management (diplomat). Natural tensions: legalist vs shipper (compliance vs speed), stoic vs strategist (principle vs pragmatism).

---

### science

**Advisors:** scientist · data-analyst · deriver · devil's-advocate · frontier-scout

**Best for:** Research direction, hypothesis testing, evidence evaluation, experimental design, scientific rigor.

**Why these 5:** Covers hypothesis testing (scientist), statistical inference (data-analyst), first principles (deriver), adversarial testing (devil's-advocate), and frontier awareness (frontier-scout). Natural tensions: scientist vs narrator (evidence vs story), devil's-advocate vs narrator (opposition vs coherence).

---

### operations

**Advisors:** operator · systems-mapper · shipper · timer · diplomat

**Best for:** Execution planning, resource allocation, logistics, process optimization, delivery.

**Why these 5:** Covers resource orchestration (operator), feedback loops (systems-mapper), pragmatic shipping (shipper), timing (timer), and stakeholder alignment (diplomat). Natural tensions: operator vs architect (execution vs elegance), shipper vs timer (now vs right moment).

---

## Auto-Selection Logic

When the user says `council this: [question]` without specifying a profile, the orchestrator scores each advisor against keyword maps:

```
Question: "Should we migrate to event-driven architecture?"

Keyword matches:
  architect:      "architecture" -> +1
  deriver:        "migrate" (implies first-principles evaluation) -> +0.5
  shipper:        "migrate" (shipping concern) -> +0.5
  systems-mapper: "event-driven" (feedback loops) -> +1
  inverter:       "should we" (decision, tradeoff) -> +0.5
  user-advocate:  (no match) -> 0
  strategist:     (no match) -> 0
  tail-watcher:   "migrate" (risk of migration) -> +0.5
  ...

Top 7 selected: architect, systems-mapper, deriver, shipper, inverter, tail-watcher + [challenger]
```

The **challenger guarantee** ensures at least one of (questioner, subtractor, reframer) is always included — even if their keyword score is low. This prevents echo chambers.

---

## Custom Profiles

Users can specify exact advisors:

```
council this with architect, tail-watcher, realist, shipper, questioner: [question]
```

Or create persistent custom profiles by editing `council-of-minds.config.json`:

```json
{
  "profiles": {
    "my-team-decisions": {
      "advisors": ["realist", "bias-hunter", "shipper", "stoic", "inverter", "reframer"],
      "description": "Team-level decisions with political awareness"
    }
  }
}
```

---

## Profile Selection Tips

| If your question involves... | Use profile |
|------------------------------|-------------|
| Code, architecture, systems | `engineering` |
| Market, competition, positioning | `strategy` |
| Users, features, roadmap | `product` |
| High stakes, irreversible, security | `risk` |
| AI/ML, models, training, prompting | `ai-ml` |
| "Should we even do this?", challenging assumptions | `innovation` |
| Uncertain — multiple domains | `council this:` (auto-select) |
