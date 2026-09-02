# Concepts

Council of Minds is a **council of Minds**. A **Mind** is a single markdown file with one
distinct profile — one way of thinking or one way of looking. You convene a panel of Minds,
they work the problem from their different angles, and you get back a structured answer no
single perspective could have produced.

There are **two kinds of Mind**.

| Kind | What it does | You ask… | It returns |
|------|--------------|----------|------------|
| **Advisor** | reasons over a topic from its perspective, validates it, argues with the others | *what should I **do**?* — a choice, tradeoff, or judgement | a **judgement / recommendation** (with dissent preserved) |
| **Researcher** | goes and retrieves external evidence — the internet, sources, data — and reports what it found | *what **is** true?* — the state of the world, a claim, current facts | a **well-sourced answer** (with per-claim confidence and falsifiers) |

Advisors **think**. Researchers **look**. Each is just a markdown file describing a lens; the
orchestrator picks a handful of them for any given question.

## Solo or together

Minds work three ways:

- **Advisors alone** — reason to a recommendation. *"Should we migrate to event-driven
  architecture?"*
- **Researchers alone** — retrieve a sourced answer. *"What data-residency rules apply to EU
  user data right now?"*
- **Chained** — researchers first, then advisors reason over the researchers' findings. For
  compound questions like *"what should we do, given the current landscape?"* The recommendation
  cites the evidence it rests on. See [chaining.md](chaining.md).

## Why more than one Mind

Ask one AI a question and you get one answer from one angle — and no way to tell whether it is
right or just confident. A council runs the question through several independent Minds, has them
challenge each other, and surfaces where they agree, where they clash, and what the strongest
dissenting view is. The disagreement is the product.

A panel is small on purpose — a handful of Minds per session, not the whole roster. A larger
roster means better *selection*, not bigger panels.

## Installed into your agent

Council of Minds is not an app you run. It is a set of markdown Minds plus an orchestrator prompt
that an **installation CLI** copies into whatever AI coding agent you use — Kiro, Cursor, Claude,
Windsurf, Copilot, and others — each in that agent's native format. You then invoke the council
from inside your normal agent chat.

Everything is **plain markdown and tool-neutral**: no runtime, no vendor lock-in, no dependency on
any single model. Any agent that can read the Minds can convene a council.

## Where to go next

- [advisors.md](advisors.md) — the Advisor Minds: the full roster, the profiles that group them,
  and how they reason to a recommendation.
- [researchers.md](researchers.md) — the Researcher Minds: the full roster, the profiles that group
  them, how they retrieve, and what a sourced answer looks like.
- [chaining.md](chaining.md) — using Researchers and Advisors together.
- [architecture.md](architecture.md) — how the orchestrator runs a session end to end.
- [examples/](examples/) — worked sessions for each kind and for chaining.
