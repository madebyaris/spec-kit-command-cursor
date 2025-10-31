# /tasks Command

Break down technical plan into actionable development tasks.

## Usage
```
/tasks [feature-name]
```

## Prerequisites
- Must have existing `spec.md` and `plan.md` files
- Feature must exist in `specs/active/feat-XXX-[name]/` or `specs/active/[task-id]/`

## Purpose
Transform technical plans into discrete, manageable development tasks with clear dependencies and success criteria.

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure thoughtful task breakdown.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Read existing spec.md** - Understand all requirements
2. **Read existing plan.md** - Understand technical approach
3. **Identify work streams** - Find logical groupings
4. **Map dependencies** - Understand what must come first
5. **Assess complexity** - Gauge effort for each component

**Ask clarifying questions if needed:**
- How many developers will work on this? (affects parallelization)
- What's the timeline or deadline? (affects task sizing)
- Are there specific milestones or delivery phases needed?
- What can be done in parallel vs sequentially?
- Are there external dependencies (APIs, services, data)?
- What's the testing strategy (affects test task creation)?
- Are there deployment constraints to consider?

**Read relevant files:**
- Existing `specs/active/[task-id]/spec.md` (required)
- Existing `specs/active/[task-id]/plan.md` (required)
- Similar tasks in `specs/active/*/tasks.md` for patterns
- Templates at `.sdd/templates/tasks-template.md`

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be created:**
   - File path: `specs/active/[task-id]/tasks.md`

2. **Task breakdown strategy:**
   - **Phase structure:**
     - Phase 1: Foundation (infrastructure, setup)
     - Phase 2: Core features (main functionality)
     - Phase 3: Integration (connecting components)
     - Phase 4: Testing & Deployment
   
   - **Task sizing approach:**
     - Target: 1-2 days per task max
     - How we'll break down large components
     - Parallelization opportunities
   
   - **Dependency mapping:**
     - Critical path tasks
     - What can run in parallel
     - External dependencies

3. **Sample task preview (2-3 examples):**
   ```
   - Task: Implement user authentication service
     Effort: 2 days
     Dependencies: Database setup, API framework
     Priority: High
   ```

4. **Task categories to include:**
   - Setup and infrastructure tasks
   - Backend/API development tasks
   - Frontend/UI development tasks
   - Database and data migration tasks
   - Integration tasks
   - Testing tasks (unit, integration, e2e)
   - Documentation tasks
   - Deployment tasks

5. **Reasoning:**
   - Why this breakdown makes sense
   - How it maps to the plan
   - How tasks enable parallel work
   - Why these priorities

**The plan should show:**
- Clear task breakdown philosophy
- How phases organize work
- Example tasks to set expectations

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Generate tasks.md using template:**
   - Use `.sdd/templates/tasks-template.md` or `tasks-compact.md`
   - Organize into clear phases

2. **For each task, include:**
   - **Task ID and Name** - Clear, descriptive identifier
   - **Description** - What needs to be done
   - **Acceptance Criteria** - Definition of done
   - **Effort Estimate** - Hours or days
   - **Priority** - High/Medium/Low or P0/P1/P2
   - **Dependencies** - What must be completed first
   - **Assignee** - Who will do it (if known)
   - **Status** - todo/in-progress/blocked/done

3. **Task organization:**
   
   **Phase 1: Foundation**
   - Environment setup
   - Database schema creation
   - API framework setup
   - Basic infrastructure
   
   **Phase 2: Core Implementation**
   - Feature-specific development
   - Business logic implementation
   - Data processing
   - API endpoint creation
   
   **Phase 3: Integration & Polish**
   - Component integration
   - UI/UX implementation
   - Error handling
   - Edge case handling
   
   **Phase 4: Quality & Deployment**
   - Unit tests
   - Integration tests
   - E2E tests
   - Documentation
   - Deployment preparation
   - Monitoring setup

4. **Ensure quality:**
   - All plan components have tasks
   - All spec requirements covered
   - Tasks are appropriately sized
   - Dependencies are clear
   - Testing is comprehensive
   - Definition of done is specific

5. **Add tracking section:**
   - Progress overview
   - Milestone tracking
   - Risk and blocker tracking

### Phase 4: Documentation

**Finalize task breakdown:**
- Create progress tracking template
- Note critical path and dependencies
- Set up for `/implement` phase
- Provide task summary statistics

---

## Example
```
/tasks photo-organizer
```

## Implementation Rules
- **Break down into small tasks** (max 1-2 days each)
- **Define clear dependencies** between tasks
- **Include testing tasks** for each feature
- **Create deployment tasks**
- **Estimate effort realistically**
- **Assign priority levels**

## Task Organization
- **Phase 1**: Foundation tasks
- **Phase 2**: Core feature implementation
- **Phase 3**: Integration & testing  
- **Phase 4**: Deployment & monitoring

## Output
Creates: `specs/active/feat-XXX-[name]/tasks.md` or `specs/active/[task-id]/tasks.md`

## Notes for AI Assistants

- **Always present a plan first** showing breakdown strategy
- **Show task examples** in the plan to set expectations
- **Map every plan section** to specific tasks
- **Include testing tasks** - don't forget quality assurance
- **Wait for approval** before creating tasks file
- **Be comprehensive** - missing tasks lead to scope creep
- **Size appropriately** - too large = hard to track, too small = overhead
