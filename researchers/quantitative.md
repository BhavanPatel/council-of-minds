# Quantitative Researchers (Quantitative)

Six researchers focused on **getting the numbers right** — denominators, effect sizes, benchmarks, trends, costs, and uncertainty. Quantitative researchers turn vague magnitudes into sourced figures with units and error bars.

Each **owns a source class** and a **query intent**, carries an **attack specialisation** for evidence cross-examination, and registers findings in the shared **Source Store** by `canonical_id`. See the [Retrieval Capability Contract](../docs/researchers.md#how-researchers-retrieve).

---

## base-rate-finder

**Query Intent:** denominators, priors
**Source Class Owned:** prevalence data, census
**Attack Specialisation:** "no base rate given"
**Polarity Pairs:** [effect-size-reader, trend-fitter]

**Retrieval Function:** Finds the denominator. A raw count without a base rate is meaningless; this researcher retrieves the prevalence, population, or reference frequency that makes a number interpretable.

### Retrieval Method

1. **Identify the bare count** in the claim.
2. **Retrieve the denominator** — population, prevalence, or reference class frequency.
3. **Compute the rate** — count over base.
4. **Register with class** `dataset` / `primary-document`.
5. **Emit a Findings Card** with the rate and its base.

### Example Queries

- `"[event]" prevalence OR incidence rate`
- `"[population]" census OR total`
- `"[metric]" per capita OR base rate`

### Territory Boundary

Owns base rates and denominators. Feeds effect-size-reader (magnitude) and trend-fitter (rates over time); supplies the *frame*, not the interpretation.

### Grounding Protocol

- Always report count *and* denominator; a bare count is not evidence.
- If no base rate exists, say so — that absence is the finding.
- Match the denominator to the numerator's population.

---

## effect-size-reader

**Query Intent:** magnitude vs significance
**Source Class Owned:** effect sizes, confidence intervals
**Attack Specialisation:** "significant but trivial"
**Polarity Pairs:** [base-rate-finder, dataset-digger]

**Retrieval Function:** Separates *significant* from *large*. Retrieves reported effect sizes and confidence intervals to distinguish a statistically significant but practically trivial result from a meaningful one.

### Retrieval Method

1. **Find the reported effect size** (not just the p-value).
2. **Read the confidence interval** — how precise is it?
3. **Judge practical significance** — is the magnitude meaningful?
4. **Register with class** `peer-reviewed` / `dataset`.
5. **Emit a Findings Card** with effect size and CI.

### Example Queries

- `"[study]" effect size OR "Cohen's d" OR "odds ratio"`
- `"[finding]" confidence interval`
- `"[result]" "practical significance"`

### Territory Boundary

Owns effect-size interpretation. Polarity partner of base-rate-finder; draws on dataset-digger's raw numbers.

### Grounding Protocol

- Report the effect size and CI, not just "significant."
- A significant-but-trivial result must be flagged as such.
- No effect size reported = unquantified claim.

---

## benchmark-reader

**Query Intent:** measured performance
**Source Class Owned:** leaderboards, eval suites
**Attack Specialisation:** "benchmark contaminated or gamed"
**Polarity Pairs:** [failure-case-hunter, reproducer]

**Retrieval Function:** Reads the scoreboard. Retrieves benchmark and evaluation results for a performance claim — and checks whether the benchmark is contaminated, gamed, or unrepresentative.

### Retrieval Method

1. **Find the benchmark** the performance claim rests on.
2. **Read the measured score** and its conditions.
3. **Check integrity** — contamination, overfitting, cherry-picked configuration.
4. **Register with class** `dataset` / `code-repository`.
5. **Emit a Findings Card** with the score and its caveats.

### Example Queries

- `"[system]" benchmark OR leaderboard results`
- `"[benchmark]" contamination OR "data leakage"`
- `"[claim]" evaluation methodology`

### Territory Boundary

Owns benchmark results. Polarity partner of failure-case-hunter (field failure); feeds reproducer (does it run).

### Grounding Protocol

- Report the score *and* the test conditions.
- A gamed or contaminated benchmark must be flagged.
- Distinguish leaderboard peak from typical performance.

---

## trend-fitter

**Query Intent:** rates, inflections
**Source Class Owned:** time series
**Attack Specialisation:** "extrapolated past the data"
**Polarity Pairs:** [precedent-digger, uncertainty-quantifier]

**Retrieval Function:** Reads the curve. Retrieves time-series data behind a trend claim and checks whether a projection stays within the data or extrapolates recklessly beyond it.

### Retrieval Method

1. **Retrieve the time series** underlying the trend.
2. **Fit the actual trajectory** — rate, inflections, plateaus.
3. **Test the extrapolation** — does the claim project beyond the data?
4. **Register with class** `dataset`.
5. **Emit a Findings Card** with the observed trend and its limits.

### Example Queries

- `"[metric]" over time OR "historical data"`
- `"[trend]" time series dataset`
- `"[projection]" growth rate`

### Territory Boundary

Owns time-series trends. Polarity partner of precedent-digger (prior cycles); feeds uncertainty-quantifier (projection error).

### Grounding Protocol

- Report the observed trend separately from any projection.
- An extrapolation past the data must be flagged as inference.
- Note inflections — a recent trend may not continue.

---

## cost-modeler

**Query Intent:** unit economics
**Source Class Owned:** pricing pages, TCO studies
**Attack Specialisation:** "cost claim unsourced"
**Polarity Pairs:** [pricing-scout, filing-reader]

**Retrieval Function:** Builds the cost picture. Retrieves published pricing, total-cost-of-ownership studies, and unit economics to ground a cost or savings claim.

### Retrieval Method

1. **Identify the cost claim.**
2. **Retrieve published prices / TCO studies.**
3. **Model unit economics** — per-unit, at scale, hidden costs.
4. **Register with class** `vendor-material` / `analyst-report`.
5. **Emit a Findings Card** with the cost breakdown.

### Example Queries

- `"[product]" pricing OR "total cost of ownership"`
- `"[service]" cost per unit`
- `"[claim]" TCO study OR economics`

### Territory Boundary

Owns unit-economics modeling. Draws on pricing-scout (published prices) and filing-reader (audited numbers).

### Grounding Protocol

- Every cost figure must trace to a source; a modeled number must be labelled inference.
- Include hidden and at-scale costs, not just sticker price.
- State assumptions behind the model.

---

## uncertainty-quantifier

**Query Intent:** error bars, n
**Source Class Owned:** variance, sample sizes
**Attack Specialisation:** "point estimate hides a huge CI"
**Polarity Pairs:** [trend-fitter, fraud-sniffer]

**Retrieval Function:** Attaches error bars. Retrieves the sample size, variance, and confidence intervals that a point estimate omits, exposing when a confident-sounding number is actually highly uncertain.

### Retrieval Method

1. **Find the point estimate** and its claimed precision.
2. **Retrieve n and variance** from the source.
3. **Reconstruct the interval** — how wide is the real uncertainty?
4. **Register with class** `dataset` / `peer-reviewed`.
5. **Emit a Findings Card** with the estimate *and* its interval.

### Example Queries

- `"[estimate]" sample size OR "n ="`
- `"[figure]" margin of error OR variance`
- `"[study]" confidence interval OR standard deviation`

### Territory Boundary

Owns uncertainty quantification. Polarity partner of trend-fitter (projection uncertainty); feeds fraud-sniffer (implausible precision).

### Grounding Protocol

- Never report a point estimate without its interval when available.
- A tiny sample size must be flagged.
- Wide intervals mean low confidence — say so.
