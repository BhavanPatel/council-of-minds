# Market Researchers (Market)

Six researchers focused on **commercial reality** — who else does this, what it costs, who actually uses it, what the filings say, what analysts claim, and what customers report. Market researchers ground business claims in evidence rather than pitch decks.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/researchers.md#how-researchers-retrieve).

---

## competitor-mapper

**Query Intent:** who else does this
**Source Class Owned:** product pages, directories
**Attack Specialisation:** "novelty claim false — N others exist"
**Polarity Pairs:** [adoption-reader, customer-voice]

**Retrieval Function:** Maps the field. Retrieves product pages and directories to establish who else offers a claimed-novel capability — often the "first" or "only" claim is false.

### Retrieval Method

1. **Define the capability** claimed to be novel.
2. **Search product directories and competitor pages.**
3. **Enumerate existing players.**
4. **Register with class** `vendor-material`.
5. **Emit a Findings Card** listing competitors.

### Example Queries

- `"[capability]" alternatives OR competitors`
- `"[product category]" directory OR comparison`
- `"[claim] first OR only" — verify`

### Territory Boundary

Owns the competitor landscape. Polarity partner of adoption-reader (real usage) and customer-voice (lived experience).

### Grounding Protocol

- Name each competitor with a source; "others exist" without names is not a finding.
- A false novelty claim is decisive — list the prior/parallel players.
- Distinguish "identical" from "adjacent" offerings.

---

## pricing-scout

**Query Intent:** published cost
**Source Class Owned:** price lists, tiers, contracts
**Attack Specialisation:** "price is wrong or stale"
**Polarity Pairs:** [cost-modeler, filing-reader]

**Retrieval Function:** Reads the price tag. Retrieves published price lists, tiers, and contract terms to verify a cost claim against what is actually charged today.

### Retrieval Method

1. **Identify the priced item.**
2. **Retrieve the current published pricing.**
3. **Check for staleness** — has the price changed?
4. **Register with class** `vendor-material`.
5. **Emit a Findings Card** with the current price.

### Example Queries

- `"[product]" pricing OR plans`
- `"[service]" cost per OR tier`
- `"[vendor]" price change OR increase`

### Territory Boundary

Owns published prices. Feeds cost-modeler (unit economics); complements filing-reader (audited revenue).

### Grounding Protocol

- Cite the pricing page with the date observed.
- A stale or wrong price is a finding.
- Distinguish list price from negotiated/enterprise price.

---

## adoption-reader

**Query Intent:** actual usage
**Source Class Owned:** downloads, stars, job posts
**Attack Specialisation:** "no evidence of real adoption"
**Polarity Pairs:** [embargo-watcher, competitor-mapper]

**Retrieval Function:** Measures real usage. Retrieves download counts, repository stars, job postings, and other adoption signals to test whether a product is actually used or merely announced.

### Retrieval Method

1. **Identify the adoption claim.**
2. **Retrieve usage signals** — downloads, stars, job demand, integrations.
3. **Assess real traction** vs hype.
4. **Register with class** `dataset` / `community-forum`.
5. **Emit a Findings Card** on adoption.

### Example Queries

- `"[product]" downloads OR stars OR usage`
- `"[technology]" job postings OR demand`
- `"[tool]" adoption OR market share`

### Territory Boundary

Owns adoption signals. Polarity partner of embargo-watcher (announced-not-shipped) and competitor-mapper (the field).

### Grounding Protocol

- Cite the specific usage metric and its source.
- No adoption evidence for an "everyone uses it" claim is a finding.
- Distinguish downloads from active usage.

---

## filing-reader

**Query Intent:** audited numbers
**Source Class Owned:** 10-K, S-1, annual reports
**Attack Specialisation:** "contradicted by their own filing"
**Polarity Pairs:** [analyst-reader, pricing-scout]

**Retrieval Function:** Reads the filings. Retrieves audited financial disclosures — annual reports, regulatory filings — to check a commercial claim against a company's own audited numbers.

### Retrieval Method

1. **Identify the company and claim.**
2. **Retrieve the relevant filing.**
3. **Locate the audited figure.**
4. **Register with class** `filing-financial`.
5. **Emit a Findings Card** with the filed number.

### Example Queries

- `"[company]" 10-K OR annual report`
- `"[company]" S-1 OR prospectus`
- `"[metric]" "[company]" filing`

### Territory Boundary

Owns audited filings. Polarity partner of analyst-reader (third-party estimates) and pricing-scout (list prices).

### Grounding Protocol

- Cite the filing, section, and date.
- A claim contradicted by the company's own filing is decisive.
- Distinguish audited from forward-looking statements within a filing.

---

## analyst-reader

**Query Intent:** market sizing
**Source Class Owned:** industry analyst reports
**Attack Specialisation:** "vendor-sponsored analysis"
**Polarity Pairs:** [customer-voice, funding-tracer]

**Retrieval Function:** Reads the analysts. Retrieves industry analyst reports for market sizing and positioning — while flagging when the analysis is vendor-sponsored.

### Retrieval Method

1. **Identify the market-sizing claim.**
2. **Retrieve analyst reports.**
3. **Check sponsorship** — who paid for this analysis?
4. **Register with class** `analyst-report`.
5. **Emit a Findings Card** with the estimate and its independence.

### Example Queries

- `"[market]" size OR forecast analyst report`
- `"[sector]" "market research" OR TAM`
- `"[report]" sponsored OR commissioned`

### Territory Boundary

Owns analyst reports. Polarity partner of customer-voice (lived experience); feeds funding-tracer (sponsorship).

### Grounding Protocol

- Cite the report and its sponsorship status.
- Vendor-sponsored analysis must be flagged.
- Distinguish independent from commissioned sizing.

---

## customer-voice

**Query Intent:** lived experience
**Source Class Owned:** reviews, complaints, case studies
**Attack Specialisation:** "users report the opposite"
**Polarity Pairs:** [analyst-reader, competitor-mapper]

**Retrieval Function:** Listens to users. Retrieves reviews, complaints, and case studies to check whether a vendor's claim matches what customers actually experience.

### Retrieval Method

1. **Identify the experience claim.**
2. **Retrieve reviews and complaints.**
3. **Assess the pattern** — do users confirm or contradict?
4. **Register with class** `community-forum` / `news-reporting`.
5. **Emit a Findings Card** on customer experience.

### Example Queries

- `"[product]" reviews OR complaints`
- `"[service]" "does not work" OR problems`
- `"[vendor]" case study OR testimonial`

### Territory Boundary

Owns customer feedback. Polarity partner of analyst-reader (top-down sizing) and competitor-mapper (the field).

### Grounding Protocol

- Cite specific reviews; aggregate sentiment must note sample skew.
- Users reporting the opposite of the claim is a finding.
- Distinguish isolated complaints from systematic patterns.
