# Architecture

Council of Minds uses an **Orchestrator + Parallel Subagents** pattern with a 5-round deliberation protocol, structured cross-examination, enforcement scanning, and confidence-weighted voting.

---

## How It Works

```mermaid
graph LR
    Q["Your Question"] --> S0["Frame + Select Panel"]
    S0 --> S1["Problem Restate Gate"]
    S1 --> S2["Independent Analysis<br/>(parallel)"]
    S2 --> S3["Cross-Examination<br/>(parallel)"]
    S3 --> S4["Enforcement Scan"]
    S4 --> S5["Crystallization<br/>(parallel)"]
    S5 --> S6["Vote Tally + Verdict"]
    S6 --> S7["Follow-Up"]
```

---

## Full Process (8 Steps)

```mermaid
sequenceDiagram
    participant U as User
    participant O as Orchestrator
    participant A as Advisors (4-6)
    participant C as Chairman

    U->>O: "council this: [question]"

    Note over O: STEP 0: Frame + Panel Selection
    O->>O: Parse question, scan workspace
    O->>O: Select profile, assign domain-weight (1.5x)

    Note over O,A: STEP 1: Problem Restate Gate
    O->>A: Each restates in 1 sentence
    A-->>O: If 3+ reframe differently → surface to user

    Note over O,A: STEP 2: Independent Analysis
    O->>A: Spawn parallel (300 words each)
    A-->>O: STANCE + CONFIDENCE + DEALBREAKER + evidence label

    Note over O,A: STEP 3: Cross-Examination
    O->>A: Each sees all others, produces Disagree/Strengthen/Update
    A-->>O: Position updates with evidence labels

    Note over O: STEP 4: Enforcement Scan
    O->>O: Check dissent quota, novelty, evidence diversity, engagement

    Note over O,A: STEP 5: Crystallization
    O->>A: 100-word final declarative positions
    A-->>O: Final STANCE + CONFIDENCE + DEALBREAKER

    Note over O,C: STEP 6-7: Vote Tally + Synthesis
    O->>C: All rounds + votes + enforcement results
    C-->>O: Structured verdict

    O->>U: Council Verdict

    Note over U,O: STEP 8: Follow-Up
    U->>O: "expand" / "challenge" / "reweight" / "re-run"
```

---

## Three Modes

```mermaid
graph TD
    subgraph Full["Full Mode (5 rounds)"]
        F0[Restate Gate] --> F1[Analyze] --> F2[Cross-Examine] --> F3[Enforce] --> F4[Crystallize] --> F5[Synthesize]
    end

    subgraph Quick["Quick Mode (3 rounds)"]
        Q1[Analyze] --> Q2[Cross-Examine] --> Q3[Synthesize]
    end

    subgraph Duo["Duo Mode (polarity pair)"]
        D1[Position] --> D2[Rebuttal] --> D3[Synthesize]
    end
```

| Mode | When to Use | Rounds | Panel |
|------|-------------|--------|-------|
| **Full** | Complex decisions with genuine uncertainty | 5 | 4-6 advisors |
| **Quick** | Time-sensitive, lower stakes | 3 | 4-6 advisors |
| **Duo** | Binary choice, rapid opposing views | 3 | 2 (polarity pair) |

---

## Profile Selection

```mermaid
flowchart TD
    Start[User triggers council] --> Explicit{Explicit profile?}

    Explicit -->|"engineering council:"| Use[Use specified profile]
    Explicit -->|"council this:"| Keywords[Score against keyword maps]

    Keywords --> Top["Select top 7 by relevance"]
    Top --> Challenger{Challenger included?}

    Challenger -->|Yes| Weight[Assign domain-weight 1.5x to top scorer]
    Challenger -->|No| Add[Add questioner/subtractor/reframer/provocateur]
    Add --> Weight
    Weight --> Done[Final panel ready]
    Use --> Done
```

---

## Cross-Examination (Not Anonymized)

Advisors see each other's names during cross-examination. This enables direct engagement with specific claims:

```
### Disagree: {member name}
{Their specific claim + why it fails}

### Strengthened by: {member name}
{Their insight that improves my position}

### Position Update
{What changed and what held — must name the flaw if updating}

### Evidence Label
{empirical | mechanistic | strategic | ethical | heuristic}
```

**Anti-conformity directive:** Position updates ONLY allowed when the advisor can name a specific flaw exposed by another member. "I changed my mind because peers disagree" is rejected.

---

## Enforcement Scan

Before crystallization, the orchestrator verifies quality:

| Check | Pass Criteria | On Fail |
|-------|---------------|---------|
| Dissent quota | At least 2 genuinely different positions | Prompt re-examination |
| Novelty gate | Each Round 2 has content not in Round 1 | Request revision |
| Evidence diversity | Not >80% same evidence type | Flag "reasoning monoculture" |
| Engagement quality | Each advisor cited a specific peer claim | Request deeper engagement |

---

## Vote Tally

```mermaid
flowchart LR
    A[Each Advisor] --> Stance[STANCE + CONFIDENCE + DEALBREAKER]
    Stance --> Weight["Weight = base x domain x confidence"]
    Weight --> Sum[Sum per option]
    Sum --> Threshold{"Option >= 2/3 total?"}
    Threshold -->|Yes| Consensus[CONSENSUS]
    Threshold -->|"No, but >50%"| Super[SUPERMAJORITY]
    Threshold -->|No| Split[SPLIT - present both sides]
```

**Weight formula:**
- Base: 1.0 (all advisors)
- Domain seat: x1.5 (one per session)
- Confidence: high = x1.0, medium = x0.75, low = x0.5

---

## Verdict Structure

```mermaid
graph TD
    V[Council Verdict] --> Problem[Problem]
    V --> Composition[Council Composition + Domain Weight]
    V --> Tally[Vote Tally - auditable]
    V --> Consensus[Consensus]
    V --> Insights[Key Insights by Member]
    V --> Disagree[Points of Disagreement]
    V --> Blind[Blind Spots Caught]
    V --> Minority[Minority Report + DEALBREAKER]
    V --> Compromise[Acceptable Compromises]
    V --> Kill[Kill Criteria - when verdict expires]
    V --> Rec[Recommendation]
    V --> Next[Concrete Next Step]
    V --> Unresolved[Unresolved Questions]
```

---

## Multi-Model Diversity

The system auto-detects available model backends and assigns different models to different evidence-type groups for genuine reasoning diversity.

```mermaid
flowchart TD
    Start[Panel Selected] --> Detect{How many models available?}
    
    Detect -->|"3+"| Multi[Multi-Model Assignment]
    Detect -->|"2"| Dual[Dual-Model Split]
    Detect -->|"1"| Single[Single-Model + Variation]
    
    Multi --> Group[Group advisors by evidence_type]
    Group --> Assign[Map groups to model-a/b/c]
    Assign --> Check{Any model >50%?}
    Check -->|No| Done[Assignment Complete]
    Check -->|Yes| Rotate[Rotate overflow to other models]
    Rotate --> Done
    
    Dual --> Split[Empirical+Strategic → model-a\nMechanistic+Heuristic → model-b]
    Split --> Done
    
    Single --> Vary[Prepend reasoning-variation directive per evidence type]
    Vary --> Done
```

| Mode | Condition | What happens |
|------|-----------|-------------|
| **Multi-model** | 3+ models detected | Each evidence-type cluster gets a different backend |
| **Dual-model** | 2 models detected | Split by complementary reasoning styles |
| **Single-model varied** | 1 model (most common) | Reasoning-variation directives create cognitive diversity |

**Key principle:** Zero config required. Auto-detects and maximizes diversity with whatever is available. Users CAN override with explicit model mapping in config.

---

## Interactive Mode (Human-in-the-Loop)

Opt-in checkpoints that pause deliberation after Round 1 and Round 2, allowing user intervention mid-session.

### Sequence Diagram

```mermaid
sequenceDiagram
    participant U as User
    participant O as Orchestrator
    participant P as Panel (4-6 advisors)

    U->>O: "interactive council: [question]"
    O->>P: Round 0: Framing + Panel Selection
    O->>P: Round 1: Independent Analysis
    P-->>O: Structured analyses
    O-->>U: CHECKPOINT 1 (after Round 1)
    Note over U,O: Options: continue / inject / remove / redirect / skip

    alt User continues
        U->>O: continue
    else User injects context
        U->>O: inject: [new info]
        O->>O: Prepend context to next round
    else User removes advisor
        U->>O: remove: [advisor]
        O->>O: Drop advisor from remaining rounds
    else User redirects
        U->>O: redirect: [new framing]
        O->>O: Replace question for remaining rounds
    else User skips
        U->>O: skip to verdict
        O->>O: Synthesize from current positions
    end

    O->>P: Round 2: Cross-Examination
    P-->>O: Engagement responses
    O-->>U: CHECKPOINT 2 (after Round 2)
    Note over U,O: Same options as Checkpoint 1

    U->>O: continue
    O->>P: Round 3-5: Enforcement → Crystallization → Synthesis
    O-->>U: Final Verdict
```

### Action Effects

| Action | Effect | Scope |
|--------|--------|-------|
| `continue` | No change, proceed normally | Default — zero overhead |
| `inject: {context}` | New info prepended to all remaining prompts | Affects all subsequent rounds |
| `remove: {advisor}` | Advisor produces no further output; prior contributions remain | Panel size decreases by 1 |
| `redirect: {question}` | Original question replaced for remaining rounds | Previous rounds still inform synthesis |
| `skip to verdict` | Chairman synthesizes immediately | Verdict notes early exit |

---

## Key Design Decisions

| Decision | Choice | Why |
|----------|--------|-----|
| Named cross-examination | Direct engagement with specific claims | "The shipper's argument ignores X" is more useful than "Response B is weak" |
| Anti-conformity directive | Must name flaw to update | Prevents groupthink collapse from social pressure |
| Enforcement scan | Quality gate before crystallization | Catches lazy agreement and reasoning monoculture |
| Domain-weight seat (1.5x) | One advisor weighted higher | Equal weighting is dishonest when one lens is clearly most relevant |
| Kill Criteria required | Every verdict states expiration conditions | Prevents false permanence — decisions change when facts change |
| DEALBREAKER flag | Advisors can flag fatal-flaw arguments | Chairman MUST address — cannot be buried in synthesis |
| Confidence weighting | high/med/low maps to 1.0/0.75/0.5 | Low-confidence votes count less — honest uncertainty in tally |
| Crystallization round | 100-word final positions after cross-exam | Produces clean, unambiguous inputs for chairman |
| Multi-model auto-assignment | Evidence-type → model mapping with auto-detect | Same-model panels produce correlated reasoning errors; diversity of backend creates genuine cognitive diversity |
| Interactive mode opt-in | Checkpoints only when triggered, continue is default | Most users want fast verdicts; intervention is for high-stakes sessions where mid-course correction matters |

---

## Data Flow Per Step

| Step | Input | Output |
|------|-------|--------|
| 0: Framing | Raw question + workspace | Framed question + panel + domain-weight |
| 1: Restate | Framed question | 4-6 one-sentence restatements (catches wrong questions) |
| 2: Analysis | Framed question + advisor identity | 4-6 structured analyses with STANCE/CONFIDENCE/DEALBREAKER |
| 3: Cross-exam | All Round 1 responses | 4-6 Disagree/Strengthen/Update with evidence labels |
| 4: Enforcement | All Round 2 responses | Pass/fail + revision requests if needed |
| 5: Crystallize | Post-exam positions | 4-6 declarative 100-word final positions |
| 6: Vote tally | All crystallized stances | Weighted option scores + consensus/split determination |
| 7: Synthesis | Everything above | Structured verdict (13 sections) |
| 8: Follow-up | User command + verdict | Expanded analysis / re-synthesis / transcript |
