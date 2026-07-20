# Competitive Analysis — Council of Minds v2.0

> Research conducted July 2026. 25+ projects analyzed across GitHub, academic papers, and commercial frameworks.

## Landscape Overview

The multi-agent deliberation space in 2025-2026 spans three categories:

1. **General multi-agent frameworks** — AutoGen, CrewAI, LangGraph (debate is one pattern among many)
2. **Dedicated debate/council systems** — Council of Minds, Councilverse, Deb8flow, Council of Five, Agent-Debate
3. **Academic research** — ReConcile, WISE, MAD, CascadeDebate, DiMo

## Projects Researched

| # | Project | Type | Agents | Key Mechanism |
|---|---------|------|--------|---------------|
| 1 | Councilverse (Relay-Launch) | GitHub, 2026 | Variable | 15 methodologies, three-valued voting |
| 2 | Multi-Agent Council (mikeh-studio) | GitHub, 2026 | Variable | Local-first, persistent transcripts |
| 3 | AI-Debate-Council (Evan1108) | GitHub, 2026 | Teams | Evidence tracking, deep analytics |
| 4 | Agent4Debate (ZhangYiqun) | GitHub, 2024 | 4 | Searcher + Analyzer + Writer + Reviewer |
| 5 | Agent-Debate (starshine-f) | GitHub | 9 | AI-vs-AI and Human-vs-AI |
| 6 | Multi-Agent-Debate (muthuspark) | GitHub, 2025 | 3 | LangGraph + Claude, lightweight |
| 7 | Deb8flow (iason-solomos) | GitHub, 2025 | 5 | Pro + Con + Moderator + Fact Checker + Judge |
| 8 | Council of Five (counciloffive) | GitHub, 2026 | 5 | 4-layer governance, autonomous |
| 9 | AI Agent Society (ekreloff) | GitHub, 2024 | 8 | Constitutional governance |
| 10 | Council-Review (ngmeyer) | Claude skill, 2026 | 5 | DMAD, anonymous peer review |
| 11 | LLM-Council-Skill (tenfoldmarc) | Claude skill, 2026 | 5 | Karpathy-inspired |
| 12 | Council for Claude (thebigz) | Plugin, 2026 | 5+1 | Isolated subagent contexts |
| 13 | ECC Council (affaan-m) | Skill, 2024 | 4 | Four-voice structured disagreement |
| 14 | Claw-Orchestrator (Enderfga) | Skill, 2026 | Variable | Git worktree isolation |
| 15 | AutoGen (Microsoft) | Framework | N | GroupChat, event-driven (v0.4) |
| 16 | CrewAI | Framework | N | Role-based crews, hierarchical |
| 17 | LangGraph | Framework | N | State-graph DAGs |
| 18 | ReConcile | Research, 2023 | 3 | Confidence-weighted, multi-model |
| 19 | WISE (MERL) | Research, 2025-2026 | Split | Solvers + Reflectors, probabilistic |
| 20 | MAD (Skytliang) | Research, 2023 | 2-3 + judge | First debate paper |
| 21 | Roundtable Policy | Research, 2025 | Multiple | Democratic committee |
| 22 | CascadeDebate | Research, 2026 | Multi-tier | Cost-aware deliberation |
| 23 | DebFlow | Research, 2025 | Multiple | Debate for workflow optimization |
| 24 | BioDesign Agent | Research, 2026 | 7 | Domain-specific LangGraph |
| 25 | DiMo | Research, 2026 | Multiple | Diverse thinking modes |
| 26 | DiscoUQ | Research, 2026 | Ensemble | Structured disagreement for UQ |
| 27 | MindStudio LLM Council | Platform, 2026 | 2-5 | Multi-model blind ranking |

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
9. **Cost Budget Mode** — 6 tiers auto-configuring panel size, mode, cross-exam
10. **Fact-Checker Mechanism** — Claim verification between rounds
11. **Debate Analytics** — Position change tracking, influence mapping, token efficiency
12. **60 Cognitive Lenses** — Largest defined advisor registry with unique reasoning methods
13. **Multi-mode** — Full / Quick / Duo / Budget tiers
14. **Agent-agnostic** — Works across 10+ AI coding clients

## Known Gaps (vs Best-in-Class)

| Gap | Best Implementation | Our Plan |
|-----|---------------------|----------|
| Multi-model support | ReConcile, WISE, MindStudio | Implemented (v3.0) — auto-detect + evidence-type mapping |
| Persistent memory | mikeh-studio, Claw-Orchestrator | Implemented (v3.1) — transcript storage, cross-session analytics, advisor effectiveness tracking |
| Human-in-the-loop during debate | Agent-Debate | Implemented (v3.0) — opt-in checkpoints with inject/remove/redirect/skip actions |
| Confidence calibration | DiscoUQ, Roundtable Policy | Implemented (v3.1) — outcome feedback, calibration reports, advisor performance scoring |
| Tool/web access during deliberation | Agent4Debate, AutoGen | Under evaluation |

## Key Research Findings

### Optimal Agent Count (2025-2026)

- **Google (180 configs):** More agents often hits ceiling; degrades 39-70% when misaligned
- **"Voting or Consensus?":** More agents helps, but more rounds hurts
- **ACL 2026:** Homogeneous + uniform updates = no improvement (diversity is key)
- **Market signal:** All independent implementations converged on 4-5

**Our decision:** 4-6 (default 5), backed by research + competitor validation

### Multi-Agent Debate Effectiveness

- MAD is NOT a silver bullet — often doesn't outperform self-consistency (arXiv 2311.17371)
- Structured disagreement with diverse reasoning methods IS effective
- Sparse communication topologies can match dense at lower cost
- Confidence-weighted voting outperforms simple majority

### Architecture Patterns (2026 Landscape)

| Pattern | Best For | Framework |
|---------|----------|-----------|
| Supervisor-Worker | Delegation tasks | CrewAI |
| State-Graph | Complex workflows | LangGraph |
| Debate/Council | Decision-making | Council of Minds |
| Swarm | Peer collaboration | OpenAI Swarm |
| Fan-out | Parallel research | AutoGen |

---

*Last updated: July 2026*
