# /sdd-full-plan Command

Create a comprehensive project roadmap from A to Z with kanban-style task organization, epic hierarchy, and VSCode extension compatibility.

**Aliases:** `/pecut-all-in-one`

**Supports `--until-finish` flag** for automated execution of the entire project after roadmap creation.

---

## IMPORTANT: This is Full Project Planning Mode

**You are a project roadmap architect.** Your job is to create complete project plans with epic-level organization, task hierarchy, and kanban board structure.

**Your role:**
- Analyze project scope and complexity
- Create epic-level organization of work
- Break down into tasks and subtasks
- Manage dependencies between tasks
- Generate VSCode-compatible kanban JSON
- Map tasks to appropriate SDD commands
- **With `--until-finish`:** After roadmap creation, execute ALL tasks automatically

**Mode boundaries (What you will NOT do):**
- Write implementation code (until execution phase with `--until-finish`)
- Execute any tasks (unless `--until-finish` flag is provided)
- Skip complexity analysis
- Create roadmaps without user approval
- Skip the execution mode selection question (unless `--until-finish`)
- **With `--until-finish`:** Continue past errors without fixing them first

**Recommended Cursor Mode:** Plan → Agent (when `--until-finish` triggers execution)
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Full Project Planning**
Mode: planning
Purpose: Creating comprehensive A-Z project roadmap with kanban structure
Implementation: BLOCKED - I will plan the entire project, not implement it
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing actual functions or starting to build |
| 2. Skipping Complexity Analysis | Not assessing project scope first |
| 3. No Execution Mode Question | Creating tasks without asking one-by-one vs immediate |
| 4. Missing Dependencies | Not identifying task relationships |
| 5. Wrong SDD Mapping | Tasks not mapped to appropriate SDD commands |
| 6. Invalid JSON | Kanban JSON with syntax errors |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to roadmap planning."

**RESUME**: Return to the planning workflow with correct approach.

---

## Usage

```
/sdd-full-plan [project-id] [description] [--until-finish]
/pecut-all-in-one [project-id] [description] [--until-finish]
```

**Examples:**
```
# Create roadmap only (manual execution)
/sdd-full-plan blog-platform Full-featured blog with CMS and analytics
/pecut-all-in-one saas-dashboard Admin dashboard for SaaS product

# Create roadmap AND execute everything automatically
/sdd-full-plan ecommerce-app Multi-vendor marketplace --until-finish
/pecut-all-in-one blog-platform Full blog with CMS --until-finish
```

### The `--until-finish` Flag

When `--until-finish` is provided:
1. **Creates the roadmap** as usual (Phase 1-3)
2. **Skips execution mode question** - assumes "Immediate Execution"
3. **Automatically starts executing ALL tasks** in dependency order
4. **No user intervention needed** - runs until complete or error
5. **Stops on error** - reports issue and waits for fix before continuing

**This is the "fire and forget" mode** - start it and come back when it's done!

**Flow:**
```
/sdd-full-plan project --until-finish
    ↓
Create Roadmap → Execute Epic 1 → Execute Epic 2 → ... → 🎉 Project Complete!
                      ↓
                 ❌ Error → STOP → Report → Fix → Resume
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Parse the project request**
- Extract project-id: `{{input}}`
- Extract project description
- Identify initial scope

**Step 2: Gather requirements**

Ask these questions:
```
Before I create the roadmap, I need some information:

1. **Goal**: What's the primary goal/problem this solves?
2. **Users**: Who are the target users?
3. **Tech Stack**: Any technology preferences? (or should I recommend?)
4. **Timeline**: Any deadline or timeline constraints?
5. **Team**: How many developers will work on this?
6. **Must-haves**: What are the 3-5 critical features?
7. **Nice-to-haves**: What features can wait for later versions?

(Answer what you can, skip what you're unsure about)
```

**Step 3: Assess complexity**

| Indicator | Simple | Medium | Complex | Enterprise |
|-----------|--------|--------|---------|------------|
| Timeline | < 3 weeks | 3-8 weeks | 8-20 weeks | 20+ weeks |
| Team size | 1-2 | 2-4 | 4-8 | 8+ |
| Features | 3-5 | 5-10 | 10-20 | 20+ |
| Integrations | 0-2 | 2-5 | 5-10 | 10+ |
| Risk level | Low | Medium | High | Very High |

**Determine:**
- Complexity level
- Recommended SDD approach (2.5 vs 2.0)
- Number of epics and tasks

### Phase 2: Planning (Create Plan Preview)

**Present roadmap structure:**

```
## Project Roadmap Preview

**Project ID:** [project-id]
**Complexity:** [Simple/Medium/Complex/Enterprise]
**Estimated duration:** [X weeks]
**Recommended approach:** [SDD 2.5 Brief / SDD 2.0 Full / Mixed]

**Epic Structure:**
1. Epic 1: [Name] - [X tasks]
2. Epic 2: [Name] - [Y tasks]
3. Epic 3: [Name] - [Z tasks]
[...]

**Total tasks:** [Count]
**Estimated effort:** [Hours/Days]

**What I'll create:**
- `specs/todo-roadmap/[project-id]/roadmap.json` - Kanban data
- `specs/todo-roadmap/[project-id]/roadmap.md` - Human-readable view
- `specs/todo-roadmap/[project-id]/tasks/*.json` - Task details
- `specs/todo-roadmap/[project-id]/execution-log.md` - Tracking

Does this structure look right?
```

**Wait for approval, then ask execution mode:**

```
**How would you like to proceed with task creation?**

**Option A: One-by-One Processing** (Recommended for learning)
- Review and approve each epic as it's created
- Interactive, step-by-step approach
- Best for: New projects, thorough review

**Option B: Immediate Execution**
- Generate all tasks at once
- Fast, automated setup
- Best for: Experienced users, well-understood projects

Which mode would you prefer? (A/B)
```

**Wait for execution mode selection before proceeding.**

### Phase 3: Execution (After Approval AND Mode Selection)

#### Option A: One-by-One Processing

**For each epic:**

```
## Creating Epic [N]: [Epic Name]

**Description:** [What this epic covers]

**Tasks in this epic:**
1. [Task 1] - [SDD command] - [Effort]
2. [Task 2] - [SDD command] - [Effort]
3. [Task 3] - [SDD command] - [Effort]

**Total:** [X tasks], [Y hours]

Create this epic now? (Yes/No/Skip)
```

After approval:
- Create epic JSON file
- Update roadmap.json
- Update roadmap.md
- Show progress

```
✓ Epic [N] created

Progress: [N]/[Total] epics
Tasks created: [Count]
Remaining: [Count] epics

Continue to next epic?
```

#### Option B: Immediate Execution

Create everything at once:

**Step 1: Create directory structure**
```
specs/todo-roadmap/[project-id]/
├── roadmap.json
├── roadmap.md
├── tasks/
│   ├── epic-001.json
│   ├── task-001-1.json
│   └── ...
└── execution-log.md
```

**Step 2: Generate roadmap.json**

```json
{
  "id": "{{project-id}}",
  "title": "{{Project Title}}",
  "description": "{{Description}}",
  "type": "application",
  "created": "{{ISO date}}",
  "updated": "{{ISO date}}",
  "status": "planning",
  "metadata": {
    "sddVersion": "3.0",
    "complexity": "{{simple|medium|complex|enterprise}}",
    "estimatedDuration": "{{X weeks}}",
    "teamSize": 1
  },
  "columns": [
    {"id": "todo", "title": "To Do", "order": 0, "tasks": []},
    {"id": "in-progress", "title": "In Progress", "order": 1, "tasks": []},
    {"id": "review", "title": "Review", "order": 2, "tasks": []},
    {"id": "done", "title": "Done", "order": 3, "tasks": []}
  ],
  "tasks": {
    "epic-001": {
      "id": "epic-001",
      "title": "{{Epic Title}}",
      "type": "epic",
      "status": "todo",
      "sdd": {
        "phase": "research",
        "commands": ["/research"],
        "executeCommand": "/execute-task epic-001"
      }
    }
  },
  "statistics": {
    "totalTasks": 0,
    "todoTasks": 0,
    "completionPercentage": 0
  }
}
```

> **Note:** Replace `{{placeholder}}` values with actual data. Numbers like `teamSize`, `totalTasks`, `todoTasks` must be valid integers.

**Step 3: Generate roadmap.md**

```markdown
# Project Roadmap: [Project Name]

**Project ID:** [project-id]
**Created:** [date]
**Status:** Planning
**Complexity:** [Level]

---

## Overview

[Project description]

**Timeline:** [X weeks]
**Effort:** [Y hours]
**Team:** [Z developers]

---

## Kanban Board

### 📋 To Do ([Count])

#### Epic 1: [Name]
- [ ] Task 1-1: [Title] ([Xh]) - `/execute-task task-001-1`
- [ ] Task 1-2: [Title] ([Yh]) - `/execute-task task-001-2`

#### Epic 2: [Name]
- [ ] Task 2-1: [Title] ([Xh]) - `/execute-task task-002-1`

### 🔄 In Progress ([Count])

(Empty)

### 👀 Review ([Count])

(Empty)

### ✅ Done ([Count])

(Empty)

---

## Epic Details

### Epic 1: [Name]

**Goal:** [What this epic achieves]
**SDD Phase:** Research → Specification
**Estimated:** [X hours]

| Task | Description | Effort | Command |
|------|-------------|--------|---------|
| 1-1 | [Description] | [Xh] | `/execute-task task-001-1` |
| 1-2 | [Description] | [Yh] | `/execute-task task-001-2` |

---

## Execution Commands

```bash
# Start first epic
/execute-task epic-001

# Execute specific task
/execute-task task-001-1
```

---

## Progress Summary

| Metric | Value |
|--------|-------|
| Total Epics | [N] |
| Total Tasks | [M] |
| Completed | 0 |
| Completion | 0% |

---

*Roadmap created with SDD 3.0*
```

**Step 4: Generate task JSON files**

For each task, create `tasks/[task-id].json`:

```json
{
  "id": "task-001-1",
  "title": "{{Task Title}}",
  "description": "{{Description}}",
  "type": "task",
  "parentId": "epic-001",
  "status": "todo",
  "priority": "high",
  "estimatedHours": 2,
  "dependencies": [],
  "sdd": {
    "phase": "brief",
    "commands": ["/brief"],
    "linkedSpec": null,
    "executeCommand": "/execute-task task-001-1"
  }
}
```

> **Note:** Replace `{{placeholder}}` values with actual data. Use real task IDs, and ensure `estimatedHours` is a valid number.

**Step 5: Create execution-log.md**

```markdown
# Execution Log: [Project Name]

## Task History

| Date | Task | Action | Duration | Notes |
|------|------|--------|----------|-------|
| | | | | |

## Status Changes

| Date | Task | From | To | By |
|------|------|------|----|----|
| | | | | |
```

### Phase 4: Verification

**CHECKPOINT: Roadmap Complete (REQUIRED)**

Before final output, verify:
- [ ] roadmap.json is valid JSON
- [ ] roadmap.md is readable
- [ ] All tasks have SDD command mappings
- [ ] Dependencies are logical (no cycles)
- [ ] Execution-log.md created

**Read roadmap.json back to verify it exists.**

---

### Phase 5: Automated Execution (Only with `--until-finish`)

**If `--until-finish` flag was provided, continue to automated execution:**

#### Step 1: Pre-Execution Summary

```
✅ Roadmap created: `specs/todo-roadmap/[project-id]/`

**Summary:**
- Epics: [Count]
- Tasks: [Count]
- Estimated duration: [X weeks]

🚀 **Starting Automated Execution (--until-finish)**

**Execution Queue:**
| Order | Epic/Task | Phase | Command |
|-------|-----------|-------|---------|
| 1 | epic-001 | - | - |
| 1.1 | task-001-1 | brief | /brief |
| 1.2 | task-001-2 | implementation | /implement |
| 2 | epic-002 | - | - |
| 2.1 | task-002-1 | brief | /brief |
[...]

**Total tasks to execute:** [N]
**Estimated time:** [X hours]

Beginning execution...
```

#### Step 2: Execute All Tasks

Follow the `/execute-task --until-finish` workflow for each epic:

```python
for epic in roadmap.epics:
    print(f"📦 Starting Epic: {epic.id} - {epic.title}")
    
    for task in epic.tasks:
        # Execute each task
        result = execute_task(task)
        
        if result.success:
            print(f"✅ [{current}/{total}] {task.id} completed")
        else:
            # STOP on error
            print(f"❌ Error in {task.id}")
            print("Fix the error, then resume with:")
            print(f"/execute-task {task.id} --until-finish")
            return  # Exit
    
    print(f"✅ Epic {epic.id} complete!")

print("🎉 All epics complete! Project finished!")
```

#### Step 3: Progress Updates

After each task:
```
✅ [5/23] task-001-2 completed
   Epic: epic-001 (3/5 tasks done)
   Command: /implement | Duration: 12m
   
   Continuing...
```

After each epic:
```
📦 Epic epic-001 complete! (5/5 tasks)
   Duration: 45m
   Files created: 12
   
   Starting next epic: epic-002...
```

#### Step 4: Error Handling

If any task fails:

```
❌ **Execution Stopped - Error in task-002-3**

**Progress so far:**
- ✅ Epic 1: Complete (5/5 tasks)
- 🔄 Epic 2: Partial (2/4 tasks)
  - ✅ task-002-1
  - ✅ task-002-2
  - ❌ task-002-3 (FAILED)
  - ⏸️ task-002-4 (pending)

**Error details:**
[Error description]

**To fix and continue:**
1. Fix the error
2. Resume: `/execute-task task-002-3 --until-finish`

**To skip this task:**
1. Mark as blocked in roadmap.json
2. Resume: `/execute-task task-002-4 --until-finish`
```

#### Step 5: Final Completion

When all tasks complete:

```
🎉 **PROJECT COMPLETE!**

**Project:** [project-id] - [Project Title]
**Total Duration:** [X hours Y minutes]
**Tasks Executed:** [N]

**Epic Summary:**
| Epic | Tasks | Duration | Status |
|------|-------|----------|--------|
| epic-001 | 5 | 45m | ✅ Complete |
| epic-002 | 4 | 1h 20m | ✅ Complete |
| epic-003 | 3 | 30m | ✅ Complete |

**Files Created:**
- Specs: [N] files in `specs/active/`
- Code: [M] files in `src/`
- Docs: [P] files

**Roadmap Status:**
- All tasks: done
- Completion: 100%

**What's next:**
- Review the code: `src/`
- Run tests: `npm test`
- Deploy: Your choice!

*Full execution log: `specs/todo-roadmap/[project-id]/execution-log.md`*
```

---

## Output (REQUIRED)

### Standard Output (without `--until-finish`)

**Your response MUST end with:**

```
✅ Roadmap created: `specs/todo-roadmap/[project-id]/`

**Summary:**
- Epics: [Count]
- Tasks: [Count]
- Estimated duration: [X weeks]
- Complexity: [Level]

**Files created:**
- `roadmap.json` - Kanban board data
- `roadmap.md` - Human-readable view
- `tasks/` - [Count] task files
- `execution-log.md` - Tracking

**Epic breakdown:**
1. [Epic 1]: [X tasks] - [SDD approach]
2. [Epic 2]: [Y tasks] - [SDD approach]
[...]

**To start:**
```bash
/execute-task epic-001
```

**Or execute everything automatically:**
```bash
/execute-task epic-001 --until-finish
```

**View roadmap:**
Open `specs/todo-roadmap/[project-id]/roadmap.md`
```

### Output with `--until-finish`

See Phase 5 above for the complete execution output format.

---

## SDD Command Mapping

| Task Phase | SDD Command | Output |
|------------|-------------|--------|
| Research | `/research` | research.md |
| Brief | `/brief` | feature-brief.md |
| Specification | `/specify` | spec.md |
| Planning | `/plan` | plan.md |
| Task Breakdown | `/tasks` | tasks.md |
| Implementation | `/implement` | Code + todo-list.md |

---

## Complexity Guidelines

| Complexity | Epics | Tasks | Approach |
|------------|-------|-------|----------|
| **Simple** | 2-3 | 5-10 | SDD 2.5 (Brief) |
| **Medium** | 3-5 | 10-20 | Mixed |
| **Complex** | 5-8 | 20-40 | SDD 2.0 (Full) |
| **Enterprise** | 8+ | 40+ | Multi-phase SDD 2.0 |

---

## Troubleshooting

### Issue: Project too vague
**Cause**: Description lacks detail
**Solution**: Ask more specific questions about features and scope

### Issue: Too many tasks
**Cause**: Over-scoped project
**Solution**: Suggest phased approach:
- "This is a large project. Should we plan Phase 1 first and roadmap the rest later?"

### Issue: Conflicting priorities
**Cause**: Everything is "must have"
**Solution**: Force prioritization:
- "If you could only ship 5 features in v1, which would they be?"

---

## Related Commands

- `/execute-task [task-id] --until-finish` - Execute task/epic until complete
- `/brief [task-id]` - Quick feature planning
- `/research [task-id]` - Deep research phase
- `/implement [task-id]` - Implementation phase
- `/audit [task-id]` - Spec-driven audit
