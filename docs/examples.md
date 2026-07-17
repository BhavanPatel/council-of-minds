# Examples

Real-world council sessions demonstrating the full deliberation process and verdict output format.

## Table of Contents

### Full Output Examples (showing verdict format)
- [Example 1: Open-Source Decision (Strategy Profile — Full Mode)](#example-1-open-source-decision-strategy-profile--full-mode)
- [Example 2: Duo Mode — Quick Binary Decision](#example-2-duo-mode--quick-binary-decision)
- [Example 3: Quick Mode — Production Incident](#example-3-quick-mode--production-incident)

### Input Examples by Profile
- [Engineering Profile](#engineering-profile)
- [Product Profile](#product-profile)
- [Risk Profile](#risk-profile)
- [AI-ML Profile](#ai-ml-profile)
- [Innovation Profile](#innovation-profile)
- [Creative Profile](#creative-profile)
- [People Profile](#people-profile)
- [Finance Profile](#finance-profile)
- [Legal Profile](#legal-profile)
- [Science Profile](#science-profile)
- [Operations Profile](#operations-profile)

### Input Examples by Mode & Budget
- [Budget Mode — Lean](#budget-mode--lean)
- [Budget Mode — Deep](#budget-mode--deep)
- [Cost Budget — Explicit Token Limit](#cost-budget--explicit-token-limit)

### Feature Examples
- [Fact-Checker in Action](#fact-checker-in-action)
- [Early Termination Example](#early-termination-example)
- [Analytics Tracking](#analytics-tracking)

### Reference
- [Follow-Up Commands](#follow-up-commands-work-after-any-verdict)

---

## Example 1: Open-Source Decision (Strategy Profile — Full Mode)

### User Input

```
strategy council: Should we open-source our internal agent framework to build community 
and attract contributors, or keep it proprietary to maintain competitive advantage?

Context: We're a 30-person AI startup. The framework powers our paid product. Two funded 
competitors exist. We have 4 enterprise customers. Team morale is mixed — engineers want 
to open-source, leadership is cautious. No VC pressure either way.
```

### What the User Sees (Final Verdict)

---

## Council Verdict: Open-Source the Agent Framework

### Problem
Whether to open-source the internal agent framework — trading competitive moat for community leverage, contributor pipeline, and developer mindshare — given 2 funded competitors, 4 enterprise customers, and team morale pressure.

### Council Composition
**Profile:** Strategy | **Mode:** Full | **Panel:** 6 advisors
- strategist (1.5x domain-weight — competitive positioning is the core question)
- realist
- inverter
- timer
- tail-watcher
- systems-mapper

### Vote Tally
- `open-source with guardrails` — 3.75 (strategist [1.5x, high = 1.5], timer [1.0x, high = 1.0], systems-mapper [1.0x, high = 1.0], realist [1.0x, low = 0.25])
- `keep proprietary` — 0.5 (tail-watcher [1.0x, low = 0.5])
- `delay 6 months` — 0.75 (inverter [1.0x, med = 0.75])
- W_total: 5.0 | Threshold: 3.33 | **CONSENSUS on open-source with guardrails**

### Consensus
- The framework itself is not the moat — the orchestration layer, training data, and hosted infrastructure are
- Open-sourcing forces competitors to compete on YOUR terrain (your architecture, your API surface)
- Team morale cost of NOT open-sourcing is real and compounds (engineer attrition risk)
- Enterprise customers care about the hosted product, not the open-source framework
- Open-source with a delayed-release model (features hit OSS 60-90 days after paid product) satisfies both sides

### Key Insights by Member
- **strategist** (1.5x): Open-sourcing is offensive, not defensive. You define the standard. Competitors must either adopt your architecture (amplifying your ecosystem) or build incompatibly (fragmenting their reach). Either outcome favors you.
- **realist**: Engineers want open-source because it builds their personal brand. This is not purely altruistic — but the incentive alignment means they will contribute more to quality if the world sees it. Harness this.
- **timer**: Competitor A just raised Series B and is 3 months from launching their framework. Open-sourcing NOW pre-empts them. Waiting means reacting to their narrative.
- **systems-mapper**: Open-source creates a reinforcing loop: contributors -> ecosystem -> adoption -> hiring pipeline -> better engineers -> better framework -> more contributors. Proprietary has no equivalent flywheel.
- **inverter**: The surest path to failure is releasing a half-baked framework with no documentation, getting negative community reception, and poisoning the well. The risk is not "should we" but "are we ready."
- **tail-watcher**: Irreversibility is real. You cannot un-release code. If a funded competitor forks and out-executes you, the framework becomes their weapon.

### Points of Disagreement
**Timer vs Inverter:** Timer says "now, before Competitor A launches." Inverter says "only when documentation is production-grade." Resolution: code is ready (powers production), docs need 3-4 weeks. Launch target: 5 weeks.

**Tail-watcher vs Strategist:** Fork risk is flagged as potentially existential vs ecosystem advantage that compounds faster than a fork can diverge. Irreducible tension — depends on execution speed.

### Blind Spots Caught
- **Licensing choice** — no advisor modeled MIT vs Apache 2.0 vs BSL competitive dynamics
- **Enterprise customer contracts** — what changes in negotiating position when core is open?
- **Maintenance burden** — growth flywheel assumes contributors are net-positive; early OSS often has high issue-to-PR ratios

### Minority Report
**tail-watcher** (DEALBREAKER: no, confidence: low): "Open-sourcing is irreversible. A well-funded competitor ($40M) could fork, add proprietary extensions, and target enterprise customers with 'same architecture, better support' within 6 months. Delayed-release only delays this by 90 days." Chairman response: Valid, mitigated by BSL licensing + keeping orchestration layer proprietary.

### Acceptable Compromises
- Competitors WILL study the codebase (mitigated by keeping orchestration + data proprietary)
- 3-4 week documentation sprint delays competitive timing by ~1 month
- Maintenance burden requires 1 engineer at 50% for first 6 months
- Delayed-release means OSS users are always 60-90 days behind paid customers

### Kill Criteria
- If 0 external contributors after 4 months -> community play failed; re-evaluate
- If a funded competitor forks AND signs 2+ enterprise deals within 6 months -> tighten what is open
- If engineer attrition increases despite open-sourcing -> morale driver was misdiagnosed

### The Recommendation
**Open-source the agent framework** with BSL licensing (converts to Apache 2.0 after 3 years). Keep orchestration layer, training data, hosted infrastructure, and enterprise features proprietary. 60-day delayed release for new features. Launch in 5 weeks after documentation sprint.

### Concrete Next Step
Publish the framework architecture overview and contribution guide as a pre-announcement blog post by end of next week.

### Unresolved Questions
- What modules constitute "orchestration layer" vs "base framework"? (needs engineering lead)
- BSL vs Apache 2.0 — legal review on enterprise contract implications
- Is documentation actually 3-4 weeks from production quality? (needs audit)

---
Session: full | Panel: 6 | Rounds: 5 | Domain-weight: strategist (1.5x) | Evidence mix: strategic 40%, empirical 25%, heuristic 20%, mechanistic 15%

---

## Example 2: Duo Mode — Quick Binary Decision

### User Input

```
duo this: Should we use PostgreSQL or DynamoDB for our new event store?
Context: Write-heavy (50K events/sec peak), need ordered streams per entity, 
team knows Postgres well, AWS-native infrastructure, 18-month runway.
```

### What the User Sees

---

## Council Verdict: PostgreSQL vs DynamoDB for Event Store

### Problem
Event store technology selection for a write-heavy (50K/sec peak) system requiring ordered streams per entity, given team PostgreSQL expertise and AWS-native infrastructure.

### Council Composition
**Mode:** Duo | **Polarity pair:** architect vs shipper

### architect's Position

The event store has a clear computational skeleton: append-only writes, ordered reads per partition key, eventual fan-out. Both can model this — abstraction fit differs.

**PostgreSQL:** Native SERIAL ordering. Complex cross-stream queries. Strong consistency. But: 50K writes/sec requires careful partitioning + PgBouncer + replicas. Manual scaling.

**DynamoDB:** Partition key = entity ID gives ordered streams at any scale. 50K writes/sec is routine. But: cross-stream queries need GSIs or separate read models. No ad-hoc SQL.

If the event store is ONLY an event store, DynamoDB fits tighter. If it doubles as queryable store, PostgreSQL wins.

STANCE: DynamoDB | CONFIDENCE: medium | DEALBREAKER: no

### shipper's Position

The team knows Postgres. That is the answer.

50K events/sec with table partitioning + TimescaleDB works without exotic infra. Team debugs at 3 AM. They know failure modes, migrations, monitoring.

DynamoDB introduces: new operational knowledge, new failure modes, new cost modeling, vendor lock-in. The "team knows it" advantage compounds: faster development, faster incidents, faster onboarding.

18 months of runway. Spending 2 months learning DynamoDB = 11% of runway on infrastructure that does not differentiate your product.

STANCE: PostgreSQL | CONFIDENCE: high | DEALBREAKER: no

### Synthesis

| Dimension | architect (DynamoDB) | shipper (PostgreSQL) |
|-----------|---------------------|---------------------|
| Abstraction fit | Tighter for pure event store | Wins if queries needed |
| Team knowledge | Learning required | Immediate productivity |
| Scale confidence | Trivial at 50K/sec | Achievable with partitioning |
| Operational risk | New failure modes | Known failure modes |
| Runway impact | -11% to learning | Ship from day one |

**Verdict:** PostgreSQL. 18-month runway means team velocity > theoretical scaling headroom. 50K writes/sec is within Postgres range with proper partitioning.

**Kill Criteria:** If p99 write latency exceeds 50ms after Postgres partitioning, revisit DynamoDB.

**Next Step:** Benchmark PostgreSQL with partitioned event table at 50K writes/sec by end of this week.

---
Session: duo | Panel: 2 (architect vs shipper) | Rounds: 3

---

## Example 3: Quick Mode — Production Incident

### User Input

```
quick council: Our main API is returning 500s at 2% rate since this morning's deploy. 
Should we rollback immediately or investigate first?

Context: Deploy was 47 files across 3 services. No obvious single culprit. 
2% error rate above SLA (0.5%). Revenue impact: ~$200/hour. 
Rollback takes 8 minutes. Investigation: 30min-2hrs.
```

### What the User Sees

---

## Council Verdict: Rollback vs Investigate

### Problem
Whether to rollback a 47-file deploy causing 2% 500s (4x above SLA) or investigate first. Revenue impact $200/hour, rollback takes 8 minutes.

### Council Composition
**Profile:** Risk (auto-selected) | **Mode:** Quick | **Panel:** 6
Domain-weight: tail-watcher (1.5x) — production incident with SLA breach

### Vote Tally
- `rollback immediately` — 4.25 (tail-watcher [1.5x, high = 1.5], shipper [1.0x, high = 1.0], inverter [1.0x, high = 1.0], bias-hunter [1.0x, med = 0.75])
- `investigate first (15min timebox)` — 1.5 (systems-mapper [1.0x, high = 1.0], stoic [1.0x, low = 0.5])
- W_total: 5.75 | Threshold: 3.83 | **CONSENSUS: rollback**

### Consensus
- 8-minute rollback cost ($26) is trivial vs 30min-2hr investigation ($100-$400) while SLA breached
- 47 files across 3 services = impossible to isolate quickly
- You can investigate AFTER rolling back
- Every minute of investigation extends the breach

### Key Insights by Member
- **tail-watcher** (1.5x): Error rate could be GROWING. Unknown failure modes in 47-file deploys can cascade.
- **bias-hunter**: Anchoring on "2% isnt catastrophic" — but SLA is 0.5%. You are 4x over. Bias toward investigating (feels productive) over rollback (faster resolution).
- **systems-mapper** (dissent): Rolling back may MASK the bug. If data-dependent, it resurfaces on re-deploy.

### Minority Report
**systems-mapper**: If the bug is data-dependent (entity state that did not exist in staging), rollback only delays failure. 15-minute grep of error logs by endpoint would reveal code-caused vs data-caused. Cost: $50. Value: avoid second rollback cycle.

### Kill Criteria
- If error rate exceeds 5% at any point -> abort investigation, rollback immediately

### The Recommendation
**Rollback immediately.** 8 min x $200/hr = $26 to restore SLA. Investigation = $100-$400 while breached. Rollback first, investigate the diff afterward. Systems-mapper's point is valid but does not require keeping broken code live.

### Concrete Next Step
Run `kubectl rollout undo deployment/api-gateway deployment/service-a deployment/service-b` now.

### Unresolved Questions
- Is error rate stable or growing? (check before rollback completes)
- Does error correlate with specific entity IDs? (investigate post-rollback)

---
Session: quick | Panel: 6 | Rounds: 3 | Domain-weight: tail-watcher (1.5x) | Evidence mix: empirical 50%, heuristic 30%, mechanistic 20%

---

## Verdict Format Reference

Every council verdict follows this structure:

```
## Council Verdict: {topic}
|-- Problem (1-2 sentences)
|-- Council Composition (who, why, domain-weight)
|-- Vote Tally (weighted, auditable, threshold check)
|-- Consensus (convergence points)
|-- Key Insights by Member (attributed, 1-2 sentences each)
|-- Points of Disagreement (both sides named)
|-- Blind Spots Caught (peer review findings)
|-- Minority Report (strongest dissent + DEALBREAKER status)
|-- Acceptable Compromises (what verdict gives up)
|-- Kill Criteria (when to revisit)
|-- The Recommendation (clear answer with reasoning)
|-- Concrete Next Step (one action: verb-object-date)
|-- Unresolved Questions (what council could not answer)
|-- Session metadata footer
```

---

## Input Examples by Profile

The 3 examples above demonstrate the full verdict output format. Below are input-only examples showing how to trigger each profile — the output follows the same structured format.

---

### Engineering Profile

```
engineering council: Should we migrate from our monolith to microservices, 
or extract just the payment service as a standalone?

Context: 200K LOC Python monolith (Django), team of 12 engineers. Currently 
handling 500 req/s. Payment service is the most-changed module (40% of PRs). 
Deployment takes 45 minutes. One junior dev broke payments by changing an 
unrelated model last sprint. Team has zero Kubernetes experience.
Stakes: Irreversible architecture shift. 6-month migration minimum.
```

---

### Product Profile

```
product council: Should we build our own onboarding wizard or use a third-party 
tool like Appcues/Userflow?

Context: B2B SaaS, 200 paying customers, 35% drop-off during onboarding. 
Engineering team is stretched (2 sprints behind on roadmap). Budget: $500/mo 
for tooling. Competitors have slick onboarding. Our current onboarding is 
a 4-page docs link sent via email.
```

---

### Risk Profile

```
risk council: Should we accept this enterprise customer's request for 
on-premise deployment, or hold firm on cloud-only?

Context: $400K ARR customer threatening to churn. They need on-prem for 
regulatory reasons (healthcare data). We have zero on-prem infrastructure 
or documentation. Team of 15. Three other enterprise prospects have asked 
the same question. Current MRR: $180K.
Stakes: Irreversible — once we support on-prem, we maintain two deployment 
models forever. But losing $400K is 22% of revenue.
```

---

### AI-ML Profile

```
ai-ml council: Should we fine-tune an open-source model (Llama 3) or use 
GPT-4o via API for our customer support automation?

Context: E-commerce company, 2000 tickets/day, 60% are repetitive (shipping, 
returns, order status). Current accuracy with GPT-4o prompting: 78%. Need 95%+ 
for autonomous resolution. Budget: $15K/month for AI infra. Team has 1 ML 
engineer. Data: 50K labeled ticket-response pairs from last 2 years.
Constraints: GDPR compliance required. Response latency must be <2s.
```

---

### Innovation Profile

```
innovation council: We've been a B2B analytics dashboard for 5 years. 
Should we pivot toward AI-powered insights, build an agent marketplace, 
or double down on our current dashboard with better UX?

Context: $2M ARR, flat growth for 18 months. 800 customers but NPS dropped 
from 45 to 32. Three AI-native competitors launched in the last year. Our 
data pipeline is strong but UI is dated. Team of 20, half are backend/data 
engineers. $3M runway remaining.
```

---

### Creative Profile

```
creative council: We need to name our new developer productivity tool. 
It's a CLI that watches your code changes, predicts what you're building, 
and auto-generates tests, docs, and deployment configs.

Context: Target audience is senior engineers who hate boilerplate. Competitors 
are named Copilot, Cursor, Windsurf, Cody. We want something that signals 
"anticipatory" and "invisible effort" without being cute or forgettable. 
Need both a product name and a tagline.
```

---

### People Profile

```
people council: Our senior backend engineer (8 years at the company, respected 
by everyone) just told me privately she's thinking of leaving. She says she 
feels "invisible" despite being promoted last year. Her team loves her but she 
reports to a new VP who she says "doesn't get engineering culture."

Context: She's the technical anchor for our payments team. Losing her would 
set that team back 6+ months. The new VP came from a sales-heavy org 3 months 
ago. Other engineers have mentioned feeling "managed" rather than "led" since 
the VP started. We can't just throw money at this.
```

---

### Finance Profile

```
finance council: We have $2M in the bank and need to decide between three 
options: (A) hire 4 more engineers at $800K/year burn increase, (B) spend 
$500K on a marketing push to accelerate revenue, or (C) acquire a small 
competitor for $1.2M who has 50 customers and a complementary product.

Context: Current MRR $120K growing 8% MoM. 18 months runway at current burn. 
Team of 8. Our product is technically superior but competitor has better 
distribution. Acquisition target is profitable but barely growing.
```

---

### Legal Profile

```
legal council: A competitor just launched a product that looks identical to 
our UI — same layout, same color scheme, same workflow. Their marketing even 
uses phrases from our website. Should we pursue legal action?

Context: We're a 20-person B2B SaaS. They're a well-funded startup (Series A, 
$12M raised). We have no patents but our product has been live for 3 years. 
We have screenshots showing they copied our onboarding flow step-by-step. 
They launched 2 months ago and are already signing some of our prospects.
Constraints: Legal budget is limited (~$50K max). We're in the US, they're 
incorporated in Delaware but team is remote/international.
```

---

### Science Profile

```
science council: Our A/B test shows the new checkout flow has 12% higher 
conversion, but the sample size is only 800 users over 5 days. Should we 
ship it to 100% of traffic?

Context: E-commerce, $5M monthly GMV. Control: 3.2% conversion. Variant: 
3.58% conversion. p-value: 0.04. But the test ran over a weekend + 3 weekdays, 
and we know weekend traffic converts differently. Three previous "winning" 
A/B tests reverted within 2 weeks after full rollout.
Stakes: If real, 12% lift = $600K additional annual GMV. If false positive, 
we degrade UX for millions of sessions while we re-test.
```

---

### Operations Profile

```
operations council: We need to migrate 500 enterprise customers from our 
legacy platform to the new one within 6 months. What's the execution strategy?

Context: Legacy platform is PHP/MySQL, new is Go/PostgreSQL. Customer data 
ranges from 1GB to 500GB per account. Downtime tolerance varies: 40% need 
zero-downtime, 60% accept a 2-hour maintenance window. Team of 6 for migration. 
Three previous attempts at "big bang" migration failed. Customers are already 
frustrated with delays.
Constraints: Cannot run both platforms beyond 6 months (cost + security patches).
```

---

## Input Examples by Mode & Budget

---

### Budget Mode — Lean

```
lean council: Redis or Memcached for our session store?

Context: 10K concurrent users, AWS infrastructure, team knows Redis, 
need sub-5ms latency, sessions expire after 30 minutes.
```

---

### Budget Mode — Deep

```
deep council: Should we raise a Series B now at a lower valuation, or wait 
6 months hoping metrics improve?

Context: SaaS, $3M ARR growing 8% MoM (was 15% 6 months ago). Two term 
sheets: $20M at $80M pre vs waiting for $30M at $120M+ if growth re-accelerates. 
Runway: 14 months. Market is cooling. Three portfolio companies of our lead 
investor went under this quarter. Team: 35 people, burn $450K/month.
Stakes: Dilution is permanent. But running out of cash is fatal.
```

---

### Cost Budget — Explicit Token Limit

```
council this with ~8k token budget: Should we use Postgres or MongoDB 
for our new event store?

Context: 50K events/day, need flexible schema, team knows Postgres, 
running on AWS with RDS already provisioned.
```

---

## Feature Examples

---

### Fact-Checker in Action

```
engineering council: Should we rewrite our real-time sync engine in Rust, 
or optimize the existing Node.js implementation?

Context: Current p99 latency is 340ms, target is sub-50ms. Processing 
10K messages/sec. Memory usage spikes to 4GB under load. Team: 8 engineers, 
2 have Rust experience. Competitor's Rust-based sync achieves 12ms p99.
```

*In this session, the fact-checker would flag claims like "Competitor's Rust-based sync achieves 12ms p99" as UNVERIFIABLE and "Node.js cannot achieve sub-50ms at 10K msg/sec" (if any advisor claims this) as DISPUTED.*

---

### Early Termination Example

When 4 out of 5 advisors reach the same stance with high confidence after cross-examination, and no DEALBREAKER is flagged, the council skips the crystallization round:

```
quick council: Should we use GitHub Actions or GitLab CI for our new project?

Context: Team of 6, all code on GitHub, need Docker builds + deploy to AWS ECS. 
No existing CI. Budget is not a constraint. Need it running this week.
```

*Likely outcome: strong consensus on GitHub Actions (code already on GitHub, simpler setup, same-week timeline). Early termination fires → saves ~30% tokens.*

---

### Analytics Tracking

```
council this with analytics: Should we acquire this 5-person startup 
or build the feature in-house?

Context: They have a working product with 200 users. Would take us 4 months 
to build equivalent. Asking price: $2M. Our engineering team has capacity 
in Q1. Their tech stack is incompatible with ours (Ruby vs our Go).
```

*Session analytics tracked: position changes, who convinced whom, token usage per round, consensus strength. Available via "council stats" after session.*

---

## Follow-Up Commands (work after any verdict)

```
expand on the tail-watcher's point
```
```
challenge the verdict with: our CTO says we must ship by December regardless
```
```
weight toward risk
```
```
re-run with innovation profile
```
```
duo architect vs shipper on this
```
```
council stats
```
```
save transcript
```
