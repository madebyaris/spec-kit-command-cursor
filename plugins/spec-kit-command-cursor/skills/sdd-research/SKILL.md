---
name: sdd-research
description: Pattern investigation and technical research before specification. Use when technical approach is unclear, exploring existing solutions, or analyzing codebase patterns. Supports deep research mode for thorough external investigation.
---

# SDD Research Skill

Investigate codebase patterns and external solutions to inform specification and planning. Supports two modes: **standard** (codebase-focused) and **deep** (comprehensive external investigation).

## When to Use

- Technical approach is unclear
- Need to understand existing patterns
- Evaluating solution options
- Before `/specify` or `/plan` commands
- **Deep research**: New domain, unfamiliar technology, high-stakes architectural decision, or when standard research yields insufficient clarity

## Research Modes

### Standard Research (default)
Quick internal + surface external analysis. Good for well-understood domains where the codebase already has relevant patterns.

### Deep Research
Multi-pass external investigation using web search and documentation fetching. Use when:
- Entering an unfamiliar technology domain
- Comparing multiple complex solutions (e.g. auth providers, database engines, deployment platforms)
- The decision has high cost-of-reversal (architecture, data model, vendor lock-in)
- Standard research leaves too many unknowns

**Trigger:** User requests deep research explicitly, or the agent detects high uncertainty after Phase 1.

## Research Protocol

### Phase 1: Codebase Analysis
1. **Existing patterns** — how similar problems are solved
2. **Reusable components** — what can be leveraged
3. **Conventions** — naming, structure, architecture patterns
4. **Dependencies** — libraries/frameworks in use

Run `scripts/scan-patterns.sh` to auto-detect project stack before manual exploration.

### Phase 2: External Solutions (Standard)
1. **Best practices** — industry standards for this problem
2. **Library options** — available tools and tradeoffs
3. **Architecture patterns** — applicable design patterns

### Phase 2-Deep: Deep External Research (when deep mode is active)

Perform iterative, multi-pass investigation:

**Pass 1 — Landscape scan:**
- Use `WebSearch` to survey the solution space (e.g. "best [technology] for [use case] 2026")
- Identify the top 3-5 candidates from search results
- Note official documentation URLs for each candidate

**Pass 2 — Documentation deep-dive:**
- Use `WebFetch` to read official docs, getting-started guides, and API references for each candidate
- Extract: API surface, pricing model, limits, supported platforms, migration path
- Note version numbers and last-updated dates (reject stale/abandoned projects)

**Pass 3 — Real-world validation:**
- Search for "[candidate] vs [candidate]" comparisons, benchmarks, and post-mortems
- Search for "[candidate] production issues" or "[candidate] limitations"
- Look for community size indicators: GitHub stars, npm weekly downloads, Stack Overflow activity

**Pass 4 — Integration feasibility:**
- Check compatibility with the project's detected stack (from Phase 1)
- Search for "[candidate] + [framework]" integration guides
- Identify required changes to existing architecture

**Deep research output additions:**
- Source URLs for all claims (linked in the research doc)
- Confidence level per finding (High / Medium / Low — based on source quality)
- "Last verified" date for each external fact

### Phase 3: Synthesis
1. **Compare options** — pros/cons matrix with weighted criteria
2. **Recommend approach** — based on findings, with confidence level
3. **Flag risks** — technical concerns and unknowns
4. **Deep research only:** Include source bibliography and confidence assessment

## Output Format

```markdown
# Research: [Topic]

## Summary
[1-2 sentence overview]
**Research mode:** Standard | Deep
**Confidence:** High | Medium | Low

## Codebase Analysis
### Existing Patterns
| Pattern | Location | Relevance |

### Reusable Components
- [component]: [how to leverage]

## External Solutions
### Option 1: [Name]
- **Pros**: | **Cons**: | **Effort**:
- **Source**: [URL] (deep research only)

## Comparison Matrix
| Criteria | Weight | Option 1 | Option 2 |

## Recommendation
[Recommended approach with rationale]
**Confidence:** [High/Medium/Low] — [why]

## Risks & Unknowns
- [risk]: [mitigation]

## Sources (deep research only)
- [URL]: [what was learned]
```

## References

- `references/patterns.md` — Common architectural patterns
- `references/deep-research-guide.md` — Deep research methodology, search strategies, and source evaluation criteria

## Scripts

- `scripts/scan-patterns.sh [project-root]` — Auto-detect frameworks, languages, testing tools, and project structure conventions

## Integration

- Findings feed into `/specify` and `sdd-planner` subagent
- Can be invoked by `sdd-explorer` for deeper analysis
- Use the ask question tool when research reveals multiple valid approaches
- Deep research mode uses `WebSearch` and `WebFetch` tools extensively — ensure sandbox allows outbound access
