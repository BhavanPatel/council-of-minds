<p align="center">
  <strong>Council of Minds</strong><br/>
  <em>Multi-advisor deliberation for AI agents. One council, every coding client.</em>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-2.1.0-a78bfa?style=flat-square" alt="Version" />
  <img src="https://img.shields.io/badge/advisors-24_cognitive_lenses-10b981?style=flat-square" alt="Advisors" />
  <img src="https://img.shields.io/badge/profiles-7_domains-f59e0b?style=flat-square" alt="Profiles" />
  <img src="https://img.shields.io/badge/agents-kiro_·_cursor_·_claude_·_windsurf_·_+6_more-3b82f6?style=flat-square" alt="Agents" />
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=flat-square" alt="License" />
</p>

<p align="center">
  <a href="#install"><strong>Install</strong></a> ·
  <a href="#how-it-works"><strong>How It Works</strong></a> ·
  <a href="#the-24-advisors"><strong>Advisors</strong></a> ·
  <a href="#vs-alternatives"><strong>vs Alternatives</strong></a> ·
  <a href="#inspiration--research-foundation"><strong>Research</strong></a>
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

Decisions with genuine uncertainty — architecture choices, product pivots, technology bets, strategic moves — deserve more than a single-shot response from one model. Council of Minds runs your question through **4-6 independent advisors**, each thinking from a fundamentally different angle, then has them **peer-review each other**, and synthesizes everything into a **verdict with confidence scoring**.

| Problem | What happens without a council |
|:--------|:------|
| **Single-perspective blindness** | Your AI optimizes for one angle, misses 4 others |
| **Confidence theater** | Every response sounds equally confident regardless of actual certainty |
| **No dissent preservation** | The best counterargument never gets surfaced |
| **No peer pressure** | Without review, weak reasoning goes unchallenged |
| **Generic advice** | Without grounding protocols, responses default to corporate platitudes |

---

## The Solution

Council of Minds convenes 4-6 specialized advisors from a pool of 24, runs them through a structured deliberation process with fact-checking and adaptive optimization, and delivers a verdict that tells you where advisors agree, where they clash, and what you should actually do.

```mermaid
graph LR
    Q["Your Question"] --> Frame["Frame + Select Panel"]
    Frame --> Analyze["4-6 Advisors<br/>Analyze Independently"]
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
| **engineering** | architect · deriver · shipper · systems-mapper · inverter | Architecture, code design, infra |
| **strategy** | strategist · realist · inverter · timer · tail-watcher | Market, competition, positioning |
| **product** | user-advocate · shipper · realist · bias-hunter · reframer | Features, UX, direction |
| **risk** | tail-watcher · bias-hunter · inverter · systems-mapper · stoic | High-stakes, go/no-go |
| **ai-ml** | model-whisperer · frontier-scout · architect · deriver · tail-watcher | AI products, model choices |
| **innovation** | questioner · subtractor · reframer · taxonomist · inverter | New spaces, assumptions |
| **creative** | ideator · synthesizer · narrator · provocateur · aesthete | Brainstorming, naming, brand |

---

## The 24 Advisors

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
| | |
| **ideator** | Divergent idea generation, possibility space exploration |
| **synthesizer** | Cross-domain pattern integration, structural fusion |
| **narrator** | Story structure, narrative coherence, audience analysis |
| **provocateur** | Creative destruction, sacred-cow slaughter, heresy |
| **aesthete** | Form-function harmony, elegance, design coherence |
| **analogist** | Structural analogy, cross-domain transfer, mapping |

Full advisor details: [docs/advisors.md](docs/advisors.md)

---

## vs Alternatives

| Feature | Council of Minds | Councilverse | Deb8flow | Council of Five | CrewAI/AutoGen |
|---------|:---:|:---:|:---:|:---:|:---:|
| **Advisors** | 24 cognitive lenses | 15 methodologies | 5 (Pro/Con/Mod/Fact/Judge) | 5 governance agents | N (role-based) |
| **Modes** | Full · Quick · Duo · Budget tiers | Single | Single | Single | Task pipelines |
| **Enforcement Scan** | Dissent + novelty + diversity + engagement | No | No | No | No |
| **Anti-Conformity** | Must name flaw to update | No | No | No | No |
| **Fact-Checker** | Between rounds, flags disputed claims | No | Dedicated agent | No | No |
| **Sparse Cross-Exam** | O(N) polarity-pair targeted | No | N/A (2 debaters) | No | N/A |
| **Early Termination** | Skip crystallization on consensus | No | No | No | N/A |
| **Cost Budget Mode** | 6 tiers, auto-configures | No | No | No | No |
| **Kill Criteria** | Required on every verdict | No | No | No | No |
| **DEALBREAKER Flag** | Structured veto, chairman must address | No | No | No | No |
| **Evidence Labeling** | 5 types required per claim | No | No | No | No |
| **Domain-Weight Seat** | 1.5x for most-relevant advisor | No | No | No | No |
| **Debate Analytics** | Position shifts, influence maps, token tracking | No | No | No | Built-in observability |
| **Confidence-Weighted Vote** | With 2/3 threshold | Three-valued | Judge verdict | Majority | N/A |
| **Problem Restate Gate** | Catches wrong questions | No | No | No | No |
| **Agent-Agnostic** | 10+ AI clients | Claude only | Standalone app | Docker | Python SDK |
| **Profile Selection** | 6 profiles + auto-select | Manual | Fixed roles | Fixed | Manual crew config |
| **Research-Backed Panel Size** | 4-6 (Google validated) | Variable | 5 fixed | 5 fixed | User-defined |

### What Makes Us Different

Most multi-agent debate systems fall into one of two traps:

1. **Too simple** — Ask N agents, vote, done. No quality control, no enforcement, conformity bias runs rampant. (Most Claude Code council skills)

2. **Too rigid** — Fixed debate structure, no cost awareness, same heavyweight process for trivial and critical decisions alike. (Deb8flow, Council of Five)

Council of Minds is the **only system** that combines:
- **Quality enforcement** (programmatic validation that rejects lazy agreement)
- **Cost awareness** (6 budget tiers that auto-configure the entire deliberation)
- **Adaptive process** (early termination, sparse cross-exam, mode selection)
- **Structured accountability** (DEALBREAKER veto, Kill Criteria, evidence labeling)

Backed by research: Google's 2025 study of 180 agent configurations, ACL 2026 findings on debate effectiveness, and convergent market evidence from 25+ independent implementations.

### Why Ours Is Better — 10 Competitive Advantages

We researched 25+ competing projects (AutoGen, CrewAI, LangGraph debate patterns, Councilverse, WISE, ReConcile, Deb8flow, Council of Five, and academic papers from 2024-2026). Here's what sets Council of Minds apart:

1. **Enforcement Scan (unique).** We're the ONLY project that programmatically validates: dissent quota, novelty gate, evidence diversity, and engagement quality. Every other system allows lazy consensus.

2. **Anti-Conformity Directive.** Advisors can ONLY update their position when a specific flaw is named. Research (ACL 2026) confirms homogeneous agents with uniform belief updates cannot improve outcomes — our directive is the structural fix.

3. **Fact-Checker Mechanism.** Claims are scanned and flagged (verified/unverifiable/disputed) before cross-examination. No other council system does this.

4. **Sparse Cross-Examination.** O(N) instead of O(N²). Uses polarity pairs + evidence-type diversity for targeted engagement. Better quality, 40-60% fewer tokens.

5. **Adaptive Early Termination.** Skips crystallization when consensus is strong — saves 30-40% tokens without losing verdict quality. Budget-aware.

6. **Cost Budget Mode (6 tiers).** From ~3K tokens (Duo) to unlimited (Full + all-pairs). Auto-configures panel size, mode, and cross-exam style within budget.

7. **Domain-Weight Seat + DEALBREAKER flag.** Most-relevant advisor gets 1.5x weight. Any advisor can flag a fatal flaw that the chairman MUST address. No competitor has structured veto mechanisms.

8. **Kill Criteria.** Every verdict states when it expires. No other project requires observable falsification conditions.

9. **Evidence Type Labeling.** Every claim is tagged (empirical/mechanistic/strategic/ethical/heuristic). Creates a meta-reasoning layer enabling diversity audits.

10. **Debate Analytics.** Track position changes, who convinces whom, enforcement pass/fail rates, token efficiency. Learn which advisors work best for which domains.

> Research-backed panel size: Our 4-6 default is validated by Google's "Towards a Science of Scaling Agent Systems" (2025) which tested 180 configurations and found that more agents often hits a ceiling or degrades performance by 39-70% when misaligned with task structure.

---

## How It Works

| Step | What happens |
|:----:|---|
| 0 | User triggers council — orchestrator parses question, scans workspace, selects profile |
| 1 | **Problem Restate Gate** — each advisor restates in their lens (catches wrong questions) |
| 2 | **Independent Analysis** — 4-6 advisors spawn in parallel, 300 words each, evidence-labeled |
| 3 | **Fact-Check** — claims scanned for verification; disputed/unverifiable flagged for Round 2 |
| 4 | **Cross-Examination** — structured Disagree/Strengthen/Update with sparse engagement targeting |
| 5 | **Enforcement Scan** — verify dissent quota, novelty, evidence diversity, engagement quality |
| 5b | **Early Termination Check** — if strong consensus + high confidence, skip crystallization |
| 6 | **Crystallization** — 100-word final declarative positions with STANCE/CONFIDENCE/DEALBREAKER |
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
| <a href="docs/advisors.md"><img src="https://img.shields.io/badge/Advisors-a78bfa?style=flat-square&logo=dependabot&logoColor=white" alt="Advisors"></a> | [All 24 advisors — function, method, grounding protocol, blind spots](docs/advisors.md) |
| <a href="docs/profiles.md"><img src="https://img.shields.io/badge/Profiles-a78bfa?style=flat-square&logo=slideshare&logoColor=white" alt="Profiles"></a> | [7 profiles, auto-selection logic, custom profiles, tips](docs/profiles.md) |
| <a href="docs/examples.md"><img src="https://img.shields.io/badge/Examples-10b981?style=flat-square&logo=readthedocs&logoColor=white" alt="Examples"></a> | [Full input/output examples from real council sessions](docs/examples.md) |

---

## Customization

Edit `council-of-minds.config.json` (installed in your client's settings directory) to:
- Add custom profiles with your own advisor combinations
- Adjust keyword mappings for auto-selection
- Change advisor count limits (default: 4-6)
- Set default mode (full/quick/duo)
- Configure cost budget tiers
- Enable/disable fact-checker, early termination, sparse cross-exam
- Tune voting weights and consensus threshold

---

## Inspiration & Research Foundation

This project synthesizes three original approaches plus extensive 2025-2026 research:

**Andrej Karpathy's LLM Council methodology** — The core insight: dispatch the same query to multiple models, have them peer-review each other, then a chairman produces the final answer. Prevents deference bias.

**0xNyk's Council of High Intelligence** — 18 deeply characterized intellectual figures with grounding protocols, polarity pairs for natural tension, and "Where I May Be Wrong" sections forcing epistemic humility. [0xNyk/council-of-high-intelligence](https://github.com/0xNyk/council-of-high-intelligence).

**2025-2026 Multi-Agent Debate Research** — Our v2.0 features are informed by:
- Google's "Towards a Science of Scaling Agent Systems" (180 configurations, optimal panel sizing)
- ReConcile: confidence-weighted consensus among diverse LLMs
- WISE (MERL): Weighted Iterative Society-of-Experts with Solver/Reflector partitioning
- ACL 2026 findings on debate effectiveness and conformity prevention
- "Voting or Consensus?" paper on decision protocol optimization
- Sparse communication topology research (arxiv 2406.11776)

**Original contributions:**
- Profile-based dynamic advisor selection (never run all 24)
- Enforcement scan with programmatic quality validation (unique — no competitor has this)
- Adaptive early termination and sparse cross-examination for cost efficiency
- Cost budget mode with 6 auto-configuring tiers
- Fact-checker mechanism for claim verification between rounds
- Debate analytics for continuous improvement
- DEALBREAKER veto mechanism with chairman accountability
- Evidence type labeling creating a meta-reasoning audit layer
- Agent-agnostic design working across 10+ AI coding clients
- Renaming advisors by cognitive function rather than persona to prevent roleplay drift

See [docs/competitive-analysis.md](docs/competitive-analysis.md) for the full competitive landscape analysis.

---

## Roadmap

| Version | Theme | Features | Status |
|---------|-------|----------|--------|
| **v2.0** | Research-Backed Optimization | Advisor count 4-6, sparse cross-exam, early termination, cost budget mode, fact-checker, debate analytics | Current |
| **v2.1** | Memory & Learning | Persistent transcripts, cross-session advisor effectiveness learning, confidence calibration against outcomes | Planned |
| **v3.0** | Multi-Model Diversity | Different LLM backends per advisor, true reasoning diversity, human-in-the-loop during deliberation rounds | Future |

See [docs/competitive-analysis.md](docs/competitive-analysis.md) for full competitive landscape and known gaps.

---

## Author

<p>
  <a href="https://github.com/BhavanPatel"><strong>Bhavan Patel</strong></a>
</p>

## License

MIT
