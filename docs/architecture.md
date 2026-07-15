# Architecture

Council of Minds uses an **Orchestrator + Parallel Subagents** pattern — the same architecture used by production multi-agent systems for code review, release readiness, and complex analysis.

---

## System Overview

```mermaid
graph TB
    User[User Input<br/>"council this: ..."] --> Orchestrator

    subgraph Orchestrator["Orchestrator (council-of-minds.md)"]
        Frame[Phase 0: Framing]
        Select[Profile Selection]
        Frame --> Select
    end

    Select --> P1

    subgraph P1["Phase 1: Independent Analysis (parallel)"]
        A1[Advisor 1]
        A2[Advisor 2]
        A3[Advisor 3]
        A4[Advisor 4]
        A5[Advisor 5]
        A6[Advisor 6]
    end

    P1 --> Anon[Anonymize: shuffle to A-F]

    Anon --> P2

    subgraph P2["Phase 2: Peer Review (parallel)"]
        R1[Reviewer 1]
        R2[Reviewer 2]
        R3[Reviewer 3]
        R4[Reviewer 4]
        R5[Reviewer 5]
        R6[Reviewer 6]
    end

    P2 --> P3[Phase 3: Chairman Synthesis]
    P3 --> Verdict[Council Verdict]
    Verdict --> Follow[Phase 4: Follow-Up Protocol]
```

---

## Phase Flow (Detailed)

```mermaid
sequenceDiagram
    participant U as User
    participant O as Orchestrator
    participant A as Advisors (5-7)
    participant R as Reviewers (5-7)
    participant C as Chairman

    U->>O: "council this: should we migrate to event-driven?"
    
    Note over O: Phase 0: Framing
    O->>O: Parse question, scan workspace context
    O->>O: Auto-select profile (engineering)
    O->>O: Frame neutral prompt with stakes

    Note over O,A: Phase 1: Independent Analysis
    O->>A: Spawn 6 advisors in parallel
    A-->>O: Each returns JSON (analysis + confidence + blind_spot)

    Note over O,R: Phase 2: Anonymized Peer Review
    O->>O: Shuffle responses to Advisor A through F
    O->>R: Each reviewer sees all anonymized responses
    R-->>O: Each returns (strongest, weakest, all_missed)

    Note over O,C: Phase 3: Chairman Synthesis
    O->>C: All responses (de-anonymized) + peer reviews + vote tally
    C-->>O: Structured verdict

    O->>U: Council Verdict (markdown)

    Note over U,O: Phase 4: Follow-Up
    U->>O: "expand on the inverter's point"
    O->>U: Deep-dive on that advisor's analysis
```

---

## Profile Selection Logic

```mermaid
flowchart TD
    Start[User triggers council] --> Explicit{Explicit profile?}
    
    Explicit -->|Yes| Use[Use specified profile]
    Explicit -->|No| Keywords[Score question against keyword maps]
    
    Keywords --> Score[Each advisor gets relevance score]
    Score --> Top7[Select top 7 by score]
    Top7 --> Challenger{Challenger included?}
    
    Challenger -->|Yes| Done[Final advisor set]
    Challenger -->|No| Add[Add highest-scoring challenger<br/>questioner / subtractor / reframer]
    Add --> Done
```

---

## Advisor Independence Model

```mermaid
graph LR
    subgraph "Phase 1: No Cross-Talk"
        A1[Architect]
        A2[Deriver]
        A3[Shipper]
        A4[Inverter]
        A5[Systems Mapper]
        A6[User Advocate]
    end

    subgraph "Phase 2: Anonymized"
        B1[Response A] --> R1[Each reviewer<br/>sees ALL]
        B2[Response B] --> R1
        B3[Response C] --> R1
        B4[Response D] --> R1
        B5[Response E] --> R1
        B6[Response F] --> R1
    end

    subgraph "Phase 3: Full Context"
        C1[All responses<br/>de-anonymized] --> Chairman
        C2[All peer reviews] --> Chairman
        C3[Vote tally] --> Chairman
        Chairman --> Verdict
    end
```

**Key design principle:** Advisors never see each other's work during Phase 1. This prevents anchoring and deference bias — the same reason jury members deliberate before seeing each other's initial votes.

---

## Anonymization Flow

```mermaid
flowchart LR
    subgraph "After Phase 1"
        architect[architect's response]
        deriver[deriver's response]
        shipper[shipper's response]
        inverter[inverter's response]
        mapper[systems-mapper's response]
        advocate[user-advocate's response]
    end

    subgraph "Random Shuffle"
        architect -->|random| D[Response D]
        deriver -->|random| A[Response A]
        shipper -->|random| F[Response F]
        inverter -->|random| B[Response B]
        mapper -->|random| E[Response E]
        advocate -->|random| C[Response C]
    end

    subgraph "Peer Review"
        A --> Reviews[Each reviewer evaluates<br/>A through F by CONTENT only]
        B --> Reviews
        C --> Reviews
        D --> Reviews
        E --> Reviews
        F --> Reviews
    end
```

**Why anonymize?** Without it, reviewers defer to "prestigious" advisors. The inverter (inspired by Munger) might get deference votes not because its reasoning is strongest but because of name recognition. Anonymization forces evaluation on merit.

---

## Verdict Structure

```mermaid
graph TD
    V[Council Verdict] --> Consensus[Consensus<br/>3+ advisors converged]
    V --> Clash[Clash Points<br/>genuine disagreements]
    V --> Blind[Blind Spots Caught<br/>emerged from peer review only]
    V --> Dissent[Strongest Dissent<br/>best minority argument]
    V --> Confidence[Confidence Meter<br/>X/N advisors align]
    V --> Rec[Recommendation<br/>clear answer, not 'it depends']
    V --> First[First Move<br/>single next action]
```

---

## Data Flow Per Phase

| Phase | Input | Processing | Output |
|-------|-------|-----------|--------|
| **0: Framing** | Raw question + workspace files | Parse domain, scan context, select profile | Framed question with stakes |
| **1: Analysis** | Framed question + advisor identity | Each advisor applies their method independently | 5-7 structured JSON responses |
| **2: Peer Review** | Anonymized responses (A-G) | Each reviewer evaluates all others | 5-7 review JSONs (strongest, weakest, missed) |
| **3: Synthesis** | De-anonymized responses + reviews + votes | Chairman aggregates and resolves | Structured verdict (markdown) |
| **4: Follow-Up** | Verdict + user command | Expand/challenge/reweight/re-run | Updated analysis |

---

## Design Decisions

| Decision | Choice | Reasoning |
|----------|--------|-----------|
| Parallel vs sequential advisors | **Parallel** | Prevents anchoring — sequential responses bleed into later ones |
| Anonymized peer review | **Yes** | Prevents deference bias to "famous" advisor names |
| Structured JSON output | **Yes** | Enables reliable aggregation and confidence scoring |
| Profile-based selection (5-7) | **Not all 18** | Signal degrades past 7 advisors; profiles optimize relevance |
| Chairman can dissent | **Yes** | Majority isn't always right — strongest reasoning wins |
| Confidence meter | **Quantified (X/N)** | Gives user immediate signal strength without reading full analysis |
| Grounding protocols per advisor | **Yes** | Prevents persona drift and generic responses |
| "Where I May Be Wrong" | **Required per advisor** | Forces epistemic humility before peer review catches blind spots |
