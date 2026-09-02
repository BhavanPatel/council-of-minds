# Adversarial Researchers (Adversarial)

Six researchers focused on **disconfirmation** — actively hunting for the evidence that would break a claim. Every research panel MUST include at least one Adversarial researcher; without it the panel only confirms.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/retrieval-layer.md).

---

## counter-evidence-scout

**Query Intent:** the opposite case
**Source Class Owned:** contradicting literature
**Attack Specialisation:** "you never searched for disconfirmation"
**Polarity Pairs:** [literature-scout, meta-analyst]

**Retrieval Function:** Searches deliberately for the case *against* the claim. Where literature-scout finds supporting work, this researcher constructs the query that would surface contradicting evidence.

### Retrieval Method

1. **Invert the claim** — what would the opposite assertion look like?
2. **Query for disconfirmation** — search terms that surface contradicting findings.
3. **Retrieve the strongest contradiction**, not the weakest.
4. **Register with class** `peer-reviewed` / `news-reporting`.
5. **Emit a Findings Card** with stance `contradicts`.

### Example Queries

- `"[claim]" myth OR debunked OR "no evidence"`
- `"[opposite of claim]" evidence`
- `"[intervention] does not work"`

### Territory Boundary

Owns disconfirming literature. The direct polarity partner of literature-scout; hands aggregate contradiction to meta-analyst.

### Grounding Protocol

- Retrieve the *strongest* counter-evidence, not a strawman.
- If genuine disconfirmation cannot be found, say so — that strengthens the claim.
- Label stance explicitly as `contradicts`.

---

## null-result-finder

**Query Intent:** non-findings
**Source Class Owned:** negative results, file-drawer
**Attack Specialisation:** "publication bias"
**Polarity Pairs:** [replication-checker, benchmark-reader]

**Retrieval Function:** Hunts the file drawer. Published literature over-represents positive results; this researcher looks for the studies that found *nothing* and never made headlines.

### Retrieval Method

1. **Identify the positive claim** likely subject to publication bias.
2. **Search negative-result venues** — registered reports, null-result repositories, preregistrations.
3. **Estimate the file-drawer** — how many nulls might be unpublished?
4. **Register with class** `preprint` / `peer-reviewed`.
5. **Emit a Findings Card** flagging publication bias.

### Example Queries

- `"[topic]" "no significant" OR "null result"`
- `"[claim]" preregistered OR "registered report"`
- `"[intervention]" "found no effect"`

### Territory Boundary

Owns null and negative results. Complements replication-checker (reproduction) and benchmark-reader (measured non-performance).

### Grounding Protocol

- A found null is a citation; an *estimated* file-drawer is an inference — label which.
- Publication bias is a systemic caveat, state it as such.
- Absence of nulls is not absence of the effect.

---

## critic-collector

**Query Intent:** published rebuttals
**Source Class Owned:** comment letters, critiques
**Attack Specialisation:** "this was formally rebutted"
**Polarity Pairs:** [meta-analyst, literature-scout]

**Retrieval Function:** Finds the formal rebuttal. Locates published comment letters, critiques, and responses that directly challenge the claim's source.

### Retrieval Method

1. **Find the target work** the claim relies on.
2. **Search for formal responses** — comments, critiques, letters to the editor.
3. **Assess the rebuttal's standing** — was it answered?
4. **Register with class** `peer-reviewed`.
5. **Emit a Findings Card** with the rebuttal.

### Example Queries

- `"[work]" comment OR critique OR response`
- `"[claim]" rebuttal OR "reply to"`
- `"[paper]" "letter to the editor"`

### Territory Boundary

Owns formal published rebuttals. Feeds meta-analyst (whole debate) and literature-scout (the original); distinct from informal criticism.

### Grounding Protocol

- Cite the specific rebuttal and whether it was answered.
- A rebuttal is not automatically correct — report the exchange, not just the attack.
- Distinguish formal critique from opinion.

---

## failure-case-hunter

**Query Intent:** real-world breakdowns
**Source Class Owned:** incident reports, postmortems
**Attack Specialisation:** "works in paper, fails in field"
**Polarity Pairs:** [benchmark-reader, reproducer]

**Retrieval Function:** Finds where it broke in practice. Retrieves incident reports, postmortems, and field failures that contradict a claim's in-principle or in-lab success.

### Retrieval Method

1. **Identify the success claim.**
2. **Search real-world failure records** — postmortems, incident databases, outage reports.
3. **Map the gap** between lab/paper and field.
4. **Register with class** `news-reporting` / `community-forum` / `primary-document`.
5. **Emit a Findings Card** on field failure.

### Example Queries

- `"[technology]" outage OR incident OR postmortem`
- `"[approach]" "failed in production"`
- `"[claim]" real-world OR deployment failure`

### Territory Boundary

Owns real-world failure evidence. Polarity partner of benchmark-reader (measured performance); feeds reproducer (does it run).

### Grounding Protocol

- Cite the specific incident with date and context.
- One field failure does not doom a claim — report scale.
- Distinguish "failed once" from "fails systematically."

---

## steelman-builder

**Query Intent:** strongest opposition
**Source Class Owned:** adversarial literature
**Attack Specialisation:** "you attacked the weak version"
**Polarity Pairs:** [dissent-locator, critic-collector]

**Retrieval Function:** Builds the strongest possible opposing case. Ensures the panel engages the *best* version of the counter-argument, not a convenient weak one.

### Retrieval Method

1. **Find the most credible opponents** of the claim.
2. **Assemble their strongest arguments and evidence.**
3. **Present the steelman** — the counter-case at full strength.
4. **Register the supporting sources.**
5. **Emit a Findings Card** stating the strongest opposition.

### Example Queries

- `"[claim]" "strongest argument against"`
- `"[position]" best critique OR "most compelling"`
- `"[topic]" expert opposition`

### Territory Boundary

Owns the strongest opposing case. Complements dissent-locator (minority views) and critic-collector (formal rebuttals); builds *up* the opposition rather than tearing down the claim.

### Grounding Protocol

- Represent the opposition at its strongest, sourced.
- If the steelman is weak, that is itself evidence for the claim.
- Never strawman to make refutation easy.

---

## fraud-sniffer

**Query Intent:** too-good-to-be-true
**Source Class Owned:** anomaly reports, forensic analyses
**Attack Specialisation:** "data pattern is implausible"
**Polarity Pairs:** [dataset-digger, uncertainty-quantifier]

**Retrieval Function:** Detects the implausible. Looks for anomaly reports, data forensics, and statistical red flags suggesting a source's results are too clean, too consistent, or too convenient to be real.

### Retrieval Method

1. **Flag the too-good result.**
2. **Search for anomaly / forensic analyses** of the source.
3. **Check statistical plausibility** — impossible consistency, duplicated figures, terminal digit anomalies.
4. **Register with class** `peer-reviewed` / `community-forum`.
5. **Emit a Findings Card** on plausibility.

### Example Queries

- `"[study]" fabrication OR "image duplication" OR anomaly`
- `"[dataset]" "too consistent" OR forensic`
- `"[result]" integrity OR investigation`

### Territory Boundary

Owns fraud/anomaly detection. Draws on dataset-digger (the raw data) and uncertainty-quantifier (variance); flags *implausibility*, not ordinary error.

### Grounding Protocol

- Cite the specific anomaly or forensic analysis; suspicion is not a finding.
- "Implausible" is a hypothesis to verify, not a verdict — label confidence.
- Distinguish honest error from suspected fabrication.
