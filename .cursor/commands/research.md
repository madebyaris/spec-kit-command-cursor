# /research Command

Investigate existing patterns and gather context before specification.

**Subagent:** Delegates to `sdd-explorer` (fast, readonly, foreground) for codebase discovery. Uses `sdd-research` skill for structured investigation.

**See also:** `.cursor/commands/_shared/agent-manual.md` for full agent protocol.

---

## Role

Research and document findings without making changes to the codebase.

**What you do:**
- Search codebase for patterns and conventions
- Analyze existing implementations
- Research external solutions with pros/cons
- Present options without making final decisions

**Output:** `specs/active/[task-id]/research.md`

---

## Usage

```
/research [task-id] [research-topic]
/research [task-id] [research-topic] --deep
```

**Flags:**
- `--deep` — Activate deep research mode: multi-pass web investigation with source verification, documentation deep-dives, real-world validation, and confidence assessment. Use for unfamiliar domains, high-stakes decisions, or when standard research leaves too many unknowns.

**Examples:**
```
/research user-auth JWT vs session-based authentication patterns
/research payment-system Stripe integration patterns in existing codebase
/research caching Redis vs in-memory caching for our use case
/research database-engine Best database for our use case --deep
/research auth-provider Compare Auth0 vs Clerk vs Supabase Auth --deep
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Parse the research request**
- Extract task-id: `{{input}}`
- Extract research topic
- Identify key questions to answer

**Step 2: Clarify research scope**

Ask if any of these are unclear:
- Should we focus on internal patterns or external solutions?
- Are there specific technologies to consider or avoid?
- What constraints exist (performance, cost, team expertise)?
- What's the primary goal: understand existing code or explore new approaches?

**Question format:**
```
Before I start researching, a quick question:

Should I focus on:
A) Internal patterns - How does our codebase already handle similar things?
B) External solutions - What libraries/approaches are available?
C) Both - Full analysis of internal and external options

(Default: C - Both)
```

**Step 3: Plan research strategy**

Identify:
- Which directories to search
- What patterns to look for
- External resources to consult
- Time allocation (internal vs external)

### Phase 2: Planning (Create Plan)

**Present research plan before starting:**

```
## Research Plan

**Task ID:** [task-id]
**Topic:** [research topic]

**Research Questions:**
1. [Key question 1]
2. [Key question 2]
3. [Key question 3]

**Internal Research (Codebase):**
- Search directories: [list]
- Patterns to find: [list]
- Similar features to study: [list]

**External Research:**
- Technologies to evaluate: [list]
- Best practices to document: [list]

**Output:**
- File: `specs/active/[task-id]/research.md`
- Structure: Executive Summary → Codebase Analysis → External Options → Recommendations

**Estimated time:** 60 minutes

Ready to proceed?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Step 1: Create directory structure**
```
specs/active/[task-id]/
└── research.md
```

**Step 2: Conduct internal research**

Search the codebase for:
- Similar feature implementations
- Patterns and conventions used
- Reusable utilities and components
- Architectural decisions

**For each finding, document:**
```markdown
### [Pattern/Feature Name]

**Location:** `path/to/file.ts`

**How it works:**
[Brief explanation]

**Code example:**
```[language]
[Relevant code snippet]
```

**Reusability:** [How this applies to our task]
```

**Step 3: Conduct external research**

**Standard mode** — For each option/technology:
```markdown
### [Option Name]

**What it is:** [Brief description]

**Pros:**
- [Advantage 1]
- [Advantage 2]

**Cons:**
- [Disadvantage 1]
- [Disadvantage 2]

**Fit for our use case:** [High/Medium/Low] - [Why]
```

**Deep mode** (`--deep` flag) — Perform multi-pass investigation per the `sdd-research` skill's deep research protocol:

1. **Pass 1 — Landscape scan:** Use `WebSearch` to survey the solution space, identify top 3-5 candidates
2. **Pass 2 — Documentation deep-dive:** Use `WebFetch` to read official docs, API references, pricing pages for each candidate. Extract: API surface, limits, pricing, platform support, license
3. **Pass 3 — Real-world validation:** Search for production reviews, benchmarks, comparisons, and known issues. Check community health (GitHub stars, npm downloads, SO activity)
4. **Pass 4 — Integration feasibility:** Search for integration guides with the project's detected stack. Verify SDK/adapter availability and runtime compatibility

For each finding, record the source URL and reliability rating. See `sdd-research` skill `references/deep-research-guide.md` for search strategies and source evaluation criteria.

**Step 4: Generate research.md**

Use this structure:

```markdown
# Research: [Topic]

**Task ID:** [task-id]
**Date:** [date]
**Status:** Complete

---

## Executive Summary

[2-3 paragraph summary of key findings and initial recommendation]

---

## Codebase Analysis

### Existing Patterns

[Document patterns found in codebase with code examples]

### Reusable Components

[List components/utilities that can be reused]

### Conventions to Follow

[Coding conventions and architectural patterns to maintain]

---

## External Solutions

### Option 1: [Name]

**Overview:** [Description]

**Pros:**
- [Pro 1]
- [Pro 2]

**Cons:**
- [Con 1]
- [Con 2]

**Implementation complexity:** [Low/Medium/High]
**Team familiarity:** [Low/Medium/High]

### Option 2: [Name]

[Same structure]

### Option 3: [Name]

[Same structure]

---

## Comparison Matrix

| Criteria | Option 1 | Option 2 | Option 3 |
|----------|----------|----------|----------|
| Performance | ⭐⭐⭐ | ⭐⭐ | ⭐⭐⭐ |
| Complexity | ⭐⭐ | ⭐⭐⭐ | ⭐ |
| Team fit | ⭐⭐⭐ | ⭐ | ⭐⭐ |
| Maintenance | ⭐⭐ | ⭐⭐⭐ | ⭐⭐ |

---

## Recommendations

### Primary Recommendation

[Recommended approach with rationale]

### Alternative Approach

[Backup option if primary doesn't work]

---

## Open Questions

- [Question for specification phase]
- [Decision that needs stakeholder input]

---

## Sources (deep research only)

| # | URL | Type | Reliability | Key Finding |
|---|-----|------|-------------|-------------|
| 1 | [url] | [Official docs / Benchmark / Blog / Discussion] | [High/Medium/Low] | [finding] |

---

## Confidence Assessment (deep research only)

**Overall confidence:** [High/Medium/Low]
**Reasoning:** [Why this confidence level]
**Gaps:** [What we still don't know]
**Suggested spike:** [If Low confidence — describe a 2-4h prototype to validate]

---

## Next Steps

1. Review findings with team
2. Proceed to `/specify` to define requirements
3. Address open questions before planning

---

*Research completed with SDD 5.0*
```

### Phase 4: Verification

**CHECKPOINT: Research Complete (REQUIRED)**

Before final output, verify:
- [ ] File created at `specs/active/[task-id]/research.md`
- [ ] Codebase patterns documented with examples
- [ ] Multiple options presented with pros/cons
- [ ] Comparison matrix included
- [ ] Recommendations provided with rationale
- [ ] Open questions listed

**Read the file back to verify it exists.**

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Research complete: `specs/active/[task-id]/research.md`

**Mode:** Standard | Deep
**Key Findings:**
- [Finding 1]
- [Finding 2]
- [Finding 3]

**Recommendation:** [Primary recommendation]
**Confidence:** [High/Medium/Low] (deep research only)

**Codebase patterns found:** [Count] reusable patterns
**Options evaluated:** [Count] approaches compared
**Sources consulted:** [Count] (deep research only)

**Next steps:**
- Review the research document
- Discuss recommendations with team if needed
- Run `/specify [task-id]` to define requirements
- Or run `/plan [task-id]` if requirements are clear

**Open questions:** [Count] items need input before proceeding
```

---

## Troubleshooting

### Issue: No existing patterns found
**Cause**: New project or greenfield feature
**Solution**: Focus on external research and best practices:
- "No existing patterns found - this will establish new conventions"
- Document industry best practices instead

### Issue: Too many options to evaluate
**Cause**: Broad research topic
**Solution**: Narrow scope:
- "There are many approaches here. Let me focus on the top 3 based on [criteria]"

### Issue: Conflicting patterns in codebase
**Cause**: Technical debt or evolution over time
**Solution**: Note both and recommend:
- "I found two different patterns for this. Pattern A (newer, in X files) and Pattern B (older, in Y files). Recommend following Pattern A."

---

## Related Commands

- `/specify [task-id]` - Define requirements based on research
- `/plan [task-id]` - Create technical plan (if requirements clear)
- `/brief [task-id]` - Quick planning (skip deep research)
- `/sdd-full-plan [project-id]` - Full project roadmap
