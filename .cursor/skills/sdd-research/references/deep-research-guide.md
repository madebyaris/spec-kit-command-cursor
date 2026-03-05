# Deep Research Guide

Methodology for thorough, multi-pass external research when standard analysis is insufficient.

## When to Activate Deep Research

| Signal | Example |
|--------|---------|
| Unfamiliar domain | "We need a CRDT library — I've never used one" |
| High cost-of-reversal | Database engine choice, auth provider, cloud platform |
| Multiple viable candidates | 4+ options with no clear winner |
| Standard research inconclusive | Phase 2 left too many unknowns |
| User explicitly requests it | "/research --deep" or "do a deep dive on..." |

## Multi-Pass Investigation

### Pass 1: Landscape Scan

**Goal:** Map the solution space. Identify what exists.

**Search strategies:**
- `"best [technology] for [use case] [current year]"` — find recent recommendations
- `"[use case] comparison [current year]"` — find head-to-head evaluations
- `"[use case] open source"` — find OSS alternatives
- `"[technology] alternatives"` — discover options you didn't know about

**Output:** List of 3-5 candidates with one-line descriptions and official URLs.

**Time budget:** 10-15 minutes.

### Pass 2: Documentation Deep-Dive

**Goal:** Understand each candidate's capabilities, limits, and API surface.

**For each candidate, fetch and read:**
1. Official getting-started / quickstart page
2. API reference or core concepts page
3. Pricing page (if SaaS)
4. Changelog or release notes (check activity)

**Extract per candidate:**
- Core API surface (key methods/endpoints)
- Pricing model and limits
- Supported platforms / runtimes
- Breaking changes or migration concerns
- License type

**Time budget:** 15-20 minutes per candidate.

### Pass 3: Real-World Validation

**Goal:** Find evidence from production usage, not just marketing.

**Search strategies:**
- `"[candidate] vs [candidate]"` — direct comparisons
- `"[candidate] production review"` or `"[candidate] experience"` — real-world reports
- `"[candidate] performance benchmark"` — quantitative data
- `"[candidate] problems"` or `"[candidate] limitations"` — known issues
- `"migrating from [candidate]"` — why people leave

**Community health indicators:**
- GitHub: stars, recent commits, open issues, contributor count
- npm/PyPI: weekly downloads, last publish date
- Stack Overflow: question count and answer rate

**Time budget:** 10-15 minutes per candidate.

### Pass 4: Integration Feasibility

**Goal:** Can this actually work with our stack?

**Search strategies:**
- `"[candidate] [our framework] integration"` — e.g. "Drizzle Next.js integration"
- `"[candidate] [our language] example"` — e.g. "Stripe TypeScript example"
- `"[candidate] [our deployment target]"` — e.g. "PlanetScale Cloudflare Workers"

**Check:**
- Does an official SDK/adapter exist for our language/framework?
- Are there known incompatibilities with our runtime?
- What's the migration effort from our current solution (if any)?

**Time budget:** 10 minutes per candidate.

## Source Evaluation

Rate each source's reliability:

| Source Type | Reliability | Notes |
|-------------|-------------|-------|
| Official docs | High | Authoritative but may be optimistic |
| Peer-reviewed benchmarks | High | Look for methodology transparency |
| Production post-mortems | High | Real experience, but context-specific |
| Blog comparisons | Medium | Check author credentials and date |
| Reddit/HN discussions | Medium | Diverse opinions, watch for bias |
| Marketing pages | Low | Treat claims as unverified |
| AI-generated content | Low | Cross-reference with primary sources |

**Staleness rule:** Discard sources older than 18 months for fast-moving technologies. For stable technologies (databases, protocols), older sources are acceptable.

## Confidence Levels

Assign to the final recommendation:

| Level | Criteria |
|-------|----------|
| **High** | 3+ high-reliability sources agree, benchmarks available, integration verified |
| **Medium** | 2+ sources agree, some gaps in evidence, integration plausible but untested |
| **Low** | Limited sources, conflicting evidence, significant unknowns remain |

If confidence is Low, recommend a **spike** (time-boxed prototype) before committing.

## Output Additions for Deep Research

The standard research output format gains these sections:

```markdown
## Sources
| # | URL | Type | Reliability | Key Finding |
|---|-----|------|-------------|-------------|
| 1 | [url] | Official docs | High | [finding] |
| 2 | [url] | Benchmark | High | [finding] |

## Confidence Assessment
**Overall confidence:** [High/Medium/Low]
**Reasoning:** [Why this confidence level]
**Gaps:** [What we still don't know]
**Suggested spike:** [If Low confidence — describe a 2-4h prototype to validate]
```

## Anti-Patterns

- **Analysis paralysis** — Cap at 5 candidates. If more exist, filter by stack compatibility first.
- **Recency bias** — Don't dismiss mature solutions just because they're not trending.
- **Hype-driven selection** — Popularity != fit. Always check integration feasibility.
- **Ignoring exit cost** — Consider: how hard is it to switch away from this choice later?
- **Skipping Pass 3** — Marketing docs are not evidence. Always validate with real-world usage.
