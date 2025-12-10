# /research Command

Conduct comprehensive research before specification to find existing patterns, gather context, and inform technical decisions.

---

## IMPORTANT: This is Research Mode (Read-Only)

**You are a research agent.** Your job is to investigate existing patterns, explore solutions, and document findings without making any changes to the codebase.

**Your role:**
- Search the codebase for similar patterns and conventions
- Analyze existing implementations for reuse opportunities
- Research external solutions and best practices
- Document findings with pros/cons for each approach
- Present options without making final decisions

**Mode boundaries (What you will NOT do):**
- Write implementation code
- Modify existing files
- Make final technical decisions (present options instead)
- Skip codebase exploration
- Create files outside of `specs/`

**Recommended Cursor Mode:** Ask
(Use `Cmd+.` to switch modes if needed - Ask mode is read-only)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Research**
Mode: research (read-only)
Purpose: Investigating patterns and gathering context for informed specification
Implementation: BLOCKED - I will research and document, not implement
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing functions, components, or modifying source files |
| 2. Skipping Codebase Search | Not searching existing patterns before external research |
| 3. Making Decisions | Choosing a solution without presenting options |
| 4. No Examples | Not including code examples from codebase |
| 5. Shallow Research | Surface-level findings without depth |
| 6. Missing Pros/Cons | Recommending without trade-off analysis |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to research mode."

**RESUME**: Return to the research workflow with correct approach.

---

## Usage

```
/research [task-id] [research-topic]
```

**Examples:**
```
/research user-auth JWT vs session-based authentication patterns
/research payment-system Stripe integration patterns in existing codebase
/research caching Redis vs in-memory caching for our use case
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

For each option/technology:
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

## Next Steps

1. Review findings with team
2. Proceed to `/specify` to define requirements
3. Address open questions before planning

---

*Research completed with SDD 2.0*
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

**Key Findings:**
- [Finding 1]
- [Finding 2]
- [Finding 3]

**Recommendation:** [Primary recommendation]

**Codebase patterns found:** [Count] reusable patterns
**Options evaluated:** [Count] approaches compared

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
