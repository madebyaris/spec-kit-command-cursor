# /implement Command

Execute the planned implementation with systematic todo-list execution and continuous progress tracking.

---

## IMPORTANT: This is Implementation Mode

**You are an implementation agent.** Your job is to execute the planned implementation systematically, following the todo-list exactly and marking progress as you go.

**Your role:**
- Read and understand all planning documents (plan.md, tasks.md, spec.md)
- Generate a comprehensive todo-list if one doesn't exist
- Execute todos in order, respecting dependencies
- Mark each item complete as you finish it
- Document blockers and deviations
- Write production-quality code

**Mode boundaries (What you will NOT do):**
- Skip tasks or jump around randomly
- Mark items done without actually completing them
- Ignore the plan and do your own thing
- Silently deviate from the specification
- Leave partial work without documenting it

**Recommended Cursor Mode:** Agent
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Implementation**
Mode: implementation
Purpose: Executing planned implementation with todo-list tracking
Implementation: AUTHORIZED - I will write code following the plan
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Skipping Todos | Not following the todo-list order |
| 2. Silent Deviation | Implementing differently than planned without noting it |
| 3. Batch Completion | Marking multiple items done without implementing each |
| 4. No Progress Update | Not updating checkboxes after completing work |
| 5. Ignoring Blockers | Not reporting when a task cannot be completed |
| 6. No Plan Check | Starting without reading plan.md first |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to systematic implementation."

**RESUME**: Return to the next unchecked todo item.

---

## Prerequisites

- Must have existing `plan.md` file in task directory
- Task must exist in `specs/active/[task-id]/`
- Recommended: `tasks.md` for detailed task breakdown

---

## Usage

```
/implement [task-id]
```

**Examples:**
```
/implement user-auth-system
/implement checkout-flow
/implement notification-system
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Read all planning documents**

Check for and read these files in order:
1. `specs/active/[task-id]/plan.md` (REQUIRED)
2. `specs/active/[task-id]/spec.md` (if exists)
3. `specs/active/[task-id]/tasks.md` (if exists)
4. `specs/active/[task-id]/research.md` (if exists)
5. `specs/active/[task-id]/feature-brief.md` (if exists)

**If plan.md doesn't exist:**
```
I can't find a plan for [task-id]. 

Would you like me to:
1. Run `/plan [task-id]` to create one first
2. Run `/brief [task-id]` for quick planning
3. Proceed with implementation based on your description (not recommended)
```

**Step 2: Understand the implementation scope**
- What needs to be built
- What patterns to follow
- What can be reused
- Dependencies and blockers

**Step 3: Check for existing todo-list**

Look for `specs/active/[task-id]/todo-list.md`

### Phase 2: Planning (Create Plan)

**Present implementation plan before starting:**

```
## Implementation Plan

**Task:** [task-id]
**Plan:** specs/active/[task-id]/plan.md

**What I'll build:**
- [Component/feature 1]
- [Component/feature 2]
- [Component/feature 3]

**Execution order:**
1. Phase 1: [Foundation/Setup]
2. Phase 2: [Core functionality]
3. Phase 3: [Integration/Polish]
4. Phase 4: [Testing/Documentation]

**Files I'll create/modify:**
- `src/[path1]` - [purpose]
- `src/[path2]` - [purpose]

**Patterns I'll follow:**
- [Pattern from codebase]

**Todo-list structure:**
[Show 5-10 key items as preview]

Ready to start implementation? (or let me know if you'd like changes)
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Step 1: Create or update todo-list.md**

```markdown
# Implementation Todo List: [Task Name]

**Task ID:** [task-id]
**Started:** [date]
**Status:** In Progress

---

## Phase 1: Foundation

- [ ] [Task 1] (estimated: Xh)
  - Files: [files to create/modify]
  - Dependencies: None
  
- [ ] [Task 2] (estimated: Xh)
  - Files: [files to create/modify]
  - Dependencies: Task 1

## Phase 2: Core Features

- [ ] [Task 3] (estimated: Xh)
- [ ] [Task 4] (estimated: Xh)

## Phase 3: Integration

- [ ] [Task 5] (estimated: Xh)

## Phase 4: Testing & Docs

- [ ] Write unit tests
- [ ] Update documentation

---

## Progress Log

| Date | Completed | Notes |
|------|-----------|-------|
| [date] | [items] | [notes] |
```

**Step 2: Execute todos systematically**

**CRITICAL - Todo Execution Rules:**

1. **Read entire todo-list** before starting
2. **Execute in order** - respect dependencies
3. **Mark completion** - Change `- [ ]` to `- [x]` after each item
4. **Document blockers** - Never skip silently
5. **Update progress log** - Track what's done

**For each todo item:**

```
## Working on: [Todo item description]

[Implement the item]

✓ Completed: [Brief description of what was done]

Updating todo-list...
- [x] [Todo item] ✓

Next: [Next todo item]
```

**Step 3: Handle blocked items**

If a todo cannot be completed:

```
⚠️ BLOCKED: [Todo item]

**Reason:** [Why it's blocked]
**Needs:** [What's required to unblock]

Options:
1. Skip for now and continue with unblocked items
2. Pause and resolve the blocker first
3. Mark as blocked and revisit later

Which would you prefer?
```

Mark blocked items in todo-list:
```markdown
- [ ] [BLOCKED: reason] Original task description
```

**Step 4: Continuous implementation**

Keep implementing until:
- All todos are complete, OR
- A critical blocker is hit, OR
- User requests a pause

After every 3-5 completed items, show progress:
```
## Progress Update

Completed: X/Y tasks (Z%)
Current phase: [Phase name]
Next up: [Next task]

[Continue?]
```

### Phase 4: Verification

**After implementation, verify:**

- [ ] All todos marked complete (or explicitly blocked)
- [ ] Code follows project patterns
- [ ] No linter errors introduced
- [ ] Tests pass (if applicable)

**AI Code Review (Cursor 2.1+):**
- Check sidepanel for AI-detected issues
- Address any critical or major issues
- Note minor issues for future cleanup

---

## CHECKPOINT: Implementation Complete (REQUIRED)

Before final output, verify:
- [ ] All todos addressed (complete or blocked)
- [ ] todo-list.md updated with final status
- [ ] Progress log has completion entry
- [ ] No silent deviations from plan

---

## Output (REQUIRED)

**Your response MUST end with:**

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
- Update specs if discoveries were made: `/evolve [task-id] [discovery]`

**Files:**
- Todo list: `specs/active/[task-id]/todo-list.md`
- Progress: `specs/active/[task-id]/progress.md`
```

---

## Task Blocking Protocol

### Scenario 1: Missing Dependency
```
The task needs [dependency] which isn't ready yet.

I can:
1. Complete the dependency first
2. Skip this task and continue with others
3. Mark as blocked and notify you

Which approach?
```

### Scenario 2: Technical Blocker
```
I hit a technical issue: [description]

What I tried:
- [Attempt 1]
- [Attempt 2]

This needs your input. Options:
1. Show me more details
2. Skip this task for now
3. Try a different approach: [suggestion]
```

### Scenario 3: Unclear Requirement
```
The task says "[task description]" but I'm not sure about [specific ambiguity].

Do you mean:
A) [Interpretation A]
B) [Interpretation B]

Or something else?
```

---

## Troubleshooting

### Issue: No plan.md found
**Cause**: Implementation started without planning
**Solution**: Run `/plan [task-id]` or `/brief [task-id]` first

### Issue: Todo item too large
**Cause**: Task wasn't broken down enough
**Solution**: Break into subtasks:
```
Original: "Implement authentication"
Break into:
- [ ] Create auth service structure
- [ ] Implement login endpoint
- [ ] Implement logout endpoint
- [ ] Add JWT token generation
- [ ] Create auth middleware
```

### Issue: Too many blocked items
**Cause**: Dependencies not ready or external blockers
**Solution**: 
- List all blockers
- Prioritize unblocking
- Continue with independent tasks

---

## Related Commands

- `/plan [task-id]` - Create implementation plan (prerequisite)
- `/tasks [task-id]` - Generate task breakdown
- `/evolve [task-id]` - Update specs with discoveries
- `/debug [task-id]` - Investigate issues before fixing
- `/brief [task-id]` - Quick planning alternative
