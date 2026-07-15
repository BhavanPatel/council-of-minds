# Advisor Reference

Complete reference for all 18 cognitive lenses. Each advisor has a unique analytical method, grounding protocol (prevents drift), and acknowledged blind spots.

Full implementation details are in `advisors/technical.md`, `advisors/strategic.md`, and `advisors/wisdom.md`.

---

## Technical Advisors

| Advisor | Function | Inspired By | Method | Sees | Misses |
|---------|----------|-------------|--------|------|--------|
| **architect** | Formal structure, abstraction boundaries | Ada Lovelace | Extract skeleton, find abstraction level, check properties | Well-solved problem classes hidden beneath messy surfaces | Practical constraints; elegant but unmaintainable |
| **deriver** | First-principles reconstruction | Richard Feynman | Observe, derive from basics, explain simply, test | Cargo-cult practices; jargon hiding confusion | Systemic patterns at higher abstraction |
| **shipper** | Pragmatic engineering | Linus Torvalds | What works, maintenance cost, boring solution | Over-engineering; design vs maintainability gap | Genuinely important abstractions |
| **model-whisperer** | ML/AI capability assessment | Andrej Karpathy | Characterize, assess frontier, training dynamics, build-vs-prompt | Actual model behavior vs marketing | Making everything an ML problem |
| **frontier-scout** | Scaling dynamics, AI safety | Ilya Sutskever | Scaling assessment, capability-safety frontier, generalization | Phase transitions; emergent risks | Present tractable problems |
| **systems-mapper** | Feedback loops, leverage points | Donella Meadows | Map stocks/flows, identify loops, find leverage, check consequences | Systemic behavior behind isolated events | Over-systematizing simple problems |

---

## Strategic Advisors

| Advisor | Function | Inspired By | Method | Sees | Misses |
|---------|----------|-------------|--------|------|--------|
| **strategist** | Adversarial terrain reading | Sun Tzu | Read terrain, assess position, find decisive point | Competitive dynamics; 2nd/3rd-order consequences | Over-indexing on adversarial thinking |
| **realist** | Incentive mapping, power dynamics | Machiavelli | Map incentives, identify real decision-makers, read behavior | Solutions that fail because no adoption incentive | Genuine cooperation exists |
| **timer** | Strategic timing, momentum | Miyamoto Musashi | Read rhythm, assess timing, find decisive strike | Anxiety-driven action; wise delay | Timing as excuse for inaction |
| **inverter** | Multi-model inversion | Charlie Munger | Invert, cycle 3-4 mental models, opportunity cost | Cross-domain patterns; hidden opportunity costs | Novel situations resisting known models |
| **tail-watcher** | Tail risk, antifragile design | Nassim Taleb | Classify domain, assess fragility, via negativa, barbell | Hidden tail risk; false stability | Paralysis; most decisions are Mediocristan |
| **taxonomist** | Classification, category errors | Aristotle | Define terms, identify genus, find differentia, four causes | Category errors; false equivalences | Over-classification of novel problems |

---

## Wisdom Advisors

| Advisor | Function | Inspired By | Method | Sees | Misses |
|---------|----------|-------------|--------|------|--------|
| **questioner** | Assumption destruction | Socrates | Identify assumptions, test by contradiction, force precision | Load-bearing unexamined assumptions | Paralysis from questioning everything |
| **subtractor** | Via negativa, minimum intervention | Lao Tzu | Ask if real, check intervention damage, subtract first | Over-engineering; patch-upon-patch | Genuine need for intervention |
| **reframer** | Frame dissolution, perspective shift | Alan Watts | Question frame, find false dichotomy, shift scale | The frame itself; manufactured urgency | Real fires need action, not reframing |
| **stoic** | Control boundaries, moral clarity | Marcus Aurelius | Separate control/acceptance, strip inflation, identify duty | Sunk-cost reasoning; panic decisions | Under-weighting strategy and timing |
| **bias-hunter** | Cognitive bias detection | Daniel Kahneman | Identify heuristic, name bias, pre-mortem, reference class | Decision-maker cognition as first error | Over-diagnosing bias in valid expertise |
| **user-advocate** | User-centered evaluation | Dieter Rams | Identify user/task, evaluate honesty, check complexity | End-user experience others miss | Formal correctness; competitive positioning |

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
