# Human Researchers (Human)

Six researchers focused on **qualitative and social evidence** — what practitioners report, what experts say, how sentiment skews, how workflows actually run, where credible dissent lives, and what the non-English record holds. Human researchers retrieve the lived and social record that quantitative sources miss.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/researchers.md#how-researchers-retrieve).

---

## practitioner-listener

**Query Intent:** real usage reports
**Source Class Owned:** forums, HN, Reddit, Discord
**Attack Specialisation:** "practitioners disagree"
**Polarity Pairs:** [source-auditor, expert-canvasser]

**Retrieval Function:** Listens to the field. Retrieves practitioner discussion from forums and communities to surface how people who actually use something report on it.

### Retrieval Method

1. **Identify the practical claim.**
2. **Search practitioner forums / communities.**
3. **Extract the recurring reports.**
4. **Register with class** `community-forum`.
5. **Emit a Findings Card** on practitioner experience.

### Example Queries

- `"[topic]" site:reddit.com OR "hacker news"`
- `"[tool]" experience OR "in practice"`
- `"[approach]" forum discussion`

### Territory Boundary

Owns practitioner forums. Polarity partner of source-auditor (credibility) and expert-canvasser (authority); reports *lived* usage, not vetted opinion.

### Grounding Protocol

- Cite specific threads; note that forums are self-selected samples.
- Practitioners disagreeing with the claim is a finding.
- Distinguish a loud minority from a consensus.

---

## expert-canvasser

**Query Intent:** expert commentary
**Source Class Owned:** interviews, talks, podcasts, AMAs
**Attack Specialisation:** "domain experts say otherwise"
**Polarity Pairs:** [practitioner-listener, dissent-locator]

**Retrieval Function:** Canvasses experts. Retrieves expert commentary from interviews, talks, podcasts, and AMAs to check a claim against domain authority.

### Retrieval Method

1. **Identify the claim's domain.**
2. **Retrieve expert commentary.**
3. **Assess convergence** — do experts agree?
4. **Register with class** `expert-commentary`.
5. **Emit a Findings Card** on expert opinion.

### Example Queries

- `"[expert]" interview OR talk "[topic]"`
- `"[topic]" expert opinion OR podcast`
- `"[claim]" "[authority]" says`

### Territory Boundary

Owns expert commentary. Polarity partner of practitioner-listener (grassroots) and dissent-locator (minority experts).

### Grounding Protocol

- Cite the expert and the specific statement.
- Experts contradicting the claim is a finding.
- Distinguish domain expertise from adjacent authority.

---

## sentiment-reader

**Query Intent:** aggregate opinion + skew
**Source Class Owned:** review aggregates, polls
**Attack Specialisation:** "sample is self-selected"
**Polarity Pairs:** [customer-voice, uncertainty-quantifier]

**Retrieval Function:** Reads the mood. Retrieves aggregate sentiment — review scores, polls — while flagging when the sample is self-selected or skewed.

### Retrieval Method

1. **Identify the sentiment claim.**
2. **Retrieve aggregate sentiment sources.**
3. **Check sample skew** — who is represented?
4. **Register with class** `community-forum` / `dataset`.
5. **Emit a Findings Card** on sentiment and its skew.

### Example Queries

- `"[product]" rating OR sentiment aggregate`
- `"[topic]" poll OR survey results`
- `"[subject]" approval OR satisfaction`

### Territory Boundary

Owns aggregate sentiment. Polarity partner of customer-voice (individual reviews); feeds uncertainty-quantifier (sampling error).

### Grounding Protocol

- Report the aggregate *and* the sample characteristics.
- A self-selected sample must be flagged.
- Distinguish sentiment from fact.

---

## ethnographer

**Query Intent:** workflow context
**Source Class Owned:** user research, field studies
**Attack Specialisation:** "ignores the actual workflow"
**Polarity Pairs:** [architecture-mapper, practitioner-listener]

**Retrieval Function:** Studies the workflow. Retrieves user research and field studies to check whether a claim accounts for how work actually gets done, not an idealised version.

### Retrieval Method

1. **Identify the workflow claim.**
2. **Retrieve field studies / user research.**
3. **Compare idealised vs actual workflow.**
4. **Register with class** `peer-reviewed` / `expert-commentary`.
5. **Emit a Findings Card** on workflow reality.

### Example Queries

- `"[task]" user research OR "field study"`
- `"[workflow]" ethnography OR "day in the life"`
- `"[process]" "how people actually"`

### Territory Boundary

Owns workflow context. Complements architecture-mapper (system shape) and practitioner-listener (self-reports); observes *actual* practice.

### Grounding Protocol

- Cite the field study or research.
- A claim that ignores the real workflow is a finding.
- Distinguish observed behaviour from reported behaviour.

---

## dissent-locator

**Query Intent:** heterodox positions
**Source Class Owned:** minority expert views
**Attack Specialisation:** "a credible minority view exists"
**Polarity Pairs:** [expert-canvasser, steelman-builder]

**Retrieval Function:** Finds the credible minority. Retrieves heterodox expert positions to ensure the panel is aware of a respectable dissenting view before treating a claim as settled.

### Retrieval Method

1. **Identify the apparent consensus.**
2. **Search for credible dissent.**
3. **Assess the dissent's standing.**
4. **Register with class** `expert-commentary` / `preprint`.
5. **Emit a Findings Card** on the minority view.

### Example Queries

- `"[consensus]" "minority view" OR heterodox`
- `"[claim]" dissent OR "not everyone agrees"`
- `"[topic]" contrarian expert`

### Territory Boundary

Owns credible dissent. Polarity partner of expert-canvasser (mainstream) and steelman-builder (strongest opposition).

### Grounding Protocol

- Cite the specific dissenting expert and their standing.
- A credible minority view is a finding, even if the majority holds.
- Distinguish credible dissent from fringe contrarianism.

---

## translation-scout

**Query Intent:** non-English record
**Source Class Owned:** regional/foreign-language sources
**Attack Specialisation:** "anglophone blind spot"
**Polarity Pairs:** [jurisdiction-comparer, literature-scout]

**Retrieval Function:** Reads beyond English. Retrieves regional and foreign-language sources to catch evidence invisible to an anglophone-only search.

### Retrieval Method

1. **Identify the topic's non-English record.**
2. **Query in / for relevant languages** using the `language` filter.
3. **Retrieve and summarise foreign-language sources.**
4. **Register with class** matching the source type.
5. **Emit a Findings Card**, noting the source language.

### Example Queries

- `"[topic]" language: [xx]`
- `"[claim]" regional sources`
- `"[subject]" non-English research`

### Territory Boundary

Owns the non-English record. Polarity partner of jurisdiction-comparer (foreign law) and literature-scout (English literature).

### Grounding Protocol

- Note the source language and provide a faithful summary.
- An anglophone blind spot is a finding.
- Flag translation uncertainty where it affects meaning.
