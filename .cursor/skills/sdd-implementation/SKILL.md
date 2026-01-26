---
name: sdd-implementation
description: Execute planned implementations following todo-lists systematically. Use for code generation, building features, and executing SDD plans.
---

# SDD Implementation Skill

Build what has been planned, following specs and todo-lists precisely.

## When to Use

- Executing planned implementations
- Code generation from specifications
- Building features according to plan
- Following todo-lists systematically

## Protocol

### Step 1: Load the Plan
Read in order:
1. `specs/active/[task-id]/plan.md` - Technical approach
2. `spec.md` - Requirements and acceptance criteria
3. `tasks.md` - Task breakdown
4. `todo-list.md` - Execution checklist

### Step 2: Execute Systematically

1. **Read entire list** before starting any work
2. **Execute in order** - respect dependency chains
3. **Mark completion** - Change `- [ ]` → `- [x]` immediately
4. **Document blockers** - Never skip silently, use `[BLOCKED: reason]`

### Step 3: Follow Patterns
Reference `references/patterns.md` for:
- Project-specific conventions
- Common implementation patterns
- Code quality standards

### Step 4: Track Progress
Use `scripts/progress.sh` to visualize completion status.

### Step 5: Report Completion

```markdown
## Implementation Summary

### Completed
- [x] Task 1: description
- [x] Task 2: description

### Files Created/Modified
- `path/to/file.ts`: [purpose]

### Blockers Encountered
- [blocker and resolution]

### Discoveries
- [anything that should update specs]

### Next Steps
- [recommended follow-up]
```

## Code Quality Standards

- Follow existing project patterns (check similar files first)
- Match naming conventions used in the codebase
- Handle errors appropriately
- Consider edge cases from spec
- Write testable code

## Anti-Patterns to Avoid

- Skipping tasks without explanation
- Marking items done without completing them
- Implementing differently than planned without noting why
- Not updating checkboxes after completing work
- Ignoring blockers instead of documenting them

## Integration

- After completion, `sdd-verifier` subagent validates work
- Discoveries trigger `sdd-evolve` skill for spec updates
- Use the ask question tool for ambiguous requirements
