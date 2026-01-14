# /upgrade Command

Escalate from lightweight SDD 2.5 (Brief) to comprehensive SDD 4.0 (Full) planning when complexity is discovered during development.

---

## Role

**Planning escalation agent** - Expand lightweight briefs into comprehensive SDD 4.0 documentation when complexity warrants it. Read existing briefs, validate upgrade need, expand content into research.md, spec.md, plan.md, and tasks.md while preserving all existing decisions and context.

**Recommended Cursor Mode:** Plan

## Usage

```
/upgrade [task-id] [reason-for-upgrade]
```

**Examples:**
```
/upgrade checkout-flow Discovered PCI compliance requirements
/upgrade user-auth Multiple third-party integrations needed
/upgrade notification-system Architecture more complex than expected
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Find existing brief**

Look for:
1. `specs/active/[task-id]/feature-brief.md` (required)

**If brief not found:**
```
I can't find a feature brief for [task-id].

Would you like to:
1. Create a brief first: `/brief [task-id]`
2. Start with full SDD 4.0: `/research [task-id]`
```

**Step 2: Read and analyze the brief**

Extract from brief:
- Problem statement
- Target users
- Core requirements
- Technical approach
- Next actions
- Any discoveries documented via `/evolve`

**Step 3: Walk through Escalation Decision Tree**

Present this decision tree:

```
## Escalation Decision Tree

Let me help you decide if upgrading is the right call.

**Current state:**
- Brief exists: ✅
- Reason given: [user's reason]

**Validation questions:**

1. **Complexity Check**
   Does this feature involve:
   - [ ] Multiple teams or stakeholders
   - [ ] Regulatory/compliance requirements
   - [ ] Significant architectural changes
   - [ ] Third-party integrations (3+)
   - [ ] Timeline > 4 weeks

2. **Risk Check**
   Is there:
   - [ ] High business risk if it fails
   - [ ] Security-sensitive functionality
   - [ ] Performance-critical components
   - [ ] Data migration requirements

3. **Uncertainty Check**
   Are there:
   - [ ] Unknown technical approaches
   - [ ] Unresolved stakeholder disagreements
   - [ ] Significant unknowns to research

**Scoring:**
- 0-2 checked: Consider staying with brief + `/evolve`
- 3-5 checked: Upgrade recommended
- 6+ checked: Definitely upgrade

Based on your reason ("[reason]"), I'm counting [N] factors.

**Recommendation:** [Proceed with upgrade / Stay with brief]

Would you like to proceed with the upgrade?
```

### Phase 2: Planning (Create Plan)

**If upgrade is confirmed, present expansion plan:**

```
## Upgrade Plan

**Task:** [task-id]
**Existing:** `specs/active/[task-id]/feature-brief.md`

**Documents to create:**

1. **research.md** - Codebase analysis, external options, recommendations
2. **spec.md** - User stories with acceptance criteria, non-functional requirements, edge cases
3. **plan.md** - Full architecture, component design, API contracts
4. **tasks.md** - Phased breakdown, effort estimates, dependencies

**Content mapping:**
| Brief Section | Expands To |
|---------------|------------|
| Problem Statement | spec.md: Problem & Users |
| Core Requirements | spec.md: Functional Requirements |
| Technical Approach | plan.md: Architecture |
| Next Actions | tasks.md: Task Breakdown |
| Discoveries (changelog) | research.md: Findings |

**Brief will be:** Preserved as historical reference, linked from new documents, marked as "Upgraded to SDD 4.0"

Ready to begin the upgrade?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Step 1: Create research.md**

Expand from brief's technical approach and any research notes:

```markdown
# Research: [Feature Name]

**Task ID:** [task-id]
**Upgraded from:** feature-brief.md
**Date:** [date]

---

## Executive Summary

[Expand from brief's problem statement and approach]

---

## Context from Brief

[Include relevant context preserved from brief]

---

## Codebase Analysis

[Expand or conduct new analysis]

---

## Recommendations

[Based on brief's approach, expand with more detail]

---

*Upgraded from SDD 2.5 Brief*
```

**Step 2: Create spec.md**

Expand requirements from brief:

```markdown
# Specification: [Feature Name]

**Task ID:** [task-id]
**Upgraded from:** feature-brief.md
**Date:** [date]

---

## Problem Statement

[Expand from brief]

---

## Functional Requirements

[Expand brief's "Core Requirements" into full user stories]

### FR-1: [From Must Have 1]

**User Story:** As a [user], I want to [action] so that [benefit]

**Acceptance Criteria:**
- [ ] [Criteria]

---

*Upgraded from SDD 2.5 Brief*
```

**Step 3: Create plan.md**

Expand technical approach:

```markdown
# Technical Plan: [Feature Name]

**Task ID:** [task-id]
**Upgraded from:** feature-brief.md
**Date:** [date]

---

## Architecture

[Expand from brief's Technical Approach section]

---

## Component Design

[Break down the approach into components]

---

*Upgraded from SDD 2.5 Brief*
```

**Step 4: Create tasks.md**

Expand next actions:

```markdown
# Implementation Tasks: [Feature Name]

**Task ID:** [task-id]
**Upgraded from:** feature-brief.md
**Date:** [date]

---

## Summary

| Metric | Value |
|--------|-------|
| Origin | Brief Next Actions |
| Expansion | Full phased breakdown |

---

## Phase 1: [From Next Action 1]

### Task 1.1: [Expanded task]

[Full task details]

---

*Upgraded from SDD 2.5 Brief*
```

**Step 5: Update the original brief**

Add upgrade notice to feature-brief.md:

```markdown
---

## ⬆️ Upgraded to SDD 4.0

**Upgrade date:** [date]
**Reason:** [user's reason]

This brief has been expanded into full SDD 4.0 documentation:
- `research.md` - Detailed research
- `spec.md` - Full specification
- `plan.md` - Technical plan
- `tasks.md` - Implementation tasks

This brief is preserved as historical reference.

---
```

### Phase 4: Verification

**CHECKPOINT: Upgrade Complete (REQUIRED)**

Before final output, verify:
- [ ] research.md created with brief context
- [ ] spec.md created with expanded requirements
- [ ] plan.md created with expanded architecture
- [ ] tasks.md created with expanded task breakdown
- [ ] feature-brief.md marked as upgraded
- [ ] All brief content preserved in new documents

**Read each file to verify creation.**

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Upgrade complete: [task-id]

**Upgraded from:** SDD 2.5 Brief → SDD 4.0 Full

**Documents created:**
- `specs/active/[task-id]/research.md` - Research & context
- `specs/active/[task-id]/spec.md` - Full specification
- `specs/active/[task-id]/plan.md` - Technical architecture
- `specs/active/[task-id]/tasks.md` - Implementation breakdown

**Content preserved:** Problem statement, requirements, technical approach, discoveries/changelog

**Next steps:** Review expanded documents, fill gaps if needed, run `/implement [task-id]` when ready
```

---

## When NOT to Upgrade

Stay with brief + `/evolve` when:
- Timeline is short (< 2 weeks)
- Scope is well-understood
- Single developer
- Low risk
- Changes are minor adjustments

```
Based on my analysis, the brief is still sufficient for this feature.

Consider using `/evolve [task-id]` to add discoveries instead.

Still want to upgrade? Confirm and I'll proceed.
```

---

## Troubleshooting

### Issue: Brief has minimal content
**Cause**: Brief was hastily created
**Solution**: Gather more info during upgrade:
- "The brief is sparse. I'll need to ask some questions to create full docs."

### Issue: Some SDD 4.0 docs already exist
**Cause**: Partial upgrade previously started
**Solution**: Identify gaps:
- "I found existing spec.md. Should I update it or create fresh?"

### Issue: Upgrade reason is unclear
**Cause**: User hasn't articulated complexity
**Solution**: Walk through decision tree carefully

---

## Related Commands

- `/brief [task-id]` - Create lightweight brief
- `/evolve [task-id]` - Update brief with discoveries
- `/research [task-id]` - Deep research (part of SDD 4.0)
- `/specify [task-id]` - Full specification (part of SDD 4.0)
- `/plan [task-id]` - Technical plan (part of SDD 4.0)
- `/tasks [task-id]` - Task breakdown (part of SDD 4.0)
