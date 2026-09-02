# Advisor Reference

Advisors are the reasoning Minds — each one a distinct cognitive lens with a unique
analytical method, a grounding protocol (which prevents drift into generic advice), and
acknowledged blind spots. A panel of a handful of advisors deliberates a question and
returns a judgement.

Advisors are grouped into themes, one file per theme. Full implementation details live in
`advisors/technical.md`, `advisors/strategic.md`, `advisors/wisdom.md`,
`advisors/creative.md`, `advisors/human.md`, `advisors/domain.md`, `advisors/epistemic.md`,
`advisors/futurist.md`, `advisors/pedagogical.md`, and `advisors/applied.md`. The canonical
roster, keyword maps, and polarity pairs live in
[`../settings/decision-council.config.json`](../settings/decision-council.config.json).

The retrieval counterpart to advisors is documented in [researchers.md](researchers.md);
running the two together is covered in [chaining.md](chaining.md).

---

## Technical Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **architect** | Formal structure, abstraction boundaries | Extract skeleton, find abstraction level, check properties | Well-solved problem classes hidden beneath messy surfaces | Practical constraints; elegant but unmaintainable |
| **deriver** | First-principles reconstruction | Observe, derive from basics, explain simply, test | Cargo-cult practices; jargon hiding confusion | Systemic patterns at higher abstraction |
| **shipper** | Pragmatic engineering | What works, maintenance cost, boring solution | Over-engineering; design vs maintainability gap | Genuinely important abstractions |
| **model-whisperer** | ML/AI capability assessment | Characterize, assess frontier, training dynamics, build-vs-prompt | Actual model behavior vs marketing | Making everything an ML problem |
| **frontier-scout** | Scaling dynamics, AI safety | Scaling assessment, capability-safety frontier, generalization | Phase transitions; emergent risks | Present tractable problems |
| **systems-mapper** | Feedback loops, leverage points | Map stocks/flows, identify loops, find leverage, check consequences | Systemic behavior behind isolated events | Over-systematizing simple problems |

---

## Strategic Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **strategist** | Adversarial terrain reading | Read terrain, assess position, find decisive point | Competitive dynamics; 2nd/3rd-order consequences | Over-indexing on adversarial thinking |
| **realist** | Incentive mapping, power dynamics | Map incentives, identify real decision-makers, read behavior | Solutions that fail because no adoption incentive | Genuine cooperation exists |
| **timer** | Strategic timing, momentum | Read rhythm, assess timing, find decisive strike | Anxiety-driven action; wise delay | Timing as excuse for inaction |
| **inverter** | Multi-model inversion | Invert, cycle 3-4 mental models, opportunity cost | Cross-domain patterns; hidden opportunity costs | Novel situations resisting known models |
| **tail-watcher** | Tail risk, antifragile design | Classify domain, assess fragility, via negativa, barbell | Hidden tail risk; false stability | Paralysis; most decisions are Mediocristan |
| **taxonomist** | Classification, category errors | Define terms, identify genus, find differentia, four causes | Category errors; false equivalences | Over-classification of novel problems |

---

## Wisdom Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **questioner** | Assumption destruction | Identify assumptions, test by contradiction, force precision | Load-bearing unexamined assumptions | Paralysis from questioning everything |
| **subtractor** | Via negativa, minimum intervention | Ask if real, check intervention damage, subtract first | Over-engineering; patch-upon-patch | Genuine need for intervention |
| **reframer** | Frame dissolution, perspective shift | Question frame, find false dichotomy, shift scale | The frame itself; manufactured urgency | Real fires need action, not reframing |
| **stoic** | Control boundaries, moral clarity | Separate control/acceptance, strip inflation, identify duty | Sunk-cost reasoning; panic decisions | Under-weighting strategy and timing |
| **bias-hunter** | Cognitive bias detection | Identify heuristic, name bias, pre-mortem, reference class | Decision-maker cognition as first error | Over-diagnosing bias in valid expertise |
| **user-advocate** | User-centered evaluation | Identify user/task, evaluate honesty, check complexity | End-user experience others miss | Formal correctness; competitive positioning |

---

## Creative Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **ideator** | Divergent idea generation | Suspend judgment, vary axis, cross-pollinate, push to absurdity | Unexplored possibility space | Overwhelming with options when action is needed |
| **synthesizer** | Cross-domain pattern integration | Identify deep structure, find shared skeleton, fuse structurally | Hidden unity beneath disparate ideas | Forcing false connections |
| **narrator** | Story structure and meaning-making | Identify story, check coherence, find audience, test against reality | Implicit narrative beneath every strategy | Prioritizing tellability over accuracy |
| **provocateur** | Creative destruction | Identify sacred cows, attack foundation, propose heresy | Unquestioned assumptions constraining thinking | Destruction without superior alternative |
| **aesthete** | Form-function harmony | Assess proportionality, check consistency, evaluate compression | Design coherence and structural elegance | Confusing taste with objective quality |
| **analogist** | Structural analogy and transfer | Identify relational structure, map systematically, test limits | Deep structural parallels across domains | Seductive but broken analogies |

---

## Human Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **empath** | Emotional landscape mapping | Read subtext, map stakes, identify needs, check safety | Emotional infrastructure beneath decisions | Over-prioritizing harmony |
| **culture-reader** | Organizational culture decoding | Read incentives, map power, identify tribes, predict response | Invisible operating system of organizations | Cultural fatalism |
| **negotiator** | Interest discovery and value creation | Separate positions/interests, map BATNA, find trades | Hidden positive-sum structures | Forcing win-win on zero-sum |
| **motivator** | Motivation architecture | Diagnose gap, map drivers, design choice architecture | Gap between intention and action | Treating people as behavioral machines |
| **devil's-advocate** | Systematic stress-testing | Steel-man opposition, find weakest link, pre-mortem | Failure modes consensus suppresses | Paralyzing action with perpetual opposition |
| **historian** | Historical pattern recognition | Find precedent, extract pattern, map outcome distribution | Recurring patterns others think are unique | Over-reliance when "this time is different" |

---

## Domain Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **financier** | Quantitative modeling | Quantify value, model cash flows, price optionality, stress-test | Quantitative structure beneath qualitative decisions | Mistaking precision for accuracy |
| **legalist** | Regulatory analysis | Map landscape, assess compliance, map liability, find safe harbor | Regulatory constraints others dismiss | Over-conservative blocking of innovation |
| **scientist** | Hypothesis testing | State hypothesis, grade evidence, hunt confounders, design test | Gap between "we believe" and "we know" | Paralyzing action with evidence demands |
| **operator** | Resource orchestration | Map dependencies, find bottleneck, check resources, plan failures | Execution reality beneath strategy | Operational conservatism blocking growth |
| **diplomat** | Stakeholder alignment | Map stakeholders, assess power, find coalition, sequence comms | Political landscape around decisions | Stakeholder appeasement diluting boldness |
| **data-analyst** | Statistical inference | Assess quality, describe before inferring, quantify uncertainty | Signal within noise, noise disguised as signal | Data paralysis when judgment suffices |

---

## Epistemic Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **epistemologist** | Knowledge boundary mapping | Classify knowledge type, assess access, check category errors | Invisible assumptions beneath claims to knowledge | Epistemic perfectionism paralyzing action |
| **source-critic** | Information provenance analysis | Trace provenance, assess access, map incentives, check corroboration | Information supply chain distortions | Over-scrutiny rejecting all imperfect sources |
| **bayesian** | Probabilistic belief updating | Establish prior, assess likelihood ratio, update proportionally | Gap between how people update vs how they should | Reducing qualitative decisions to false precision |
| **red-teamer** | Adversarial simulation | Define threat model, map attack surface, simulate attack path | Attacker's perspective on cooperative designs | Creating paranoia without real threat |
| **calibrator** | Meta-cognitive calibration | Assess confidence, check reference class, quantify planning fallacy | Systematic gap between confidence and reality | Backward-looking when novel situations arise |
| **integrator** | Evidence integration | Inventory evidence, map contradictions, weight by quality | Coherent picture from messy contradictory evidence | Forcing false coherence on genuine uncertainty |

---

## Futurist Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **futurist** | Trend trajectory analysis | Identify forces, extrapolate trajectories, find inflection points | Forces in motion that reshape the decision landscape | Seductive trend lines that miss disruptions and reversals |
| **scenario-planner** | Parallel future simulation | Identify uncertainties, construct matrix, test decisions across scenarios | Fragility of single-future planning | Excuse for inaction through endless hedging |
| **pattern-hunter** | Weak signal detection | Scan periphery, identify recurrence, trace propagation, assess strength | Future arriving unevenly at the edges | Apophenia — seeing patterns in noise |
| **complexity-navigator** | Complex systems reasoning | Classify system, map feedback, identify emergence, find leverage | Difference between complicated and genuinely complex | Over-labeling things as complex when they're solvable |
| **resilience-architect** | Antifragile design | Assess volatility, find fragilities, design optionality, stress-test | Hidden fragility in optimized systems | Over-investing in resilience for stable environments |
| **horizon-scanner** | Systematic peripheral vision | Define boundary, scan adjacent, check wild cards, assess reframe risk | What's outside the frame that could redefine the problem | Creating anxiety about distant possibilities |

---

## Pedagogical Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **teacher** | Instructional design | Identify objectives, structure lessons, design transfer activities | Making complex knowledge accessible and actionable | Over-structuring discovery that benefits from productive confusion |
| **simplifier** | Complexity reduction | Find core concept, strip layers, test comprehension, rebuild minimally | Cutting through jargon to find what actually matters | Oversimplification that loses critical nuance |
| **curriculum-designer** | Learning path architecture | Map prerequisites, sequence progression, design scaffolding | Optimal ordering of learning for retention and transfer | Over-engineering paths when exploration would teach faster |
| **assessor** | Understanding verification | Design checks, evaluate responses, identify gaps, prescribe remediation | Catching misunderstandings before they compound | Testing recall instead of genuine understanding |
| **coach** | Guided discovery | Ask revealing questions, provide calibrated hints, design practice | Helping people learn to think rather than what to think | Withholding direct answers when urgency demands them |
| **translator** | Audience adaptation | Identify audience model, map concepts to their frame, verify transfer | Bridging expert knowledge to non-expert audiences | Patronizing experts by over-simplifying or losing precision |

---

## Applied Advisors

| Advisor | Core Function | Method | Key Strength | Key Blind Spot |
|---------|----------|-------------|--------|------|
| **product-designer** | User-centered physical design | Research users, define constraints, prototype, test, iterate | Balancing user needs with manufacturing reality | Over-indexing on user delight vs engineering feasibility |
| **spatial-thinker** | Dimensional reasoning | Visualize spaces, model layouts, test arrangements, optimize flow | Seeing physical relationships others miss | Neglecting non-spatial constraints (cost, time, social) |
| **maker** | Prototype iteration | Build fast, test real, learn from failures, iterate in material | Learning through doing rather than theorizing | Premature building before problem is understood |
| **sustainability-engineer** | Lifecycle analysis | Map full lifecycle, identify impacts, find circular opportunities | Revealing hidden environmental costs of decisions | Analysis paralysis from lifecycle complexity |
| **supply-chain-analyst** | Flow optimization | Map flows, identify bottlenecks, model scenarios, optimize | Seeing system-wide effects of local changes | Over-optimizing for efficiency at the cost of resilience |
| **ergonomist** | Human-system fit | Analyze interactions, measure fit, design for human capability | Catching human-factors failures before deployment | Over-constraining design for average users |

---

## Profiles

A profile is a named panel — a preselected set of advisors tuned for a decision domain.
When you name a profile, those advisors convene; when you don't, the orchestrator
auto-selects (see below). The canonical profile definitions live in
[`../settings/decision-council.config.json`](../settings/decision-council.config.json); the
summaries below explain the intent and the natural tensions inside each panel.

### engineering

**Advisors:** architect · deriver · shipper · systems-mapper · inverter · user-advocate

**Best for:** Technical architecture, code design, infrastructure decisions, build vs buy (technical), API design, migration decisions.

**Why these advisors:** Covers formal structure (architect), ground truth (deriver), shipping reality (shipper), systemic effects (systems-mapper), failure avoidance (inverter), and developer experience (user-advocate). Natural tensions: architect vs shipper (elegance vs pragmatism), deriver vs systems-mapper (reductionist vs holistic).

---

### strategy

**Advisors:** strategist · realist · inverter · timer · tail-watcher · systems-mapper

**Best for:** Market positioning, competitive moves, organizational decisions, pricing, partnerships, market entry.

**Why these advisors:** Covers competitive terrain (strategist), incentive reality (realist), failure modes (inverter), timing (timer), downside exposure (tail-watcher), and systemic dynamics (systems-mapper). Natural tensions: strategist vs timer (act now vs wait), realist vs tail-watcher (expected case vs extreme case).

---

### product

**Advisors:** user-advocate · shipper · realist · bias-hunter · reframer · deriver

**Best for:** Feature prioritization, product direction, UX decisions, roadmap tradeoffs, pricing models, launch strategy.

**Why these advisors:** Covers user needs (user-advocate), shipping constraints (shipper), stakeholder dynamics (realist), decision biases (bias-hunter), reframing (reframer), and first principles (deriver). Natural tensions: user-advocate vs shipper (perfect UX vs ship now), bias-hunter vs realist (cognitive traps vs political reality).

---

### risk

**Advisors:** tail-watcher · bias-hunter · inverter · systems-mapper · stoic · strategist

**Best for:** High-stakes go/no-go decisions, investment decisions, irreversible actions, security decisions, compliance questions.

**Why these advisors:** Covers tail risk (tail-watcher), cognitive biases (bias-hunter), failure inversion (inverter), systemic exposure (systems-mapper), moral clarity (stoic), and adversarial dynamics (strategist). Natural tensions: tail-watcher vs strategist (caution vs opportunity), stoic vs bias-hunter (duty vs rationality).

---

### ai-ml

**Advisors:** model-whisperer · frontier-scout · architect · deriver · tail-watcher · shipper

**Best for:** AI/ML product decisions, model selection, capability assessment, safety evaluation, build-vs-prompt-vs-fine-tune.

**Why these advisors:** Covers current capabilities (model-whisperer), scaling trajectory (frontier-scout), formal boundaries (architect), first principles (deriver), risk exposure (tail-watcher), and shipping pragmatism (shipper). Natural tensions: frontier-scout vs shipper (long-term safety vs ship now), model-whisperer vs architect (empirical vs formal).

---

### innovation

**Advisors:** questioner · subtractor · reframer · taxonomist · deriver · inverter

**Best for:** Exploring new spaces, challenging assumptions, zero-to-one decisions, "should we build this at all?" questions.

**Why these advisors:** Covers assumption destruction (questioner), subtraction (subtractor), reframing (reframer), classification (taxonomist), first principles (deriver), and inversion (inverter). Natural tensions: questioner vs taxonomist (destroy categories vs build them), subtractor vs deriver (do nothing vs derive from scratch).

---

### creative

**Advisors:** ideator · synthesizer · narrator · provocateur · aesthete · analogist

**Best for:** Brainstorming, naming, brand strategy, creative direction, narrative design, product storytelling, design critique, cross-domain ideation.

**Why these advisors:** Covers divergent generation (ideator), structural fusion (synthesizer), narrative coherence (narrator), sacred-cow destruction (provocateur), form-function elegance (aesthete), and cross-domain transfer (analogist). Natural tensions: ideator vs subtractor (generate vs eliminate), provocateur vs stoic (destroy vs accept), aesthete vs shipper (elegance vs pragmatism).

---

### people

**Advisors:** empath · culture-reader · negotiator · motivator · devil's-advocate · historian

**Best for:** Hiring decisions, team dynamics, conflict resolution, organizational change, people management, stakeholder alignment, motivation design.

**Why these advisors:** Covers emotional intelligence (empath), organizational dynamics (culture-reader), interest-based bargaining (negotiator), behavioral activation (motivator), systematic opposition (devil's-advocate), and historical precedent (historian). Natural tensions: empath vs architect (feelings vs structure), culture-reader vs shipper (readiness vs speed), devil's-advocate vs narrator (opposition vs story).

---

### finance

**Advisors:** financier · data-analyst · strategist · tail-watcher · realist

**Best for:** Investment decisions, pricing strategy, capital allocation, economic modeling, ROI analysis.

**Why these advisors:** Covers quantitative modeling (financier), data rigor (data-analyst), competitive positioning (strategist), downside protection (tail-watcher), and political realism (realist). Natural tensions: financier vs stoic (profit vs duty), tail-watcher vs strategist (caution vs aggression).

---

### legal

**Advisors:** legalist · stoic · bias-hunter · historian · diplomat

**Best for:** Contracts, compliance, regulatory navigation, liability assessment, legal strategy.

**Why these advisors:** Covers regulatory analysis (legalist), moral clarity (stoic), cognitive bias (bias-hunter), precedent (historian), and stakeholder management (diplomat). Natural tensions: legalist vs shipper (compliance vs speed), stoic vs strategist (principle vs pragmatism).

---

### science

**Advisors:** scientist · data-analyst · deriver · devil's-advocate · frontier-scout

**Best for:** Research direction, hypothesis testing, evidence evaluation, experimental design, scientific rigor.

**Why these advisors:** Covers hypothesis testing (scientist), statistical inference (data-analyst), first principles (deriver), adversarial testing (devil's-advocate), and frontier awareness (frontier-scout). Natural tensions: scientist vs narrator (evidence vs story), devil's-advocate vs narrator (opposition vs coherence).

---

### operations

**Advisors:** operator · systems-mapper · shipper · timer · diplomat

**Best for:** Execution planning, resource allocation, logistics, process optimization, delivery.

**Why these advisors:** Covers resource orchestration (operator), feedback loops (systems-mapper), pragmatic shipping (shipper), timing (timer), and stakeholder alignment (diplomat). Natural tensions: operator vs architect (execution vs elegance), shipper vs timer (now vs right moment).

---

### truth

**Advisors:** epistemologist · source-critic · bayesian · bias-hunter · integrator

**Best for:** Fact-checking, evidence evaluation, claim verification, resolving contradictory information, epistemic hygiene.

**Why these advisors:** Covers knowledge foundations (epistemologist), information provenance (source-critic), belief updating (bayesian), cognitive bias (bias-hunter), and evidence integration (integrator). Natural tensions: epistemologist vs shipper (certainty vs action), source-critic vs narrator (scrutiny vs story).

---

### research

**Advisors:** scientist · bayesian · source-critic · calibrator · data-analyst

**Best for:** Research direction, methodology review, evidence synthesis, hypothesis evaluation, academic rigor.

**Why these advisors:** Covers hypothesis testing (scientist), probabilistic reasoning (bayesian), source quality (source-critic), confidence calibration (calibrator), and statistical inference (data-analyst). Natural tensions: scientist vs narrator (evidence vs story), calibrator vs ideator (calibration vs optimism).

---

### future

**Advisors:** futurist · scenario-planner · pattern-hunter · complexity-navigator · resilience-architect · horizon-scanner

**Best for:** Long-term bets, trend analysis, scenario planning, emerging patterns, resilience strategy, technology trajectories.

**Why these advisors:** Covers trend extrapolation (futurist), multi-path testing (scenario-planner), weak signal detection (pattern-hunter), complex systems (complexity-navigator), antifragile design (resilience-architect), and peripheral vision (horizon-scanner). Natural tensions: futurist vs realist (trajectory vs present constraints), scenario-planner vs deriver (multiple futures vs one answer).

---

### learning

**Advisors:** teacher · simplifier · curriculum-designer · assessor · coach · translator

**Best for:** Teaching complex topics, explaining technology, creating documentation, onboarding design, training programs, knowledge transfer, accessibility improvements.

**Why these advisors:** Covers instructional design (teacher), complexity reduction (simplifier), learning sequencing (curriculum-designer), comprehension verification (assessor), guided discovery (coach), and audience bridging (translator). Natural tensions: teacher vs simplifier (structure vs reduction), assessor vs coach (testing vs discovery), curriculum-designer vs translator (optimal path vs audience adaptation).

---

### sustainability

**Advisors:** sustainability-engineer · supply-chain-analyst · systems-mapper · futurist · operator · scientist

**Best for:** Environmental impact decisions, circular economy design, lifecycle analysis, sustainable product development, carbon reduction strategy, ESG evaluation.

**Why these advisors:** Covers lifecycle analysis (sustainability-engineer), flow optimization (supply-chain-analyst), systemic feedback (systems-mapper), long-term trajectory (futurist), execution reality (operator), and evidence rigor (scientist). Natural tensions: sustainability-engineer vs operator (ideal vs feasible), futurist vs scientist (trajectory vs evidence), supply-chain-analyst vs systems-mapper (efficiency vs resilience).

---

### hardware

**Advisors:** product-designer · spatial-thinker · maker · ergonomist · shipper · deriver

**Best for:** Physical product decisions, manufacturing tradeoffs, prototype strategy, spatial design, human-factors evaluation, hardware engineering.

**Why these advisors:** Covers user-centered design (product-designer), dimensional reasoning (spatial-thinker), prototype iteration (maker), human-system fit (ergonomist), shipping pragmatism (shipper), and first principles (deriver). Natural tensions: product-designer vs maker (design vs build), ergonomist vs shipper (human fit vs ship now), spatial-thinker vs deriver (spatial intuition vs analytical derivation).

---

### crisis

**Advisors:** empath · strategist · red-teamer · operator · diplomat

**Best for:** Incident response, crisis communications, high-pressure decision-making, damage control, stakeholder management under pressure.

**Why these advisors:** Covers emotional intelligence (empath), strategic positioning (strategist), adversarial thinking (red-teamer), execution under pressure (operator), and stakeholder alignment (diplomat). Natural tensions: empath vs strategist (people-first vs outcome-first), red-teamer vs diplomat (expose vulnerability vs manage perception), operator vs empath (speed vs care).

---

### startup

**Advisors:** ideator · financier · shipper · scenario-planner · user-advocate

**Best for:** Early-stage decisions, product-market fit, pivot evaluation, fundraising strategy, MVP scoping, resource allocation with limited runway.

**Why these advisors:** Covers creative generation (ideator), financial modeling (financier), shipping pragmatism (shipper), future planning (scenario-planner), and user focus (user-advocate). Natural tensions: ideator vs shipper (possibilities vs pragmatism), financier vs user-advocate (unit economics vs user delight), scenario-planner vs shipper (planning vs execution).

---

### governance

**Advisors:** epistemologist · legalist · historian · diplomat · culture-reader

**Best for:** Policy design, organizational governance, institutional decision-making, compliance frameworks, rule-setting, constitutional questions.

**Why these advisors:** Covers knowledge foundations (epistemologist), regulatory analysis (legalist), historical precedent (historian), stakeholder alignment (diplomat), and organizational dynamics (culture-reader). Natural tensions: legalist vs culture-reader (rules vs norms), epistemologist vs diplomat (truth vs consensus), historian vs legalist (precedent vs statute).

---

### Auto-Selection Logic

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

Top advisors selected: architect, systems-mapper, deriver, shipper, inverter, tail-watcher + [challenger]
```

The **challenger guarantee** ensures at least one of (questioner, subtractor, reframer) is always included — even if their keyword score is low. This prevents echo chambers.

---

### Custom Profiles

Users can specify exact advisors:

```
council this with architect, tail-watcher, realist, shipper, questioner: [question]
```

Or create persistent custom profiles by editing
[`../settings/decision-council.config.json`](../settings/decision-council.config.json):

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

### Meta-Governance Panel (not a profile)

Meta-governance is a **mode**, not a profile. Triggered with `council meta: ...`, it does
not auto-select or accept a profile — it always convenes a fixed panel:
**epistemologist, calibrator, questioner, architect, historian** (domain-weight:
epistemologist). It deliberates on the council's own rules, applies a **>80% supermajority**
gate, and is **advisory-only** (logs proposals to `governance-log.json`; the user applies
changes). See the Meta-Governance section of `../council-of-minds.md`.

---

### Profile Selection Tips

| If your question involves... | Use profile |
|------------------------------|-------------|
| Code, architecture, systems | `engineering` |
| Market, competition, positioning | `strategy` |
| Users, features, roadmap | `product` |
| High stakes, irreversible, security | `risk` |
| AI/ML, models, training, prompting | `ai-ml` |
| "Should we even do this?", challenging assumptions | `innovation` |
| Brainstorming, naming, brand, design critique | `creative` |
| Hiring, teams, conflict, people management | `people` |
| Investment, pricing, capital allocation | `finance` |
| Contracts, compliance, liability | `legal` |
| Research, hypothesis, experimental design | `science` |
| Execution, logistics, process, delivery | `operations` |
| Fact-checking, claim verification, epistemic hygiene | `truth` |
| Methodology review, evidence synthesis, academic rigor | `research` |
| Future trends, long-term bets, scenario planning | `future` |
| Teaching, explaining, documentation, onboarding | `learning` |
| Environmental impact, lifecycle, circular economy | `sustainability` |
| Physical products, manufacturing, spatial design | `hardware` |
| Incident response, crisis comms, high-pressure | `crisis` |
| Early-stage, PMF, pivots, fundraising | `startup` |
| Policy, org governance, institutional rules | `governance` |
| Uncertain — multiple domains | `council this:` (auto-select) |

---

## Custom Advisors

Beyond the built-in advisors, you can define your own in `advisors/custom/<name>.md`
from the cast-agnostic scaffold at `advisors/custom/_template.md`. See
`advisors/custom/README.md` for the full authoring guide.

- Scaffold + validate with the CLI: `council advisor create <name>`,
  `council advisor validate <name>`, `council advisor list`.
- A custom advisor must carry the same header fields (Cast, Reasoning Method, Polarity
  Pairs, Evidence Type) and required sections as a built-in advisor, and name two existing
  polarity partners.
- Once valid, it joins the pool: eligible for auto-selection (via any `autoSelectKeywords`
  you add) and any profile, under the same panel-size, dissent-quota, and
  evidence-diversity guarantees.
- The `Cast` field (`advisor` | `researcher`) keeps the scaffold shared with the
  researcher Minds — see [researchers.md](researchers.md).

---

## Grounding Protocols (Summary)

Every advisor has constraints that prevent drift into generic advice:

| Advisor | Key Constraint |
|---------|---------------|
| architect | Max 1 notation system; say "resists formalization" when appropriate |
| deriver | Nothing is "obvious" — show work; max 2 analogies |
| shipper | Check if complexity is essential or accidental |
| model-whisperer | Ground in observed behavior, not vibes |
| frontier-scout | Reference specific behaviors; distinguish research from deployment risk |
| systems-mapper | Specify causal chains explicitly; max 2 diagrams |
| strategist | Verify adversary exists; max 3 actors |
| realist | Most misalignment is laziness, not plotting |
| timer | Ground in specifics, not philosophy |
| inverter | Always invert FIRST; max 4 models |
| tail-watcher | Name specific downside scenarios; check domain |
| taxonomist | Max 4 taxonomy levels; max 3 definitions |
| questioner | 3-level depth limit then MUST state position |
| subtractor | Must suggest at least one concrete action |
| reframer | Reframing must lead to observable action difference |
| stoic | Ground in specifics ("reduce scope" not "be resilient") |
| bias-hunter | Name SPECIFIC biases; max 3 per analysis |
| user-advocate | Specify WHO the user is; ground in interaction moments |
| ideator | Must generate 7+ ideas before converging; max 3 "what if" chains |
| synthesizer | Synthesis must be one sentence; max 2 domain bridges |
| narrator | Max 1 extended metaphor; say "narrative is not the right lens" when appropriate |
| provocateur | Max 2 sacred cows per analysis; depth over breadth |
| aesthete | Must find structural reason behind "feels wrong"; max 1 design reference |
| analogist | Must specify 3+ corresponding relationships; abandon if breaks in 2+ critical places |
| empath | Name SPECIFIC emotions and their SPECIFIC sources; max 2 explorations |
| culture-reader | Cite specific behaviors/rituals as evidence; max 1 cultural theory |
| negotiator | Check for irrational = unfound interests; max 2 BATNA analyses |
| motivator | "Should want to" is not design; max 2 behavioral frameworks |
| devil's-advocate | Must genuinely try to convince; max 3 attack vectors |
| historian | Cite specific cases with dates/actors/outcomes; max 3 precedents |
| financier | Must include numbers/ranges; max 2 financial models |
| legalist | Must reference specific regulations/statutes; max 2 jurisdictions |
| scientist | Must address confounders for causal claims; max 1 statistical framework |
| operator | Must reference specific resources (people, dates, dollars); max 1 dependency diagram |
| diplomat | Must name specific stakeholders with interests; max 6 stakeholders |
| data-analyst | Must include sample size, time period, source; max 2 statistical techniques |
| epistemologist | Must specify WHY something can't be known; max 1 philosophical framework |
| source-critic | Must name specific sources and incentive structures; max 3 sources |
| bayesian | Must use explicit probabilities (numbers, not words); max 2 likelihood ratios |
| red-teamer | Must specify threat model (who, what resources); max 3 attack vectors |
| calibrator | Must reference specific comparison class; max 2 reference class comparisons |
| integrator | Must name specific sources with weights; max 4 sources integrated |
| futurist | Must cite specific observable signal for every trend claim; max 3 driving forces |
| scenario-planner | Every scenario must be internally consistent; max 4 scenarios per analysis |
| pattern-hunter | Must cite 2+ independent instances per pattern; max 3 patterns |
| complexity-navigator | Must classify system (simple/complicated/complex/chaotic) with evidence; max 2 feedback loops |
| resilience-architect | Must specify WHAT protected against and at WHAT COST; max 3 fragilities |
| horizon-scanner | Must specify domain and transmission mechanism; max 3 adjacent developments |
| teacher | Must state specific learning objective; max 1 pedagogical framework per analysis |
| simplifier | Must preserve minimum viable accuracy; max 2 abstraction layers removed |
| curriculum-designer | Must specify prerequisites and sequence rationale; max 5 steps per path |
| assessor | Must distinguish recall from understanding; max 2 assessment types |
| coach | Must ask before telling; max 3 guiding questions before direct answer |
| translator | Must name specific audience and their existing mental model; max 1 extended metaphor |
| product-designer | Must reference specific user research or constraints; max 2 personas |
| spatial-thinker | Must specify dimensions and scale; max 1 spatial diagram |
| maker | Must specify material and iteration count; max 3 prototypes before convergence |
| sustainability-engineer | Must quantify environmental impact with units; max 2 lifecycle stages per analysis |
| supply-chain-analyst | Must specify flow direction and bottleneck location; max 3 nodes per analysis |
| ergonomist | Must reference specific human capability limits; max 2 anthropometric standards |
