# /brief Command

Create a lightweight feature brief in ~30 minutes, then start coding.

---

## Role

Create focused feature briefs through analysis and strategic questioning.

**What you do:**
- Analyze feature description and extract requirements
- Ask clarifying questions when information is missing
- Search codebase for existing patterns
- Present plan before creating files

**Output:** `specs/active/[task-id]/feature-brief.md`

---

## Usage

```
/brief [task-id] [feature-description]
```

**Examples:**
```
/brief user-auth JWT authentication with login/logout
/brief checkout-flow Streamlined one-page checkout with guest option
/brief notification-system Real-time push notifications for mobile
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Parse the request**
- Extract task-id from input: `{{input}}`
- Extract feature description
- Identify key requirements and intent

**Step 2: Check existing patterns**
- Search codebase for similar features
- Look in `specs/active/` for related briefs
- Note reusable patterns and conventions

**Step 3: Assess information completeness**

Ask clarifying questions if ANY of these are unclear:
- What problem does this solve?
- Who are the primary users?
- What are the must-have vs nice-to-have features?
- Are there technical constraints or preferences?
- What does success look like?

**Question format:**
```
Before I create the brief, I have a few questions:

1. [Most important question]
2. [Second question if needed]

(Feel free to skip any that aren't relevant)
```

**Step 4: Evaluate complexity**

| Indicator | Stay with Brief | Upgrade to Full SDD |
|-----------|-----------------|---------------------|
| Timeline | < 3 weeks | > 3 weeks |
| Team size | 1-2 developers | Multiple teams |
| Risk level | Low-medium | High (payments, security) |
| Architecture | Existing patterns | New patterns needed |
| Dependencies | Few/none | Multiple external |

If complexity suggests Full SDD, mention:
> "This looks like it might benefit from full SDD 2.0 planning. Would you like me to create a brief for now, or should we use `/research` → `/specify` → `/plan` for more thorough planning?"

### Phase 2: Planning (Create Plan)

**Present a plan before creating any files:**

```
## Brief Creation Plan

**Task ID:** [task-id]
**Feature:** [feature name]

**What I'll create:**
- File: `specs/active/[task-id]/feature-brief.md`
- Structure: Problem → Users → Requirements → Approach → Next Actions

**Research scope (15 min):**
- [What I'll search for in codebase]
- [Patterns I'll look for]

**Brief will include:**
- Problem statement and target users
- Core requirements (must-haves only)
- Quick technical approach
- 3-5 immediate next actions
- Success criteria

**Estimated time:** 30 minutes total

Ready to proceed? (or let me know if you'd like changes)
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Step 1: Create directory**
```
specs/active/[task-id]/
```

**Step 2: Conduct quick research (15 min)**
- Search for similar patterns in codebase
- Document key findings
- Note reusable components

**Step 3: Generate feature-brief.md**

Use this structure:

```markdown
# Feature Brief: [Feature Name]

**Task ID:** [task-id]
**Created:** [date]
**Status:** Ready for Development

---

## Problem Statement

[What problem does this solve? 2-3 sentences]

## Target Users

[Who will use this? Be specific]

## Core Requirements

### Must Have
- [ ] [Requirement 1]
- [ ] [Requirement 2]
- [ ] [Requirement 3]

### Nice to Have
- [ ] [Optional 1]
- [ ] [Optional 2]

## Technical Approach

[High-level approach, 3-5 sentences]

**Patterns to Follow:**
- [Existing pattern 1 from codebase]
- [Existing pattern 2 from codebase]

**Key Decisions:**
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

## Next Actions

1. [ ] [First concrete step]
2. [ ] [Second step]
3. [ ] [Third step]

## Success Criteria

- [ ] [How we know it's done 1]
- [ ] [How we know it's done 2]

## Open Questions

- [Any unresolved questions]

---

*Brief created with SDD 4.0 - Ready to code!*
```

### Phase 4: Verification

Verify file created and contains: problem statement, 3+ requirements, actionable next steps.

---

## Output

```
✅ Brief created: `specs/active/[task-id]/feature-brief.md`

**Summary:**
- Problem: [One sentence]
- Core requirements: [Count] must-haves
- Next actions: [Count] items

**Next:** Start coding or run `/upgrade [task-id]` for full SDD 2.0
```

---

## Troubleshooting

### Issue: Feature is too vague
**Cause**: User provided minimal description like "build a dashboard"
**Solution**: Ask probing questions:
- "What specific problem does this dashboard solve?"
- "Who will use it and what decisions will they make?"
- "What data needs to be displayed?"

### Issue: Feature is too complex for brief
**Cause**: Multi-team, high-risk, or architecturally significant feature
**Solution**: Suggest Full SDD 2.0:
- "This looks complex. Would you prefer full planning with `/research` → `/specify` → `/plan`?"

### Issue: Can't find existing patterns
**Cause**: New project or greenfield feature
**Solution**: Note it explicitly:
- "No existing patterns found - this will establish new conventions"

---

## Related Commands

- `/evolve [task-id]` - Update brief as you discover things
- `/upgrade [task-id]` - Expand to full SDD 2.0 if needed
- `/implement [task-id]` - Start implementation (requires plan.md)
- `/refine [task-id]` - Refine the brief through discussion
- `/research [task-id]` - Deep pattern research (Full SDD 2.0)
