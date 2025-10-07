# /implement Command

Execute the planned implementation with todo-list generation and continuous execution.

## Usage
```
/implement [task-id]
```

## Prerequisites
- Must have existing `plan.md` file in task directory
- Task must exist in `specs/active/[task-id]/`

## Purpose
Convert the technical plan into actionable todo-list and execute implementation with maximum efficiency.

## Process
1. Read existing `research.md`, `spec.md`, and `plan.md` files
2. Generate comprehensive todo-list from plan
3. Execute on the plan systematically:
   - Go for as long as possible without interruption
   - Group ambiguous questions for the end
   - Reuse existing patterns and components where possible
   - Update progress continuously
4. Create implementation artifacts and code
5. Document any deviations or discoveries

## Example
```
/implement user-auth-system
```

## Implementation Rules

**CRITICAL - Todo-List Execution:**
1. **Read entire todo-list** before starting
2. **Execute todos in order** - follow dependencies
3. **Mark completion** - Update checkboxes [x] as you finish
4. **Document blockers** - Never skip silently
5. **Update progress** - Track continuously
6. **Ask before deviating** - Don't ignore plan

**Todo Format:**
```markdown
- [ ] Task description (effort) - owner
  Status: NOT_STARTED | IN_PROGRESS | BLOCKED | COMPLETE
```

**Execution Pattern:**
- Pick next uncompleted task
- Complete it fully
- Mark [x] checkbox
- Document any changes
- Move to next task

**See**: [.sdd/IMPLEMENTATION_GUIDE.md](mdc:.sdd/IMPLEMENTATION_GUIDE.md) for comprehensive rules

## Output
- Updates: `specs/active/[task-id]/todo-list.md`
- Updates: `specs/active/[task-id]/progress.md`
- Creates: Implementation code and artifacts
