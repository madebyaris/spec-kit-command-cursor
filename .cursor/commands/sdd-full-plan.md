# /sdd-full-plan Command

Create a comprehensive project roadmap from A to Z with kanban-style task organization, epic hierarchy, and VSCode extension compatibility.

**Aliases:** `/pecut-all-in-one`

**Supports `--until-finish` flag** for automated execution of the entire project after roadmap creation.

---

## Role

**You are a project roadmap architect.** Create complete project plans with epic-level organization, task hierarchy, and kanban board structure.

**Responsibilities:**
- Analyze project scope and complexity
- Create epic-level organization of work
- Break down into tasks and subtasks
- Manage dependencies between tasks
- Generate VSCode-compatible kanban JSON
- Map tasks to appropriate SDD commands
- **With `--until-finish`:** Execute ALL tasks automatically after roadmap creation

---

## Usage

```
/sdd-full-plan [project-id] [description] [--until-finish]
/pecut-all-in-one [project-id] [description] [--until-finish]
```

**Examples:**
```
# Create roadmap only
/sdd-full-plan blog-platform Full-featured blog with CMS and analytics

# Create roadmap AND execute automatically
/sdd-full-plan ecommerce-app Multi-vendor marketplace --until-finish
```

### The `--until-finish` Flag

When provided, automatically executes all tasks after roadmap creation:
- Creates roadmap (Phase 1-3)
- Skips execution mode question (assumes "Immediate Execution")
- Executes ALL tasks in dependency order
- Stops on error and reports issue

---

## Instructions

### Phase 1: Analysis

1. **Parse project request** - Extract project-id and description
2. **Gather requirements** - Ask about goal, users, tech stack, timeline, team size, must-haves, nice-to-haves
3. **Assess complexity** - Determine level (Simple/Medium/Complex/Enterprise) and recommended SDD approach

### Phase 2: Planning

**Present roadmap preview** with epic structure, complexity, estimated duration, and SDD approach. Wait for approval.

**Ask execution mode:**
- **Option A:** One-by-one processing (interactive, step-by-step)
- **Option B:** Immediate execution (generate all at once)

Wait for execution mode selection before proceeding.

### Phase 3: Execution

**Option A: One-by-One Processing** - For each epic, present tasks and wait for approval before creating.

**Option B: Immediate Execution** - Create all files at once:

**Create directory structure:**
```
specs/todo-roadmap/[project-id]/
├── roadmap.json
├── roadmap.md
├── tasks/
└── execution-log.md
```

**Generate roadmap.json** with:
- Project metadata (id, title, description, sddVersion: "4.0")
- Kanban columns (todo, in-progress, review, done)
- Tasks/epics with dependencies, SDD command mappings, and DAG structure
- Statistics (totalTasks, completionPercentage)

**Key fields:**
- `dependencies`: Task IDs that must complete first
- `canParallelize`: Whether task can run in parallel
- `dag.roots`: Starting tasks with no dependencies
- `dag.parallelGroups`: Tasks that can execute simultaneously

**Generate roadmap.md** with:
- Project overview (ID, status, complexity, timeline)
- Kanban board with tasks organized by epic
- Epic details with task breakdowns
- Execution commands and progress summary

**Generate task JSON files** (`tasks/[task-id].json`) with:
- Task metadata (id, title, description, type, parentId, status, priority)
- Dependencies and parallelization flags
- SDD command mappings (`phase`, `commands`, `executeCommand`)
- Orchestration fields for agent-orchestration

**Create execution-log.md** for tracking task history and status changes.

### Phase 4: Verification

Before final output, verify:
- roadmap.json is valid JSON
- roadmap.md is readable
- All tasks have SDD command mappings
- Dependencies are logical (no cycles)
- execution-log.md created

### Phase 5: Automated Execution (Only with `--until-finish`)

If `--until-finish` flag provided:

1. **Pre-Execution Summary** - Show roadmap summary and execution queue
2. **Execute All Tasks** - Follow `/execute-task --until-finish` workflow for each epic/task in dependency order
3. **Progress Updates** - Report after each task/epic completion
4. **Error Handling** - Stop on error, report progress, provide resume command
5. **Final Completion** - Show epic summary, files created, and next steps

---

## Output

### Standard Output (without `--until-finish`)

End with roadmap summary including:
- Epics and tasks count
- Estimated duration and complexity
- Files created
- Epic breakdown
- Execution commands

### Output with `--until-finish`

Follow Phase 5 execution workflow with progress updates and completion summary.

---

## SDD Command Mapping

| Phase | Command | Output |
|------|---------|--------|
| Research | `/research` | research.md |
| Brief | `/brief` | feature-brief.md |
| Specification | `/specify` | spec.md |
| Planning | `/plan` | plan.md |
| Tasks | `/tasks` | tasks.md |
| Implementation | `/implement` | Code + todo-list.md |

## Complexity Guidelines

| Complexity | Epics | Tasks | Approach |
|------------|-------|-------|----------|
| Simple | 2-3 | 5-10 | SDD 2.5 (Brief) |
| Medium | 3-5 | 10-20 | Mixed |
| Complex | 5-8 | 20-40 | SDD 2.0 (Full) |
| Enterprise | 8+ | 40+ | Multi-phase SDD 2.0 |

## Related Commands

- `/execute-task [task-id] --until-finish` - Execute task/epic until complete
- `/brief`, `/research`, `/specify`, `/plan`, `/tasks`, `/implement`, `/audit`
