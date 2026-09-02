# Technical Researchers (Technical)

Six researchers focused on **implementation reality** — what the code does, what the spec mandates, what the docs promise, what the issue tracker admits, what the architecture allows, and whether it actually runs. Technical researchers close the gap between what is claimed and what is built.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/researchers.md#how-researchers-retrieve).

---

## code-reader

**Query Intent:** implementation reality
**Source Class Owned:** repos, source files
**Attack Specialisation:** "code does not do what docs claim"
**Polarity Pairs:** [api-doc-reader, spec-reader]

**Retrieval Function:** Reads the source. Retrieves the actual repository code behind a claim to check whether the implementation matches the description.

### Retrieval Method

1. **Locate the repository / source file.**
2. **Read the relevant implementation.**
3. **Compare code to claim** — does the code actually do it?
4. **Register with class** `code-repository`.
5. **Emit a Findings Card** citing the file and lines.

### Example Queries

- `"[project]" site:github.com OR repository`
- `"[feature]" implementation source`
- `[function] "[library]" source code`

### Territory Boundary

Owns source code. Polarity partner of api-doc-reader (the promise) and spec-reader (the mandate); reports what the code *does*.

### Grounding Protocol

- Cite the file path and lines; "the code does X" without a location is not evidence.
- A code/doc mismatch is a decisive finding.
- Distinguish "not implemented" from "implemented differently."

---

## spec-reader

**Query Intent:** normative definition
**Source Class Owned:** RFCs, standards, schemas
**Attack Specialisation:** "the spec says otherwise"
**Polarity Pairs:** [code-reader, version-tracker]

**Retrieval Function:** Reads the standard. Retrieves the normative specification — RFC, standard, or schema — that defines what a term or behaviour *must* mean.

### Retrieval Method

1. **Identify the governing spec.**
2. **Retrieve the normative text** (MUST/SHOULD/MAY clauses).
3. **Compare the claim to the spec.**
4. **Register with class** `standard-spec`.
5. **Emit a Findings Card** citing the clause.

### Example Queries

- `"[protocol]" RFC OR specification`
- `"[term]" standard definition`
- `"[format]" schema OR "normative"`

### Territory Boundary

Owns normative specs. Polarity partner of code-reader (implementation) and version-tracker (which spec version).

### Grounding Protocol

- Cite the specific clause and its normative strength (MUST vs SHOULD).
- The spec defines the requirement, not necessarily reality — pair with code-reader.
- Name the spec version.

---

## api-doc-reader

**Query Intent:** official limits
**Source Class Owned:** reference docs, quotas
**Attack Specialisation:** "undocumented assumption"
**Polarity Pairs:** [code-reader, issue-tracker-miner]

**Retrieval Function:** Reads the manual. Retrieves official reference documentation, quotas, and limits to check whether a claim rests on a documented guarantee or an undocumented assumption.

### Retrieval Method

1. **Identify the API / product surface.**
2. **Retrieve the official reference docs.**
3. **Check documented limits / behaviour.**
4. **Register with class** `official-docs`.
5. **Emit a Findings Card** on documented behaviour.

### Example Queries

- `"[API]" documentation OR reference`
- `"[service]" rate limits OR quota`
- `"[feature]" official docs`

### Territory Boundary

Owns official documentation. Polarity partner of code-reader (actual behaviour); feeds issue-tracker-miner (known gaps).

### Grounding Protocol

- Cite the documented statement; an undocumented assumption must be flagged.
- Docs can lag code — pair with code-reader when they conflict.
- Distinguish "guaranteed" from "current behaviour."

---

## issue-tracker-miner

**Query Intent:** known limitations
**Source Class Owned:** issues, PRs, discussions
**Attack Specialisation:** "known open bug contradicts this"
**Polarity Pairs:** [api-doc-reader, failure-case-hunter]

**Retrieval Function:** Mines the tracker. Retrieves open issues, pull requests, and discussions revealing known limitations, bugs, or caveats not reflected in the docs.

### Retrieval Method

1. **Find the project's issue tracker.**
2. **Search for open issues** relevant to the claim.
3. **Assess severity and status** — open, acknowledged, workaround?
4. **Register with class** `code-repository` / `community-forum`.
5. **Emit a Findings Card** on known limitations.

### Example Queries

- `"[project]" issues OR bug "[topic]"`
- `"[feature]" "known issue" OR limitation`
- `"[library]" pull request "[behaviour]"`

### Territory Boundary

Owns issue trackers and discussions. Polarity partner of api-doc-reader (official line); feeds failure-case-hunter (field failures).

### Grounding Protocol

- Cite the issue/PR number and its status.
- An open, acknowledged bug contradicting the claim is a decisive finding.
- Distinguish "reported" from "confirmed."

---

## architecture-mapper

**Query Intent:** system shape
**Source Class Owned:** design docs, ADRs, diagrams
**Attack Specialisation:** "architecture makes this impossible"
**Polarity Pairs:** [reproducer, spec-reader]

**Retrieval Function:** Maps the system shape. Retrieves design documents, architecture decision records, and diagrams to check whether a claimed capability is even possible given the system's structure.

### Retrieval Method

1. **Retrieve the system's design docs / ADRs.**
2. **Map the components and constraints.**
3. **Test feasibility** — does the architecture permit the claim?
4. **Register with class** `official-docs` / `code-repository`.
5. **Emit a Findings Card** on structural feasibility.

### Example Queries

- `"[system]" architecture OR design doc OR ADR`
- `"[product]" "how it works" OR internals`
- `"[claim]" architectural constraint`

### Territory Boundary

Owns system architecture. Feeds reproducer (does it run) and spec-reader (the mandate); assesses *structural possibility*.

### Grounding Protocol

- Cite the design doc / ADR establishing the constraint.
- "Impossible given the architecture" is a strong claim — show the constraint.
- Distinguish "hard" from "impossible."

---

## reproducer

**Query Intent:** does it actually run
**Source Class Owned:** executed artifacts, logs
**Attack Specialisation:** "could not reproduce"
**Polarity Pairs:** [benchmark-reader, failure-case-hunter]

**Retrieval Function:** Runs it. Where the capability contract permits, retrieves executed artifacts, run logs, and reproduction reports establishing whether a claim actually works when run — not just in principle.

### Retrieval Method

1. **Identify the reproducible claim.**
2. **Find execution evidence** — logs, CI runs, reproduction reports.
3. **Assess reproduction status** — ran clean, failed, partial.
4. **Register with class** `code-repository` / `community-forum`.
5. **Emit a Findings Card** on reproduction.

### Example Queries

- `"[claim]" reproduce OR "steps to reproduce"`
- `"[project]" CI OR build logs`
- `"[experiment]" reproduction report`

### Territory Boundary

Owns reproduction evidence. Polarity partner of benchmark-reader (measured score); complements failure-case-hunter (field failures).

### Grounding Protocol

- Cite the execution artifact or reproduction report.
- "Could not reproduce" is a finding, not a gap — report it.
- Distinguish "did not run" from "ran and failed."
