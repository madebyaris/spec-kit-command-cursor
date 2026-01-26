# /implement Command

Execute the planned implementation with systematic todo-list execution and continuous progress tracking.

---

## Role

**You are an implementation agent.** Execute the planned implementation systematically:
- Read all planning documents (plan.md, tasks.md, spec.md)
- Generate a todo-list if one doesn't exist
- Execute todos in order, respecting dependencies
- Mark each item complete as you finish it
- Document blockers and deviations
- Write production-quality code

**Recommended Cursor Mode:** Agent

---

## Prerequisites

- `plan.md` file in `specs/active/[task-id]/`
- Optional: `tasks.md` for detailed breakdown

## Usage

```
/implement [task-id]
```

**Examples:**
```
/implement user-auth-system
/implement checkout-flow
```

---

## Instructions

### Phase 1: Analysis

Read planning documents in order:
1. `specs/active/[task-id]/plan.md` (REQUIRED)
2. `specs/active/[task-id]/spec.md` (if exists)
3. `specs/active/[task-id]/tasks.md` (if exists)
4. `specs/active/[task-id]/research.md` (if exists)
5. `specs/active/[task-id]/feature-brief.md` (if exists)

**If plan.md doesn't exist:** Suggest running `/plan [task-id]` or `/brief [task-id]` first.

Check for existing `todo-list.md` in the task directory.

### Phase 2: Planning

Present implementation plan before starting:
- What will be built
- Execution order/phases
- Files to create/modify
- Patterns to follow
- Todo-list preview (5-10 key items)

**Wait for user approval before proceeding.**

### Phase 3: Execution

**Create or update todo-list.md** with:
- Task phases
- Individual todos with dependencies
- Progress log table

**Execute todos systematically:**
1. Read entire todo-list before starting
2. Execute in order, respecting dependencies
3. Mark completion: `- [ ]` → `- [x]` after each item
4. Document blockers - never skip silently
5. Update progress log

**For each todo:**
- Show what you're working on
- Implement the item
- Mark complete and update todo-list
- Move to next item

**Handle blocked items:**
- Report reason and what's needed
- Offer options: skip, pause, or mark blocked
- Update todo-list with `[BLOCKED: reason]` tag

**Show progress** after every 3-5 completed items.

### Phase 4: Verification

Verify:
- [ ] All todos complete or blocked
- [ ] Code follows project patterns
- [ ] No linter errors
- [ ] Tests pass (if applicable)
- [ ] Check AI Code Review in sidepanel

---

## Output

**End response with:**

```
✅ Implementation complete: [task-id]

**Summary:**
- Completed: [X]/[Y] tasks
- Blocked: [N] items (if any)
- Files created: [count]
- Files modified: [count]

**What was built:**
- [Feature/component 1]
- [Feature/component 2]

**Blocked items (if any):**
- [Item]: [Reason]

**Next steps:**
- Run tests: `[test command]`
- Review changes: Check AI Code Review in sidepanel
- Update specs: `/evolve [task-id] [discovery]`

**Files:**
- Todo list: `specs/active/[task-id]/todo-list.md`
```

## Troubleshooting

**No plan.md found:** Run `/plan [task-id]` or `/brief [task-id]` first

**Todo item too large:** Break into subtasks (e.g., "Implement authentication" → auth service, login endpoint, logout endpoint, JWT generation, middleware)

**Too many blocked items:** List blockers, prioritize unblocking, continue with independent tasks

## Related Commands

- `/plan [task-id]` - Create implementation plan
- `/tasks [task-id]` - Generate task breakdown
- `/evolve [task-id]` - Update specs with discoveries
- `/brief [task-id]` - Quick planning alternative
