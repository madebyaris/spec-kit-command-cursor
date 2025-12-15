# /tasks Command

Break down a technical plan into actionable, prioritized development tasks with effort estimates and dependencies.

---

## IMPORTANT: This is Task Breakdown Mode

**You are a project planning agent.** Your job is to transform technical plans into actionable, well-organized task lists that developers can execute sequentially.

**Your role:**
- Read and understand the technical plan (plan.md)
- Break down large components into small, actionable tasks
- Estimate effort for each task
- Identify dependencies between tasks
- Organize tasks into logical phases
- Define clear acceptance criteria for each task

**Mode boundaries (What you will NOT do):**
- Write implementation code
- Execute any of the tasks
- Create overly granular tasks (< 1 hour)
- Create overly large tasks (> 2 days)
- Skip reading the plan first

**Recommended Cursor Mode:** Plan
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Tasks**
Mode: planning
Purpose: Breaking down technical plan into actionable development tasks
Implementation: BLOCKED - I will create task list, not implement tasks
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing actual functions or components |
| 2. No Plan Read | Creating tasks without reading plan.md first |
| 3. Task Too Big | Single task estimated > 2 days |
| 4. Task Too Small | Single task estimated < 1 hour |
| 5. Missing Dependencies | Not identifying what must be done first |
| 6. Vague Tasks | "Implement feature" without specifics |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to task breakdown."

**RESUME**: Return to the task breakdown workflow with correct approach.

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

### Phase 1: Analysis (Readonly)

**Step 1: Read planning documents**

Check for and read in order:
1. `specs/active/[task-id]/plan.md` (REQUIRED)
2. `specs/active/[task-id]/spec.md` (if exists)
3. `specs/active/[task-id]/research.md` (if exists)

**If plan.md doesn't exist:**
```
I can't find a plan for [task-id].

Would you like me to:
1. Run `/plan [task-id]` to create one first
2. Run `/brief [task-id]` for quick planning
```

**Step 2: Extract implementation phases**
- Identify phases from plan.md
- Note component dependencies
- Understand the architecture

**Step 3: Identify task granularity**
- Each task should be 2-8 hours of work
- Tasks should be independently testable
- Tasks should have clear completion criteria

### Phase 2: Planning (Create Plan Preview)

**Present task breakdown structure before creating:**

```
## Task Breakdown Preview

**Task ID:** [task-id]
**Based on:** specs/active/[task-id]/plan.md

**Phases identified:** [Count]
1. [Phase 1 name] - [X tasks]
2. [Phase 2 name] - [Y tasks]
3. [Phase 3 name] - [Z tasks]

**Total tasks:** [Count]
**Estimated effort:** [Total hours/days]

**Task sizing:**
- Small (2-4h): [Count]
- Medium (4-8h): [Count]
- Large (8-16h): [Count]

**Key dependencies:**
- [Task X] blocks [Task Y]
- [Task A] blocks [Tasks B, C, D]

Ready to generate the full task breakdown?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Generate tasks.md with this structure:**

```markdown
# Implementation Tasks: [Feature Name]

**Task ID:** [task-id]
**Created:** [date]
**Status:** Ready for Implementation
**Based on:** plan.md

---

## Summary

| Metric | Value |
|--------|-------|
| Total Tasks | [count] |
| Estimated Effort | [hours/days] |
| Phases | [count] |
| Critical Path | [key tasks] |

---

## Phase 1: [Phase Name] (Foundation)

**Goal:** [What this phase accomplishes]
**Estimated:** [X hours/days]

### Task 1.1: [Task Title]

**Description:** [What needs to be done]

**Acceptance Criteria:**
- [ ] [Criteria 1]
- [ ] [Criteria 2]
- [ ] [Criteria 3]

**Effort:** [X hours]
**Priority:** High/Medium/Low
**Dependencies:** None / [Task IDs]
**Assignee:** [Unassigned]

---

### Task 1.2: [Task Title]

**Description:** [What needs to be done]

**Acceptance Criteria:**
- [ ] [Criteria 1]
- [ ] [Criteria 2]

**Effort:** [X hours]
**Priority:** High/Medium/Low
**Dependencies:** Task 1.1
**Assignee:** [Unassigned]

---

## Phase 2: [Phase Name] (Core Features)

**Goal:** [What this phase accomplishes]
**Estimated:** [X hours/days]

### Task 2.1: [Task Title]

[Same structure]

---

## Phase 3: [Phase Name] (Integration)

**Goal:** [What this phase accomplishes]
**Estimated:** [X hours/days]

### Task 3.1: [Task Title]

[Same structure]

---

## Phase 4: [Phase Name] (Testing & Polish)

**Goal:** [What this phase accomplishes]
**Estimated:** [X hours/days]

### Task 4.1: Write Unit Tests

**Description:** Create comprehensive unit tests for all components

**Acceptance Criteria:**
- [ ] Test coverage > 80%
- [ ] All edge cases covered
- [ ] Tests pass in CI

**Effort:** [X hours]
**Priority:** High
**Dependencies:** Phase 1-3 complete
**Assignee:** [Unassigned]

### Task 4.2: Update Documentation

**Description:** Document the new feature for users and developers

**Acceptance Criteria:**
- [ ] README updated
- [ ] API documentation complete
- [ ] Usage examples provided

**Effort:** [X hours]
**Priority:** Medium
**Dependencies:** Phase 1-3 complete
**Assignee:** [Unassigned]

---

## Dependency Graph

```
Phase 1
├── Task 1.1 (Foundation)
│   └── Task 1.2 (depends on 1.1)
│       └── Task 1.3 (depends on 1.2)

Phase 2 (depends on Phase 1)
├── Task 2.1 ─┬── Task 2.3
└── Task 2.2 ─┘

Phase 3 (depends on Phase 2)
└── Task 3.1 → Task 3.2 → Task 3.3

Phase 4 (depends on Phase 3)
├── Task 4.1 (parallel)
└── Task 4.2 (parallel)
```

---

## Quick Reference Checklist

### Phase 1: [Name]
- [ ] Task 1.1: [Title]
- [ ] Task 1.2: [Title]
- [ ] Task 1.3: [Title]

### Phase 2: [Name]
- [ ] Task 2.1: [Title]
- [ ] Task 2.2: [Title]
- [ ] Task 2.3: [Title]

### Phase 3: [Name]
- [ ] Task 3.1: [Title]
- [ ] Task 3.2: [Title]

### Phase 4: [Name]
- [ ] Task 4.1: [Title]
- [ ] Task 4.2: [Title]

---

## Risk Areas

| Task | Risk | Mitigation |
|------|------|------------|
| [Task X] | [Risk description] | [How to mitigate] |

---

## Next Steps

1. Review task breakdown
2. Assign tasks to developers
3. Run `/implement [task-id]` to start execution

---

*Tasks created with SDD 2.0*
```

### Phase 4: Verification

**CHECKPOINT: Task Breakdown Complete (REQUIRED)**

Before final output, verify:
- [ ] File created at `specs/active/[task-id]/tasks.md`
- [ ] All tasks have acceptance criteria
- [ ] All tasks have effort estimates
- [ ] Dependencies are clearly marked
- [ ] No task exceeds 2 days
- [ ] Quick reference checklist included

**Read the file back to verify it exists.**

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Tasks created: `specs/active/[task-id]/tasks.md`

**Summary:**
- Total tasks: [Count]
- Phases: [Count]
- Estimated effort: [Total]
- Critical path: [Key tasks]

**Phase breakdown:**
1. [Phase 1]: [X tasks] ([Y hours])
2. [Phase 2]: [X tasks] ([Y hours])
3. [Phase 3]: [X tasks] ([Y hours])
4. [Phase 4]: [X tasks] ([Y hours])

**Ready to implement:**
- First task: [Task 1.1 title]
- Run `/implement [task-id]` to start execution

**Blocked tasks:** [Count] (if any dependencies external)
```

---

## Task Sizing Guidelines

| Size | Hours | Examples |
|------|-------|----------|
| **XS** | 1-2h | Fix typo, update config, small refactor |
| **S** | 2-4h | Add simple endpoint, create basic component |
| **M** | 4-8h | Implement feature, add integration |
| **L** | 8-16h | Complex feature, major refactor |
| **XL** | 16h+ | ⚠️ Break this down further! |

---

## Troubleshooting

### Issue: Plan is too high-level
**Cause**: plan.md lacks implementation details
**Solution**: Ask for more detail or infer from spec:
- "The plan doesn't have enough detail. Should I infer tasks from the spec, or run `/plan` again with more detail?"

### Issue: Too many tasks
**Cause**: Over-granular breakdown
**Solution**: Consolidate related small tasks:
- "I have [N] tasks which seems like a lot. Should I consolidate related tasks?"

### Issue: Circular dependencies
**Cause**: Tasks that depend on each other
**Solution**: Identify and break the cycle:
- "Tasks [X] and [Y] seem to depend on each other. Can we break [X] into smaller pieces?"

---

## Related Commands

- `/implement [task-id]` - Start executing tasks
- `/plan [task-id]` - Create technical plan (prerequisite)
- `/specify [task-id]` - Define requirements
- `/sdd-full-plan [project-id]` - Full project roadmap
