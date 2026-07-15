<p align="center">
  <strong>Council of Minds</strong><br/>
  <em>Multi-advisor deliberation for AI agents. One council, every coding client.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.0-a78bfa?style=flat-square" alt="Version" />
  <img src="https://img.shields.io/badge/advisors-18_cognitive_lenses-10b981?style=flat-square" alt="Advisors" />
  <img src="https://img.shields.io/badge/profiles-6_domains-f59e0b?style=flat-square" alt="Profiles" />
  <img src="https://img.shields.io/badge/agents-kiro_·_cursor_·_claude_·_windsurf-3b82f6?style=flat-square" alt="Agents" />
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=flat-square" alt="License" />
</p>

<p align="center">
  <a href="#install"><strong>Install</strong></a> ·
  <a href="#how-it-works"><strong>How It Works</strong></a> ·
  <a href="#the-18-advisors"><strong>Advisors</strong></a> ·
  <a href="#vs-alternatives"><strong>vs Alternatives</strong></a> ·
  <a href="#inspiration"><strong>Inspiration</strong></a>
</p>

---

## Why Council of Minds?

> [!IMPORTANT]
> You ask one AI a question, you get one answer. That answer might be great. It might be mid. You have no way to tell because you saw **one perspective**. The council fixes this.

Decisions with genuine uncertainty — architecture choices, product pivots, technology bets, strategic moves — deserve more than a single-shot response from one model. Council of Minds runs your question through **5-7 independent advisors**, each thinking from a fundamentally different angle, then has them **peer-review each other anonymously**, and synthesizes everything into a **verdict with confidence scoring**.

| Problem | What happens without a council |
|:--------|:------|
| **Single-perspective blindness** | Your AI optimizes for one angle, misses 4 others |
| **Confidence theater** | Every response sounds equally confident regardless of actual certainty |
| **No dissent preservation** | The best counterargument never gets surfaced |
| **No peer pressure** | Without review, weak reasoning goes unchallenged |
| **Generic advice** | Without grounding protocols, responses default to corporate platitudes |

---

## The Solution

Council of Minds convenes 5-7 specialized advisors from a pool of 18, runs them through a 4-phase deliberation process, and delivers a structured verdict that tells you where advisors agree, where they clash, and what you should actually do.

```
┌─────────────────────────────────────────────────────┐
│  PHASE 0: FRAMING                                   │
│  Parse question → scan context → select profile     │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 1: INDEPENDENT ANALYSIS (parallel)           │
│  5-7 advisors · 200-300 words each · confidence     │
│  rated · blind spots acknowledged                   │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 2: ANONYMIZED PEER REVIEW (parallel)         │
│  Responses shuffled A-G → each reviews all →        │
│  strongest · weakest · what ALL missed              │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 3: CHAIRMAN SYNTHESIS                        │
│  Consensus · Clash Points · Blind Spots Caught ·    │
│  Strongest Dissent · Confidence Meter ·             │
│  Recommendation · First Move                        │
└──────────────────────┬──────────────────────────────┘
                       ▼
┌─────────────────────────────────────────────────────┐
│  PHASE 4: FOLLOW-UP                                 │
│  expand · challenge · reweight · re-run · save      │
└─────────────────────────────────────────────────────┘
```

---

## Install

Council of Minds is **agent-agnostic**. The install script auto-detects your AI clients and installs in their native format.

```bash
./install.sh
```

That's it. The script will:
1. Detect installed clients (Kiro, Claude, Cursor, Windsurf, Cline, Aider, RooCode, OpenCode)
2. Let you choose which to install for
3. Ask scope (global or project-level)
4. Copy all advisor files in the correct format for each client

### Non-Interactive

```bash
./install.sh --client kiro --global        # Kiro only, global
./install.sh --client claude --project     # Claude only, current project
./install.sh --client cursor,windsurf      # Multiple clients
```

### Uninstall

```bash
./install.sh --uninstall                   # Remove from all clients
```

### Supported Clients

| Client | Detection | Install Location |
|--------|-----------|-----------------|
| **Kiro** | `~/.kiro` exists | `.kiro/agents/council-of-minds/` |
| **Claude Code** | `~/.claude` or `claude` CLI | `.claude/council-of-minds/` + CLAUDE.md reference |
| **Cursor** | `~/.cursor` exists | `.cursor/rules/council-of-minds.md` |
| **Windsurf** | `~/.windsurf` exists | `.windsurf/rules/council-of-minds.md` |
| **Cline** | `~/.cline` exists | `.cline/rules/council-of-minds.md` |
| **Aider** | `aider` CLI available | `.aider/council-of-minds/` + conf reference |
| **RooCode** | `~/.roo` exists | `.roo/rules/council-of-minds.md` |
| **OpenCode** | `opencode` CLI available | `.opencode/council-of-minds/` |

<details>
<summary><strong>Manual Install (without script)</strong></summary>

The council is plain markdown. Any AI agent that reads markdown context files can use it:

1. Copy `council-of-minds.md` to your agent's rules/context directory
2. Copy `advisors/*.md` alongside it
3. Copy `settings/council-of-minds.config.json` for profile configuration
4. Say "council this: [your question]"

For Kiro specifically:
```bash
mkdir -p ~/.kiro/agents/council-of-minds
cp -r council-of-minds/* ~/.kiro/agents/council-of-minds/
cp settings/council-of-minds.config.json ~/.kiro/settings/
```

</details>

---

## Usage

### Trigger Phrases

| Phrase | Effect |
|--------|--------|
| `council this: [question]` | Auto-select profile |
| `engineering council: [question]` | Force engineering advisors |
| `strategy council: [question]` | Force strategy advisors |
| `product council: [question]` | Force product advisors |
| `risk council: [question]` | Force risk advisors |
| `ai council: [question]` | Force AI/ML advisors |
| `innovation council: [question]` | Force innovation advisors |
| `war room this` / `pressure-test this` | Same as "council this" |

### Follow-Up Commands

After receiving a verdict:

```
expand on the inverter's point        → deep dive one advisor
challenge the verdict with [new info]  → re-synthesize
weight toward risk                     → reweight emphasis
re-run with strategy profile           → different composition
save transcript                        → save to file
```

### Custom Council

```
council this with architect, tail-watcher, realist, shipper, questioner: [question]
```

---

## Council Profiles

| Profile | Advisors | Best For |
|---------|----------|----------|
| **engineering** | architect · deriver · shipper · systems-mapper · inverter · user-advocate | Architecture, code design, infra |
| **strategy** | strategist · realist · inverter · timer · tail-watcher · systems-mapper | Market, competition, positioning |
| **product** | user-advocate · shipper · realist · bias-hunter · reframer · deriver | Features, UX, direction |
| **risk** | tail-watcher · bias-hunter · inverter · systems-mapper · stoic · strategist | High-stakes, go/no-go |
| **ai-ml** | model-whisperer · frontier-scout · architect · deriver · tail-watcher · shipper | AI products, model choices |
| **innovation** | questioner · subtractor · reframer · taxonomist · deriver · inverter | New spaces, assumptions |

---

## The 18 Advisors

### Technical (`advisors/technical.md`)

| Advisor | Cognitive Function | Inspired By |
|---------|-------------------|-------------|
| **architect** | Formal structure, abstraction boundaries | Ada Lovelace |
| **deriver** | First-principles reconstruction, jargon destruction | Richard Feynman |
| **shipper** | Pragmatic engineering, over-engineering detection | Linus Torvalds |
| **model-whisperer** | ML capability frontiers, build-vs-prompt | Andrej Karpathy |
| **frontier-scout** | Scaling dynamics, capability-safety boundary | Ilya Sutskever |
| **systems-mapper** | Feedback loops, leverage points | Donella Meadows |

### Strategic (`advisors/strategic.md`)

| Advisor | Cognitive Function | Inspired By |
|---------|-------------------|-------------|
| **strategist** | Terrain reading, adversarial dynamics | Sun Tzu |
| **realist** | Incentive mapping, power dynamics | Machiavelli |
| **timer** | Strategic timing, momentum reading | Miyamoto Musashi |
| **inverter** | Multi-model inversion, opportunity cost | Charlie Munger |
| **tail-watcher** | Tail risk, antifragile design | Nassim Taleb |
| **taxonomist** | Classification, category errors | Aristotle |

### Wisdom (`advisors/wisdom.md`)

| Advisor | Cognitive Function | Inspired By |
|---------|-------------------|-------------|
| **questioner** | Assumption destruction, dialectic | Socrates |
| **subtractor** | Via negativa, minimum intervention | Lao Tzu |
| **reframer** | Frame dissolution, false dichotomies | Alan Watts |
| **stoic** | Control boundaries, moral clarity | Marcus Aurelius |
| **bias-hunter** | Cognitive bias detection, pre-mortems | Daniel Kahneman |
| **user-advocate** | User experience, design honesty | Dieter Rams |

---

## vs Alternatives

| Feature | Council of Minds | [LLM Council](https://github.com/aiwithremy/claude-skills-llm-council) (Remy) | [Council of High Intelligence](https://github.com/0xNyk/council-of-high-intelligence) (0xNyk) |
|---------|:---:|:---:|:---:|
| **Advisors** | 18 cognitive lenses | 5 generic thinking styles | 18 named personas |
| **Profile-based selection** | 6 domain profiles, auto-select | None — always runs all 5 | None — manual or full 18 |
| **Anonymized peer review** | Yes | Yes | No |
| **Grounding protocols** | Per-advisor constraints preventing drift | None | Per-advisor |
| **Confidence scoring** | Per-advisor + consensus meter | None | None |
| **Dissent preservation** | Explicit "Strongest Dissent" section | No | No |
| **Follow-up drilldown** | expand / challenge / reweight / re-run | None | None |
| **Agent-agnostic** | Kiro · Cursor · Claude · Windsurf · any | Claude only | Claude only |
| **Peer review quality** | Anonymized + structured JSON output | Anonymized + free-form | Named + round-based (deference risk) |
| **Chairman can dissent** | Yes — can side with minority | Yes | N/A (no chairman) |
| **"Where I May Be Wrong"** | Every advisor, every round | None | Every advisor |
| **Keyword auto-select** | 18 keyword maps for intelligent advisor selection | None | Triads/polarity pairs (manual) |
| **Workspace context scan** | Reads project files to enrich framing | Claude-specific (`CLAUDE.md`) | None |

### Why Ours Is Better

1. **Profile selection prevents noise.** Running 18 advisors is chaos. Running the right 5-7 based on your question's domain gives signal without noise. Neither alternative does this.

2. **Anonymized peer review + grounding protocols.** 0xNyk has deep personas but no anonymization (creates deference bias). Remy has anonymization but shallow advisors. We have both.

3. **Confidence meter gives you signal strength.** When 6/6 advisors converge, you know. When it is 3/3 split, you know that too. Neither alternative quantifies consensus.

4. **Strongest Dissent is preserved.** The minority view that might be right is the council's most valuable output. Both alternatives bury dissent in synthesis.

5. **Follow-up protocol.** A verdict is a starting point, not an end. Drill into any advisor, challenge with new info, reweight emphasis. Static verdicts are half the value.

6. **Agent-agnostic.** Works anywhere markdown is read. Not locked to one client.

---

## How It Works

| Step | What happens |
|:----:|---|
| 1 | User triggers council (explicit phrase or contextual) |
| 2 | Orchestrator frames the question, scans workspace context |
| 3 | Profile auto-selected based on domain keywords (or user override) |
| 4 | 5-7 advisors spawn in parallel, each producing structured analysis |
| 5 | Responses anonymized (A-G), each advisor reviews all others |
| 6 | Chairman synthesizes: consensus, clashes, blind spots, dissent, recommendation |
| 7 | Verdict presented with confidence meter and single first-move action |

---

## When to Use

**Good council questions:**
- Architecture decisions with multiple valid approaches
- Product pivots or major feature bets
- Hire vs build vs buy decisions
- Risk assessment before irreversible actions
- Strategic positioning against competitors
- Technology selection with long-term consequences
- "Should I X or Y?" with genuine stakes

**Do NOT council:**
- Factual lookups ("what version of Node supports X?")
- Simple yes/no without tradeoffs
- Creation tasks ("write me a function")
- Questions with one right answer

---

## Project Structure

```
council-of-minds/
├── install.sh                        # Auto-detect + install for all clients
├── council-of-minds.json             # Agent config (Kiro native)
├── council-of-minds.md               # Orchestrator prompt (universal)
├── advisors/
│   ├── technical.md                  # 6 engineering/AI advisors
│   ├── strategic.md                  # 6 strategy/risk advisors
│   └── wisdom.md                     # 6 philosophy/design advisors
├── settings/
│   ├── council-of-minds.config.json  # Profiles, keywords, settings
│   └── council-of-minds.meta.json    # Agent metadata
└── README.md
```

---

## Customization

Edit `council-of-minds.config.json` to:
- Add/modify profiles (custom advisor combinations)
- Adjust keyword mappings for auto-selection
- Change advisor count limits (default: 5-7)
- Toggle anonymization
- Modify word limits per phase

---

## Inspiration

This project synthesizes three approaches to multi-perspective AI deliberation:

**Andrej Karpathy's LLM Council methodology** — The core insight: dispatch the same query to multiple models, have them peer-review each other anonymously, then a chairman produces the final answer. Anonymization prevents deference bias. Implemented via [aiwithremy/claude-skills-llm-council](https://github.com/aiwithremy/claude-skills-llm-council).

**0xNyk's Council of High Intelligence** — 18 deeply characterized intellectual figures (Munger, Feynman, Taleb, Torvalds, etc.) with grounding protocols that prevent persona drift, polarity pairs that create natural tension, and "Where I May Be Wrong" sections that force epistemic humility. [0xNyk/council-of-high-intelligence](https://github.com/0xNyk/council-of-high-intelligence).

**Original contributions** — Profile-based dynamic advisor selection (never run all 18), confidence scoring with consensus meter, explicit dissent preservation, follow-up drilldown protocol (expand/challenge/reweight/re-run), agent-agnostic design (plain markdown works everywhere), and renaming advisors by cognitive function rather than persona to prevent roleplay drift.

---

## Author

<p>
  <a href="https://github.com/BhavanPatel"><strong>Bhavan Patel</strong></a>
</p>

## License

MIT
