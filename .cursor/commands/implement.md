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

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure systematic implementation.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Read all planning documents:**
   - `research.md` (if exists) - Context and patterns
   - `spec.md` (if exists) - Requirements
   - `plan.md` (required) - Technical approach
   - `tasks.md` (if exists) - Task breakdown

2. **Understand codebase context:**
   - Identify where code will be added/modified
   - Note existing patterns to follow
   - Check for reusable components
   - Understand file/directory structure

3. **Assess implementation scope:**
   - What needs to be built
   - What can be reused
   - What patterns to follow
   - Dependencies and blockers

**Ask clarifying questions if needed:**
- Should we start with a specific phase or component?
- Are there high-priority items to tackle first?
- Any known blockers or dependencies to address upfront?
- Should we focus on backend, frontend, or full-stack?
- Are there existing examples to follow for similar features?

**Read relevant files:**
- All specification documents in task directory
- Existing codebase files that will be modified
- Similar implementations for patterns
- Template at `.sdd/templates/todo-list-template.md`

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be created:**
   - File path: `specs/active/[task-id]/todo-list.md`
   - File path: `specs/active/[task-id]/progress.md` (if doesn't exist)

2. **Implementation strategy:**
   - **Execution order:**
     - Phase 1: Foundation and setup
     - Phase 2: Core functionality
     - Phase 3: Integration and polish
     - Phase 4: Testing and documentation
   
   - **Pattern reuse approach:**
     - Existing patterns identified
     - Components that can be reused
     - Conventions to follow

3. **Todo-list structure preview (5-10 key items):**
   ```markdown
   - [ ] Setup database schema (2h)
   - [ ] Create API service layer (3h)
   - [ ] Implement authentication middleware (2h)
   - [ ] Build frontend components (4h)
   - [ ] Write unit tests (3h)
   ```

4. **Implementation approach:**
   - File organization strategy
   - What code files will be created/modified
   - Testing strategy
   - How we'll track progress

5. **Success criteria:**
   - Definition of done for implementation
   - How we'll validate completeness
   - What makes this "ready to ship"

**The plan should show:**
- Clear execution roadmap
- Preview of key todos
- How plan maps to actual code

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Generate todo-list.md using template:**
   - Use `.sdd/templates/todo-list-template.md` or `todo-compact.md`
   - Create comprehensive, ordered checklist
   - Include all items from plan/tasks

2. **Todo-list format:**
   ```markdown
   ## Phase 1: Foundation
   - [ ] Task description (estimated time)
     - **Acceptance criteria:** Clear done condition
     - **Files:** List of files to create/modify
     - **Dependencies:** What must be done first
   ```

3. **Begin systematic implementation:**
   
   **CRITICAL - Todo Execution Rules:**
   - **Read entire todo-list** before starting
   - **Execute in order** - respect dependencies
   - **Mark completion** - Update `- [ ]` to `- [x]`
   - **Document blockers** - Never skip silently
   - **Update progress.md** continuously
   - **Ask before deviating** from plan
   
   **Execution pattern:**
   ```
   1. Pick next uncompleted todo
   2. Complete it fully
   3. Mark [x] checkbox in todo-list.md
   4. Update progress.md
   5. Move to next todo
   ```

4. **Implementation principles:**
   - **Continuous flow** - Go as long as possible
   - **Pattern reuse** - Follow existing conventions
   - **Quality focus** - Write clean, tested code
   - **Documentation** - Comment complex logic
   - **Progress tracking** - Keep stakeholders informed

5. **Create/modify code files:**
   - Follow plan architecture
   - Maintain code quality
   - Write tests alongside features
   - Document as you go

6. **Update progress tracking:**
   - Mark todos complete as you finish them
   - Update `progress.md` with current status
   - Document any discoveries or changes
   - Note any deviations from plan

### Phase 4: Documentation

**Finalize implementation:**
- Ensure all todos marked complete
- Update progress.md with final status
- Document any plan deviations
- Note learnings for future features
- Suggest `/evolve` updates if discoveries made

---

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
- Creates: `specs/active/[task-id]/todo-list.md`
- Updates: `specs/active/[task-id]/progress.md`
- Creates: Implementation code and artifacts

## Notes for AI Assistants

- **Always present a plan first** showing implementation strategy
- **Show todo preview** in the plan (5-10 key items)
- **Explain execution order** and why
- **Wait for approval** before creating todo-list
- **Execute systematically** - follow the todo-list exactly
- **Mark progress continuously** - update checkboxes as you complete
- **Document everything** - discoveries, blockers, changes
- **Go for flow** - implement continuously without interruption
- **Quality matters** - don't rush, write good code
