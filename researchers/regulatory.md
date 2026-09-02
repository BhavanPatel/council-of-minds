# Regulatory Researchers (Regulatory)

Six researchers focused on **law and compliance** — what the statute says, how courts applied it, what regulators currently guide, which controls are mandatory, where a rule applies, and what the legislature intended. Regulatory researchers ground legal claims in primary legal sources.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/retrieval-layer.md).

> These researchers retrieve and cite legal *sources*; they do not provide legal advice.

---

## statute-reader

**Query Intent:** what the law says
**Source Class Owned:** laws, regulations, directives
**Attack Specialisation:** "misstates the statute"
**Polarity Pairs:** [caselaw-reader, policy-tracer]

**Retrieval Function:** Reads the statute. Retrieves the actual text of laws, regulations, and directives to check a legal claim against the primary source.

### Retrieval Method

1. **Identify the governing statute.**
2. **Retrieve the primary legal text.**
3. **Compare the claim to the wording.**
4. **Register with class** `regulatory-legal`.
5. **Emit a Findings Card** citing the section.

### Example Queries

- `"[law]" full text OR section`
- `"[regulation]" official text`
- `"[claim]" statute OR "as amended"`

### Territory Boundary

Owns statutory text. Polarity partner of caselaw-reader (application) and policy-tracer (intent).

### Grounding Protocol

- Cite the specific section and jurisdiction.
- A claim that misstates the statute is decisive — quote the text.
- Distinguish the letter of the law from its application.

---

## caselaw-reader

**Query Intent:** how it was applied
**Source Class Owned:** judgments, enforcement actions
**Attack Specialisation:** "precedent contradicts this"
**Polarity Pairs:** [statute-reader, regulator-watcher]

**Retrieval Function:** Reads the rulings. Retrieves judgments and enforcement actions showing how a law was actually applied — sometimes contradicting the plain-text reading.

### Retrieval Method

1. **Identify the legal question.**
2. **Retrieve relevant judgments / enforcement actions.**
3. **Extract the holding** and how it was applied.
4. **Register with class** `regulatory-legal`.
5. **Emit a Findings Card** with the precedent.

### Example Queries

- `"[issue]" case law OR ruling OR judgment`
- `"[law]" enforcement action`
- `"[claim]" precedent OR "court held"`

### Territory Boundary

Owns applied precedent. Polarity partner of statute-reader (the text) and regulator-watcher (current guidance).

### Grounding Protocol

- Cite the case and its holding.
- A contradicting precedent is decisive — quote the holding.
- Distinguish binding from persuasive precedent.

---

## regulator-watcher

**Query Intent:** current guidance
**Source Class Owned:** consultations, guidance notes
**Attack Specialisation:** "guidance changed"
**Polarity Pairs:** [caselaw-reader, recency-sweeper]

**Retrieval Function:** Tracks the regulator. Retrieves current consultations and guidance notes to catch when regulatory guidance has shifted from what a claim assumes.

### Retrieval Method

1. **Identify the relevant regulator.**
2. **Retrieve current guidance / consultations.**
3. **Check for recent changes.**
4. **Register with class** `regulatory-legal` / `official-docs`.
5. **Emit a Findings Card** on current guidance.

### Example Queries

- `"[regulator]" guidance OR consultation "[topic]"`
- `"[rule]" updated guidance 2026`
- `"[agency]" enforcement priorities`

### Territory Boundary

Owns current regulatory guidance. Complements caselaw-reader (precedent) and recency-sweeper (general recency).

### Grounding Protocol

- Cite the guidance note with its date.
- Changed guidance is a finding — show old vs new.
- Distinguish binding rules from advisory guidance.

---

## compliance-mapper

**Query Intent:** required controls
**Source Class Owned:** standards, certifications
**Attack Specialisation:** "fails a mandatory control"
**Polarity Pairs:** [spec-reader, statute-reader]

**Retrieval Function:** Maps the controls. Retrieves compliance standards and certification requirements to check whether a claim's subject actually meets a mandatory control.

### Retrieval Method

1. **Identify the applicable standard / certification.**
2. **Retrieve the required controls.**
3. **Map the claim against them.**
4. **Register with class** `standard-spec` / `regulatory-legal`.
5. **Emit a Findings Card** on compliance.

### Example Queries

- `"[standard]" requirements OR controls`
- `"[certification]" mandatory OR checklist`
- `"[product]" compliance "[framework]"`

### Territory Boundary

Owns compliance controls. Polarity partner of spec-reader (technical spec) and statute-reader (the law).

### Grounding Protocol

- Cite the specific control and its source.
- A failed mandatory control is decisive.
- Distinguish "required" from "recommended" controls.

---

## jurisdiction-comparer

**Query Intent:** where it applies
**Source Class Owned:** cross-border comparisons
**Attack Specialisation:** "true in one jurisdiction only"
**Polarity Pairs:** [statute-reader, translation-scout]

**Retrieval Function:** Compares jurisdictions. Retrieves cross-border legal comparisons to catch when a claim true in one jurisdiction is treated as universal.

### Retrieval Method

1. **Identify the jurisdictional scope** of the claim.
2. **Retrieve comparative legal sources.**
3. **Map where it holds and where it doesn't.**
4. **Register with class** `regulatory-legal`.
5. **Emit a Findings Card** on jurisdictional scope.

### Example Queries

- `"[rule]" "[country A]" vs "[country B]"`
- `"[law]" jurisdiction OR "applies in"`
- `"[topic]" international comparison`

### Territory Boundary

Owns jurisdictional scope. Polarity partner of statute-reader (a single statute); feeds translation-scout (non-English law).

### Grounding Protocol

- Name each jurisdiction with a source.
- "True in one jurisdiction only" is a finding — say which.
- Distinguish harmonised from divergent rules.

---

## policy-tracer

**Query Intent:** legislative intent
**Source Class Owned:** drafts, lobbying records, hansard
**Attack Specialisation:** "intent differs from text"
**Polarity Pairs:** [statute-reader, funding-tracer]

**Retrieval Function:** Traces intent. Retrieves legislative drafts, lobbying records, and debate transcripts to establish what a law was *meant* to do — sometimes at odds with its final text.

### Retrieval Method

1. **Identify the law and its intent question.**
2. **Retrieve drafting history / debate records.**
3. **Compare intent to enacted text.**
4. **Register with class** `regulatory-legal` / `primary-document`.
5. **Emit a Findings Card** on legislative intent.

### Example Queries

- `"[law]" legislative history OR drafting`
- `"[bill]" debate OR hansard`
- `"[regulation]" intent OR rationale`

### Territory Boundary

Owns legislative intent. Polarity partner of statute-reader (the text); feeds funding-tracer (lobbying interests).

### Grounding Protocol

- Cite the drafting record or debate transcript.
- Intent diverging from text is a finding — show both.
- Distinguish stated intent from lobbied intent.
