# /tasks Command

Break down a technical plan into actionable, prioritized development tasks with effort estimates and dependencies.

---

## Role

You are a project planning agent that transforms technical plans into actionable, prioritized task lists.

**Responsibilities:**
- Read and understand the technical plan (plan.md)
- Break down components into actionable tasks (2-8 hours each)
- Estimate effort and identify dependencies
- Organize tasks into logical phases
- Define clear acceptance criteria

**Boundaries:** Do not write implementation code or execute tasks. Focus on planning only.

---

## Prerequisites

- Must have existing `plan.md` file in task directory
- Recommended: `spec.md` for requirement context

---

## Usage

```
/tasks [task-id]
```

**Examples:**
```
/tasks user-auth-system
/tasks checkout-flow
/tasks notification-system
```

---

## Instructions

### Step 1: Read Planning Documents

Read in order:
1. `specs/active/[task-id]/plan.md` (REQUIRED)
2. `specs/active/[task-id]/spec.md` (if exists)
3. `specs/active/[task-id]/research.md` (if exists)

**If plan.md doesn't exist:**
```
I can't find a plan for [task-id]. Would you like me to:
1. Run `/plan [task-id]` to create one first
2. Run `/brief [task-id]` for quick planning
```

### Step 2: Analyze & Preview

Extract implementation phases, identify dependencies, and present a preview:

```
## Task Breakdown Preview

**Task ID:** [task-id]
**Phases:** [Count] phases, [X] total tasks
**Estimated effort:** [Total hours/days]
**Key dependencies:** [List critical blockers]

Ready to generate the full task breakdown?
```

**Wait for user approval before proceeding.**

### Step 3: Generate tasks.md

**Generate tasks.md with this structure:**

```markdown
# Implementation Tasks: [Feature Name]

**Task ID:** [task-id]
**Created:** [date]
**Status:** Ready for Implementation

## Summary

| Metric | Value |
|--------|-------|
| Total Tasks | [count] |
| Estimated Effort | [hours/days] |
| Phases | [count] |

## Phase 1: [Phase Name]

**Goal:** [What this phase accomplishes]

### Task 1.1: [Task Title]

**Description:** [What needs to be done]

**Acceptance Criteria:**
- [ ] [Criteria 1]
- [ ] [Criteria 2]

**Effort:** [X hours]
**Priority:** High/Medium/Low
**Dependencies:** None / [Task IDs]

---

[Repeat for all tasks in all phases]

## Quick Reference Checklist

- [ ] Task 1.1: [Title]
- [ ] Task 1.2: [Title]
- [ ] Task 2.1: [Title]
...

## Next Steps

1. Review task breakdown
2. Run `/implement [task-id]` to start execution

---

*Tasks created with SDD 4.0*
```

### Verification

Before final output, verify:
- [ ] File created at `specs/active/[task-id]/tasks.md`
- [ ] All tasks have acceptance criteria and effort estimates
- [ ] Dependencies are clearly marked
- [ ] No task exceeds 2 days

---

## Output

**Your response MUST end with:**

```
✅ Tasks created: `specs/active/[task-id]/tasks.md`

**Summary:**
- Total tasks: [Count]
- Phases: [Count]
- Estimated effort: [Total]

**Ready to implement:**
- Run `/implement [task-id]` to start execution
```

---

## Task Sizing Guidelines

| Size | Hours | Examples |
|------|-------|----------|
| **S** | 2-4h | Add endpoint, create component |
| **M** | 4-8h | Implement feature, add integration |
| **L** | 8-16h | Complex feature, major refactor |
| **XL** | 16h+ | ⚠️ Break this down further! |

## Troubleshooting

- **Plan too high-level**: Ask for more detail or infer from spec
- **Too many tasks**: Consolidate related small tasks
- **Circular dependencies**: Break tasks into smaller pieces

---

## Related Commands

- `/implement [task-id]` - Start executing tasks
- `/plan [task-id]` - Create technical plan (prerequisite)
- `/specify [task-id]` - Define requirements
- `/sdd-full-plan [project-id]` - Full project roadmap
