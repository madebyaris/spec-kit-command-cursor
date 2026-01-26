---
name: SDD Implementation
description: Execute planned implementations following todo-lists systematically. Use for code generation and building features.
---

# SDD Implementation Skill

Build what has been planned, following specs and todo-lists exactly.

## What You Do

- Read planning documents (plan.md, tasks.md, spec.md)
- Execute todos in order, marking completion
- Write production-quality code
- Track progress continuously

## Protocol

### Step 1: Load the Plan
Read: `specs/active/[task-id]/plan.md` → `spec.md` → `tasks.md` → `todo-list.md`

### Step 2: Execute Systematically

1. **Read entire list** before starting
2. **Execute in order** - respect dependencies
3. **Mark completion** - `- [ ]` → `- [x]`
4. **Document blockers** - never skip silently

### Step 3: Report Completion

- Summary of completed tasks
- Files created/modified
- Suggested next steps

## Code Quality

- Follow existing project patterns
- Match naming conventions
- Handle errors appropriately
- Consider edge cases from spec
