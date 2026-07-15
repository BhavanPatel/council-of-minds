# Council of Minds

A multi-advisor deliberation agent that runs decisions through 5-7 specialized cognitive lenses, anonymized peer review, and chairman synthesis to produce actionable verdicts with confidence scoring and dissent preservation.

Combines the best of:
- **Karpathy's LLM Council** (via [aiwithremy](https://github.com/aiwithremy/claude-skills-llm-council)) — anonymized peer review, chairman synthesis
- **Council of High Intelligence** ([0xNyk](https://github.com/0xNyk/council-of-high-intelligence)) — deep persona-driven reasoning, grounding protocols, polarity pairs
- **Original enhancements** — profile-based advisor selection, confidence scoring, dissent preservation, follow-up drilldowns

## Structure

```
council-of-minds/
├── council-of-minds.json           # Agent config
├── council-of-minds.md             # Main orchestrator prompt
├── advisors/
│   ├── technical.md                # architect, deriver, shipper, model-whisperer, frontier-scout, systems-mapper
│   ├── strategic.md                # strategist, realist, timer, inverter, tail-watcher, taxonomist
│   └── wisdom.md                   # questioner, subtractor, reframer, stoic, bias-hunter, user-advocate
├── settings/
│   ├── council-of-minds.config.json  # Profiles, keywords, settings
│   └── council-of-minds.meta.json    # Agent metadata
└── README.md                       # This file
```

## Installation (Global — Available in All Workspaces)

### Option 1: Manual Install

Copy the agent files to your global Kiro directory:

```bash
# Create the target directory
mkdir -p ~/.kiro/agents/council-of-minds

# Copy all files
cp -r /Users/Bhavan.Patel/projects/ai/bhavanpatel/agents/council-of-minds/* ~/.kiro/agents/council-of-minds/

# Copy config to settings
mkdir -p ~/.kiro/settings
cp /Users/Bhavan.Patel/projects/ai/bhavanpatel/agents/council-of-minds/settings/council-of-minds.config.json ~/.kiro/settings/
```

### Option 2: Symlink (Development — Changes Sync Automatically)

```bash
# Symlink the agent
ln -sf /Users/Bhavan.Patel/projects/ai/bhavanpatel/agents/council-of-minds ~/.kiro/agents/council-of-minds

# Symlink the config
ln -sf /Users/Bhavan.Patel/projects/ai/bhavanpatel/agents/council-of-minds/settings/council-of-minds.config.json ~/.kiro/settings/council-of-minds.config.json
```

### Option 3: Workspace-Level Install

For a specific project only:

```bash
# From your project root
mkdir -p .kiro/agents
cp -r /Users/Bhavan.Patel/projects/ai/bhavanpatel/agents/council-of-minds .kiro/agents/

# Copy config
mkdir -p .kiro/settings
cp /Users/Bhavan.Patel/projects/ai/bhavanpatel/agents/council-of-minds/settings/council-of-minds.config.json .kiro/settings/
```

### Verify Installation

After installing, start a new Kiro session and say:

```
council this: should I use a monorepo or polyrepo for my new platform?
```

If the council activates and presents a verdict, installation is successful.

## Usage

### Trigger Phrases

| Phrase | Effect |
|--------|--------|
| `council this: [question]` | Run with auto-selected profile |
| `engineering council: [question]` | Force engineering profile |
| `strategy council: [question]` | Force strategy profile |
| `product council: [question]` | Force product profile |
| `risk council: [question]` | Force risk profile |
| `ai council: [question]` | Force AI/ML profile |
| `innovation council: [question]` | Force innovation profile |
| `war room this: [question]` | Same as "council this" |
| `pressure-test this: [question]` | Same as "council this" |

### Council Profiles

| Profile | Advisors | Best For |
|---------|----------|----------|
| **engineering** | architect, deriver, shipper, systems-mapper, inverter, user-advocate | Architecture, code design, infra |
| **strategy** | strategist, realist, inverter, timer, tail-watcher, systems-mapper | Market, competition, positioning |
| **product** | user-advocate, shipper, realist, bias-hunter, reframer, deriver | Features, UX, direction |
| **risk** | tail-watcher, bias-hunter, inverter, systems-mapper, stoic, strategist | High-stakes, go/no-go |
| **ai-ml** | model-whisperer, frontier-scout, architect, deriver, tail-watcher, shipper | AI products, model choices |
| **innovation** | questioner, subtractor, reframer, taxonomist, deriver, inverter | New spaces, assumptions |

### Follow-Up Commands

After receiving a verdict:

- `expand on the inverter's point` — deep dive into one advisor
- `challenge the verdict with [new info]` — re-synthesize with additional context
- `weight toward risk` — re-synthesize emphasizing risk perspective
- `re-run with strategy profile` — fresh council with different composition
- `save transcript` — save full session to file

### Custom Council

Pick specific advisors:

```
council this with architect, tail-watcher, realist, shipper, questioner: [question]
```

## The 18 Advisors

### Technical (advisors/technical.md)

| Advisor | Cognitive Function |
|---------|-------------------|
| **architect** | Formal structure, abstraction boundaries, what can/cannot be mechanized |
| **deriver** | First-principles reconstruction, jargon destruction, simplest explanation |
| **shipper** | Pragmatic engineering, over-engineering detection, maintenance cost |
| **model-whisperer** | ML capability frontiers, training dynamics, build-vs-prompt |
| **frontier-scout** | Scaling dynamics, phase transitions, capability-safety boundary |
| **systems-mapper** | Feedback loops, leverage points, unintended consequences |

### Strategic (advisors/strategic.md)

| Advisor | Cognitive Function |
|---------|-------------------|
| **strategist** | Terrain reading, adversarial dynamics, information asymmetry |
| **realist** | Incentive mapping, power dynamics, stated vs revealed preferences |
| **timer** | Strategic timing, momentum, when to strike vs wait |
| **inverter** | Multi-model inversion, opportunity cost, failure avoidance |
| **tail-watcher** | Tail risk, fragility audit, antifragile design |
| **taxonomist** | Classification, category errors, precise definitions |

### Wisdom (advisors/wisdom.md)

| Advisor | Cognitive Function |
|---------|-------------------|
| **questioner** | Assumption destruction, dialectic, hidden questions |
| **subtractor** | Via negativa, minimum intervention, emergence |
| **reframer** | Frame dissolution, false dichotomies, perspective shift |
| **stoic** | Control boundaries, moral clarity, resilience |
| **bias-hunter** | Cognitive bias detection, pre-mortems, de-biasing |
| **user-advocate** | User experience, cognitive load, design honesty |

## How It Works

```
┌─────────────────────────────────────────────────────┐
│  PHASE 0: FRAMING                                   │
│  Parse question → scan workspace → select profile   │
│  → frame as neutral prompt with stakes              │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 1: INDEPENDENT ANALYSIS (parallel)           │
│  5-7 advisors each produce 200-300 word analysis    │
│  + confidence rating + blind spot acknowledgment    │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 2: ANONYMIZED PEER REVIEW (parallel)         │
│  Responses shuffled as A-G → each reviews all       │
│  → strongest, weakest, what ALL missed              │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 3: CHAIRMAN SYNTHESIS                        │
│  Consensus → Clash Points → Blind Spots Caught      │
│  → Strongest Dissent → Confidence Meter             │
│  → Recommendation → First Move                      │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 4: FOLLOW-UP (optional)                      │
│  expand / challenge / reweight / re-run / save      │
└─────────────────────────────────────────────────────┘
```

## When to Use the Council

**Good council questions:**
- Architecture decisions with multiple valid approaches
- Product pivots or major feature bets
- Hire vs build vs buy decisions
- Risk assessment before irreversible actions
- Strategic positioning against competitors
- Technology selection with long-term consequences

**Bad council questions (just answer directly):**
- Factual lookups ("what version of Node supports X?")
- Simple yes/no ("should I use TypeScript?")
- Creation tasks ("write me a function")
- Questions with one right answer

## Customization

Edit `~/.kiro/settings/council-of-minds.config.json` to:
- Add/modify profiles
- Adjust keyword mappings for auto-selection
- Change advisor count limits
- Toggle anonymization
- Modify word limits

## Credits

- Process design adapted from [Andrej Karpathy's LLM Council methodology](https://github.com/aiwithremy/claude-skills-llm-council)
- Advisor personas inspired by [Council of High Intelligence](https://github.com/0xNyk/council-of-high-intelligence)
- Enhancements: confidence scoring, dissent preservation, profile-based selection, follow-up protocol, grounding protocols
