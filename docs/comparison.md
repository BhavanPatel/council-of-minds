# Comparison — Council of Minds vs the Landscape

> Landscape review of the multi-agent deliberation and deep-research space. 25+ projects
> analyzed across GitHub, academic papers, and commercial frameworks.

## Landscape Overview

The multi-agent deliberation space spans three categories:

1. **General multi-agent frameworks** — AutoGen, CrewAI, LangGraph (debate is one pattern among many)
2. **Dedicated debate/council systems** — Council of Minds, Deb8flow, Council of Five, Agent-Debate
3. **Academic research** — ReConcile, WISE, MAD, CascadeDebate, DiMo

## Projects Researched

| # | Project | Type | Agents | Key Mechanism |
|---|---------|------|--------|---------------|
| 1 | Multi-Agent Council (mikeh-studio) | GitHub | Variable | Local-first, persistent transcripts |
| 2 | AI-Debate-Council (Evan1108) | GitHub | Teams | Evidence tracking, deep analytics |
| 3 | Agent4Debate (ZhangYiqun) | GitHub | 4 | Searcher + Analyzer + Writer + Reviewer |
| 4 | Agent-Debate (starshine-f) | GitHub | 9 | AI-vs-AI and Human-vs-AI |
| 5 | Multi-Agent-Debate (muthuspark) | GitHub | 3 | LangGraph + Claude, lightweight |
| 6 | Deb8flow (iason-solomos) | GitHub | 5 | Pro + Con + Moderator + Fact Checker + Judge |
| 7 | Council of Five (counciloffive) | GitHub | 5 | 4-layer governance, autonomous |
| 8 | AI Agent Society (ekreloff) | GitHub | 8 | Constitutional governance |
| 9 | Council-Review (ngmeyer) | Claude skill | 5 | DMAD, anonymous peer review |
| 10 | LLM-Council-Skill (tenfoldmarc) | Claude skill | 5 | Karpathy-inspired |
| 11 | Council for Claude (thebigz) | Plugin | 5+1 | Isolated subagent contexts |
| 12 | ECC Council (affaan-m) | Skill | 4 | Four-voice structured disagreement |
| 13 | Claw-Orchestrator (Enderfga) | Skill | Variable | Git worktree isolation |
| 14 | AutoGen (Microsoft) | Framework | N | GroupChat, event-driven |
| 15 | CrewAI | Framework | N | Role-based crews, hierarchical |
| 16 | LangGraph | Framework | N | State-graph DAGs |
| 17 | ReConcile | Research | 3 | Confidence-weighted, multi-model |
| 18 | WISE (MERL) | Research | Split | Solvers + Reflectors, probabilistic |
| 19 | MAD (Skytliang) | Research | 2-3 + judge | First debate paper |
| 20 | Roundtable Policy | Research | Multiple | Democratic committee |
| 21 | CascadeDebate | Research | Multi-tier | Cost-aware deliberation |
| 22 | DebFlow | Research | Multiple | Debate for workflow optimization |
| 23 | BioDesign Agent | Research | 7 | Domain-specific LangGraph |
| 24 | DiMo | Research | Multiple | Diverse thinking modes |
| 25 | DiscoUQ | Research | Ensemble | Structured disagreement for UQ |
| 26 | MindStudio LLM Council | Platform | 2-5 | Multi-model blind ranking |

## Our Competitive Advantages

### Unique Features (No Competitor Has)

1. **Enforcement Scan** — Programmatic validation of dissent quota, novelty gate, evidence diversity, engagement quality
2. **Anti-Conformity Directive** — Must name specific flaw to update position
3. **DEALBREAKER Flag** — Structured veto mechanism forcing chairman acknowledgment
4. **Kill Criteria** — Observable falsification conditions on every verdict
5. **Evidence Type Labeling** — Meta-reasoning layer (empirical/mechanistic/strategic/ethical/heuristic)
6. **Problem Restate Gate** — Catches wrong questions before analysis begins

### Differentiated Features (Better Than Competitors)

7. **Sparse Cross-Examination** — O(N) vs O(N²), polarity-pair targeted
8. **Adaptive Early Termination** — Skip crystallization on strong consensus (30-40% savings)
9. **Cost Budget Mode** — tiers auto-configuring panel size, mode, cross-exam
10. **Fact-Checker Mechanism** — Claim verification between rounds
11. **Debate Analytics** — Position change tracking, influence mapping, token efficiency
12. **Large advisor registry** — cognitive lenses, each with a unique reasoning method
13. **Multi-mode** — Full / Quick / Duo / Budget tiers
14. **Agent-agnostic** — Works across many AI coding clients
15. **Constitutional Meta-Governance** — The council deliberates on its own rules via a fixed epistemic panel with a >80% supermajority; advisory-only, logged to `governance-log.json` with immutable, revertible entries. No competitor lets the council govern itself.
16. **Custom Mind Builder** — Cast-agnostic markdown scaffold + CLI (`council advisor create/validate/list`, `council researcher create/validate/list`) to extend the pool; validated custom Minds join auto-selection and profiles under the same enforcement guarantees. Tool-neutral, no runtime.

## Researchers vs Deep-Research Systems

The researcher Minds retrieve external evidence and return a cited **Research Verdict**.
Positioning is **adversarial evidence auditing**, not accuracy amplification — three sources
(arXiv 2601.19921, ACL 2026 Findings 1694, 2511.07784) caution against the "debate makes research
more accurate" framing, so we do not make that claim.

### Differentiated (no occupant found in the landscape review)

1. **Retrieval diversity via named retrieval lenses** with territory exclusivity.
2. **Evidence-gated anti-conformity** — a concession requires a cited source id, not just disagreement.
3. **Enforcement Scan on citation coverage AND source-independence groups.**
4. **Research verdict preserves calibrated dissent** + "what would change my mind".
5. **Falsifiers on every research verdict.**
6. **Per-finding calibration tracking** over time.
7. **Vendor-neutral, markdown-only** (competitors are Python/LangGraph/DSPy-bound).
8. **Research → Decision chaining** with dissent preserved at both layers.
9. **Independence grouping** — N sources from one origin counted as one.

### Reinvented — acknowledged prior art (not claimed as novel)

- Perspective-driven query generation — STORM (arXiv 2402.14207).
- Parallel context-isolated retrieval subagents — Anthropic (Jun 2025).
- Retrieval coupled to an evolving debate — PROClaim P-RAG (arXiv 2603.28488).
- Fact-checker + judge in a debate graph — Deb8flow (Apr 2025).
- Per-field citations + calibrated confidence — LangChain × Parallel (Aug 2026).

### Design grounding (why retrieval carries the gain)

- Progressive RAG contributed +7.5 of +10.0pp in PROClaim's ablation — retrieval, not debate, drives the gain.
- Self-verification with identical tools fails; a separate critic with independent grounding is the proven unlock (arXiv 2606.02866) → the fact-checker retrieves but never debates or votes.
- More agents help, more rounds hurt (arXiv 2607.09099, 2502.19559) → panel grows slightly at the deep tier, round count stays capped, rounds are never a budget throttle.

> Intersection occupants (PROClaim, BLUEmed, AEGIS, MAD fact-verification, MADRA) are all
> narrow single-claim verifiers. None produce open-ended cited briefings with preserved
> dissent, which is the researcher Minds' niche.

## Known Gaps (vs Best-in-Class)

| Gap | Best Implementation | Our Plan |
|-----|---------------------|----------|
| Multi-model support | ReConcile, WISE, MindStudio | Implemented — auto-detect + evidence-type mapping |
| Persistent memory | mikeh-studio, Claw-Orchestrator | Implemented — transcript storage, cross-session analytics, advisor effectiveness tracking |
| Human-in-the-loop during debate | Agent-Debate | Implemented — opt-in checkpoints with inject/remove/redirect/skip actions |
| Confidence calibration | DiscoUQ, Roundtable Policy | Implemented — outcome feedback, calibration reports, advisor performance scoring |
| Tool/web access during deliberation | Agent4Debate, AutoGen | Delivered as the researcher Minds (a dedicated retrieval kind rather than search bolted onto advisors) |

## Key Research Findings

### Optimal Agent Count

- **Google (180 configs):** More agents often hits ceiling; degrades 39-70% when misaligned
- **"Voting or Consensus?":** More agents helps, but more rounds hurts
- **ACL 2026:** Homogeneous + uniform updates = no improvement (diversity is key)
- **Market signal:** Independent implementations converged on 4-5

**Our decision:** a small panel (default 5), backed by research + competitor validation

### Multi-Agent Debate Effectiveness

- MAD is NOT a silver bullet — often doesn't outperform self-consistency (arXiv 2311.17371)
- Structured disagreement with diverse reasoning methods IS effective
- Sparse communication topologies can match dense at lower cost
- Confidence-weighted voting outperforms simple majority

### Architecture Patterns

| Pattern | Best For | Framework |
|---------|----------|-----------|
| Supervisor-Worker | Delegation tasks | CrewAI |
| State-Graph | Complex workflows | LangGraph |
| Debate/Council | Decision-making | Council of Minds |
| Swarm | Peer collaboration | OpenAI Swarm |
| Fan-out | Parallel research | AutoGen |
