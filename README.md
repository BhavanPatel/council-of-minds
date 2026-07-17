<p align="center">
  <strong>Council of Minds</strong><br/>
  <em>Multi-advisor deliberation for AI agents. One council, every coding client.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-1.0.5-a78bfa?style=flat-square" alt="Version" />
  <img src="https://img.shields.io/badge/advisors-18_cognitive_lenses-10b981?style=flat-square" alt="Advisors" />
  <img src="https://img.shields.io/badge/profiles-6_domains-f59e0b?style=flat-square" alt="Profiles" />
  <img src="https://img.shields.io/badge/agents-kiro_·_cursor_·_claude_·_windsurf_·_+6_more-3b82f6?style=flat-square" alt="Agents" />
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=flat-square" alt="License" />
</p>

<p align="center">
  <a href="#install"><strong>Install</strong></a> ·
  <a href="#how-it-works"><strong>How It Works</strong></a> ·
  <a href="#the-18-advisors"><strong>Advisors</strong></a> ·
  <a href="#vs-alternatives"><strong>vs Alternatives</strong></a> ·
  <a href="#inspiration"><strong>Inspiration</strong></a>
</p>

<p align="center">
  <a href="docs/architecture.md"><img src="https://img.shields.io/badge/Architecture-a78bfa?style=flat-square&logo=buffer&logoColor=white" alt="Architecture"></a>
  <a href="docs/advisors.md"><img src="https://img.shields.io/badge/Advisors-a78bfa?style=flat-square&logo=dependabot&logoColor=white" alt="Advisors"></a>
  <a href="docs/profiles.md"><img src="https://img.shields.io/badge/Profiles-a78bfa?style=flat-square&logo=slideshare&logoColor=white" alt="Profiles"></a>
  <a href="docs/examples.md"><img src="https://img.shields.io/badge/Examples-10b981?style=flat-square&logo=readthedocs&logoColor=white" alt="Examples"></a>
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

Council of Minds convenes 5-7 specialized advisors from a pool of 18, runs them through a 5-round deliberation process, and delivers a structured verdict that tells you where advisors agree, where they clash, and what you should actually do.

```mermaid
graph LR
    Q["Your Question"] --> Frame["Frame + Select Panel"]
    Frame --> Analyze["5-7 Advisors<br/>Analyze Independently"]
    Analyze --> Cross["Cross-Examine<br/>Disagree · Strengthen"]
    Cross --> Crystal["Crystallize<br/>Final Positions"]
    Crystal --> Vote["Weighted Vote<br/>+ Chairman Verdict"]
    Vote --> V["Kill Criteria · Recommendation · Next Step"]
```

### Three Modes

| Mode | Rounds | Best For |
|------|--------|----------|
| **Full** | 5 (Restate → Analyze → Cross-Examine → Crystallize → Synthesize) | Complex decisions |
| **Quick** | 3 (Analyze → Cross-Examine → Synthesize) | Time-sensitive |
| **Duo** | 3 (Position → Rebuttal → Synthesize) | Binary choices |

---

## Install

```bash
# Step 1: Setup (clones repo + installs CLI)
curl -sL https://raw.githubusercontent.com/BhavanPatel/council-of-minds/main/setup.sh | bash

# Step 2: Install for your AI clients
council install
```

Auto-detects your AI clients (Kiro, Claude, Cursor, Windsurf, Cline, Aider, RooCode, OpenCode, GitHub Copilot, Codex), lets you choose which to install for, and copies everything in native format.

```bash
# If already installed, use the CLI directly
council install --client claude
```

### CLI Commands

After install, the `council` command is available globally:

```bash
council install      # Install/reinstall for detected AI clients
council status       # Show what's installed and for which clients
council update       # Pull latest from git + reinstall
council disable      # Temporarily disable (reversible)
council enable       # Re-enable
council uninstall    # Remove from all clients
council version      # Show version
```

### Manual Install

```bash
git clone https://github.com/BhavanPatel/council-of-minds.git ~/.council-of-minds
cd ~/.council-of-minds && ./install.sh
```

---

## Usage

### Basic — Just Ask

```
council this: Should we migrate to event-driven architecture or stay with REST?
```

### Better — Add Context for Better Results

```
engineering council: Should we migrate to event-driven architecture or stay with REST?

Context: 4 microservices, team of 8, current REST latency is 200ms p95, 
we need sub-50ms for the real-time feed. Team has no Kafka experience. 
Deadline: Q4 launch.
```

### Best — Specify Stakes and Constraints

```
risk council: Should we accept the acquisition offer or continue independently?

Context: $12M offer, 18 months runway remaining, $800K MRR growing 15% MoM.
Two competitors just raised Series B. Team of 22, 3 key engineers have 
retention risk. Board is split.

Stakes: Irreversible. If we decline and miss the growth window, no second offer.
Constraints: Need decision by end of month. No bridge financing available.
```

### Quick Decisions

```
quick council: Should we rollback this deploy? 2% error rate, 47 files changed.
```

### Binary Choices

```
duo this: PostgreSQL or DynamoDB for our event store?
Context: 50K writes/sec, team knows Postgres, AWS infrastructure.
```

### Follow-Up After Verdict

```
expand on the tail-watcher's point
challenge the verdict with: our CTO insists on team autonomy per service
weight toward risk
re-run with innovation profile
```

### Tips for Better Council Sessions

| Do | Dont |
|----|------|
| Provide context (team size, constraints, timeline) | Ask vague questions ("should I improve things?") |
| State what is irreversible or high-stakes | Ask factual questions with one right answer |
| Name the options you are choosing between | Ask the council to write code or create content |
| Specify the profile if you know the domain | Trigger on trivial decisions |
| Use `duo` for quick binary choices | Use `full` for time-sensitive incidents |

See [docs/examples.md](docs/examples.md) for complete input/output examples.

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

| Advisor | Lens |
|---------|------|
| **architect** | Formal structure, abstraction boundaries, what can/cannot be mechanized |
| **deriver** | First-principles reconstruction, jargon destruction, simplest explanation |
| **shipper** | Pragmatic engineering, over-engineering detection, maintenance cost |
| **model-whisperer** | ML capability frontiers, training dynamics, build-vs-prompt |
| **frontier-scout** | Scaling dynamics, phase transitions, capability-safety boundary |
| **systems-mapper** | Feedback loops, leverage points, unintended consequences |
| **strategist** | Terrain reading, adversarial dynamics, information asymmetry |
| **realist** | Incentive mapping, power dynamics, stated vs revealed preferences |
| **timer** | Strategic timing, momentum reading, when to strike vs wait |
| **inverter** | Multi-model inversion, opportunity cost, failure avoidance |
| **tail-watcher** | Tail risk, fragility audit, antifragile design |
| **taxonomist** | Classification, category errors, precise definitions |
| **questioner** | Assumption destruction, dialectic, hidden questions |
| **subtractor** | Via negativa, minimum intervention, emergence |
| **reframer** | Frame dissolution, false dichotomies, perspective shift |
| **stoic** | Control boundaries, moral clarity, resilience |
| **bias-hunter** | Cognitive bias detection, pre-mortems, de-biasing |
| **user-advocate** | User experience, cognitive load, design honesty |

Full advisor details: [docs/advisors.md](docs/advisors.md)

---

## vs Alternatives

| Feature | Council of Minds | [LLM Council](https://github.com/aiwithremy/claude-skills-llm-council) (Remy) | [Council of High Intelligence](https://github.com/0xNyk/council-of-high-intelligence) (0xNyk) |
|---------|:---:|:---:|:---:|
| **Advisors** | 18 cognitive lenses | 5 generic thinking styles | 18 named personas |
| **Modes** | Full (5-round) · Quick (3-round) · Duo | Single mode only | Full · Quick · Duo |
| **Profile-based selection** | 6 profiles + auto-select + custom | None — always all 5 | Triads + profiles (manual) |
| **Problem Restate Gate** | Yes — catches wrong questions | No | No |
| **Evidence labeling** | Required (empirical/mechanistic/strategic/ethical/heuristic) | No | Yes |
| **Cross-examination** | Structured Disagree/Strengthen/Update | Free-form "strongest/weakest" | Round 2 structured engagement |
| **Anti-conformity directive** | Explicit — must name flaw to update | No | No |
| **Enforcement scan** | Dissent quota + novelty + diversity + engagement | No | Yes (similar) |
| **Vote tally** | Confidence-weighted with 2/3 threshold | No | Yes (weighted) |
| **Domain-weight seat** | 1.5x for most-relevant advisor | No | Yes |
| **Kill Criteria** | Required in every verdict | No | Yes |
| **DEALBREAKER flag** | Per-advisor, chairman must address | No | No |
| **Minority Report** | Explicit section with full reasoning | Mentioned in synthesis | No formal section |
| **Acceptable Compromises** | Required section | No | No |
| **Follow-up protocol** | expand · challenge · reweight · re-run · duo | None | None |
| **Agent-agnostic** | Kiro · Cursor · Claude · Windsurf · 10 clients | Claude only | Claude only |
| **Grounding protocols** | Per-advisor with hard constraints | None | Per-advisor |
| **Polarity pairs** | 10 defined tension pairs for Duo mode | N/A | Yes |

### Why Ours Is Better

1. **5-round deliberation with enforcement.** Not just "ask 5 advisors and summarize." Problem Restate Gate catches wrong questions. Cross-examination forces direct engagement. Enforcement scan rejects lazy agreement. Crystallization produces clean inputs for synthesis.

2. **Confidence-weighted vote tally.** Auditable math, not vibes. Domain-weight seat (1.5x) ensures the most-relevant advisor has proportional influence. 2/3 threshold means split decisions are reported as splits, not forced consensus.

3. **Kill Criteria + Acceptable Compromises.** Every verdict states when it expires and what it gives up. Neither alternative forces this honesty.

4. **Anti-conformity directive.** Must name the specific flaw to update position. Prevents the groupthink collapse that ruins most multi-agent deliberations.

5. **3 modes for 3 situations.** Full (complex decisions), Quick (time-sensitive), Duo (binary choices with polarity pairs). Neither alternative adapts process to decision weight.

6. **Agent-agnostic with one-line install.** Works on Kiro, Claude, Cursor, Windsurf, Cline, Aider, RooCode, OpenCode, GitHub Copilot, and Codex. One curl command installs everything with a persistent `council` CLI for update/disable/uninstall. Not locked to one client.

---

## How It Works

| Step | What happens |
|:----:|---|
| 0 | User triggers council — orchestrator parses question, scans workspace, selects profile |
| 1 | **Problem Restate Gate** — each advisor restates in their lens (catches wrong questions) |
| 2 | **Independent Analysis** — 5-7 advisors spawn in parallel, 300 words each, evidence-labeled |
| 3 | **Cross-Examination** — structured Disagree/Strengthen/Update with anti-conformity directive |
| 4 | **Enforcement Scan** — verify dissent quota, novelty, evidence diversity, engagement quality |
| 5 | **Crystallization** — 100-word final declarative positions with STANCE/CONFIDENCE/DEALBREAKER |
| 6 | **Vote Tally** — confidence-weighted scoring with domain-weight seat (1.5x), 2/3 threshold |
| 7 | **Chairman Synthesis** — verdict with Kill Criteria, Compromises, Minority Report, Next Step |
| 8 | **Follow-Up** — expand, challenge, reweight, re-run, duo, save transcript |

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

## Documentation

| | |
|:--|:--|
| <a href="docs/architecture.md"><img src="https://img.shields.io/badge/Architecture-a78bfa?style=flat-square&logo=buffer&logoColor=white" alt="Architecture"></a> | [System design, mermaid diagrams, phase flow, anonymization, design decisions](docs/architecture.md) |
| <a href="docs/advisors.md"><img src="https://img.shields.io/badge/Advisors-a78bfa?style=flat-square&logo=dependabot&logoColor=white" alt="Advisors"></a> | [All 18 advisors — function, method, grounding protocol, blind spots](docs/advisors.md) |
| <a href="docs/profiles.md"><img src="https://img.shields.io/badge/Profiles-a78bfa?style=flat-square&logo=slideshare&logoColor=white" alt="Profiles"></a> | [6 profiles, auto-selection logic, custom profiles, tips](docs/profiles.md) |
| <a href="docs/examples.md"><img src="https://img.shields.io/badge/Examples-10b981?style=flat-square&logo=readthedocs&logoColor=white" alt="Examples"></a> | [Full input/output examples from real council sessions](docs/examples.md) |

---

## Customization

Edit `council-of-minds.config.json` (installed in your client's settings directory) to:
- Add custom profiles with your own advisor combinations
- Adjust keyword mappings for auto-selection
- Change advisor count limits (default: 5-7)
- Set default mode (full/quick/duo)
- Tune voting weights and consensus threshold

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
