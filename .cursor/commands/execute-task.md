# /execute-task Command

Execute a specific task from a project roadmap, automatically determining the appropriate SDD command and updating roadmap status.

**Supports `--until-finish` flag** for automated sequential execution of all tasks in an epic.

**Subagent:** Delegates to the appropriate SDD subagent based on task phase. Implementation tasks use `sdd-implementer` (background), which spawns `sdd-verifier` as a child subagent.

**See also:** `.cursor/commands/_shared/agent-manual.md` for full agent protocol.

---

## Role

Execute tasks from project roadmaps by running appropriate SDD commands and tracking progress:
- Read roadmap and locate the specified task
- Validate dependencies are complete
- Determine and execute the appropriate SDD command
- Update roadmap status and log execution
- **With `--until-finish`:** Automatically continue to next task until epic is complete

---

## Usage

```
/execute-task [task-id] [--until-finish]
```

**Examples:**
```
/execute-task task-001-1                # Execute a single task
/execute-task epic-001                  # Execute first ready subtask in epic
/execute-task epic-001 --until-finish   # Execute ALL subtasks in epic sequentially
```

**Epic execution:** When given an epic ID, executes its subtasks in dependency order. A single task ID executes just that task.

**`--until-finish` flag:** Continues executing subtasks sequentially until the epic is complete. Stops on error and reports for fixing. For parallel execution, use `/execute-parallel` instead.

---

## Instructions

### Phase 1: Analysis

1. **Find roadmap:** Look in `specs/todo-roadmap/*/roadmap.json`
2. **Find task:** Locate task by ID in roadmap
3. **Validate dependencies:** Ensure all dependencies have status "done"
4. **Determine SDD command:** Map task phase to command:
   - `research` → `/research`
   - `brief` → `/brief`
   - `specification` → `/specify`
   - `planning` → `/plan`
   - `tasks` → `/tasks`
   - `implementation` → `/implement`
   - `evolution` → `/evolve`

### Phase 2: Planning

Present execution plan and wait for approval (unless `--until-finish`).

### Phase 3: Execution

1. **Update status:** Set task status to "in-progress" in roadmap.json
2. **Execute command:** Run the appropriate SDD command
3. **Link spec:** Update task with linked spec path
4. **Update status:** Change to "review" (or "done" with `--until-finish`)
5. **Log execution:** Add entry to execution-log.md
6. **Check unblocked:** Identify tasks that can now proceed

---

## Output

### Standard Output

```
✅ Task executed: [task-id]

**Summary:**
- Command: `/[command] [task-id]`
- Output: `specs/active/[task-id]/[file]`
- Status: review
- Unblocked: [count] tasks ready

**Next:** Review output or continue with `/execute-task [next-task]`
```

### `--until-finish` Output

**Per task:** `✅ [N/Total] [task-id] completed | Status: done | Continuing...`

**Final:** Summary table with all tasks, files created, and roadmap status.

**On error:** Stop and report error with resume instructions.

---

## `--until-finish` Workflow

Executes tasks **sequentially** in dependency order (one at a time). For parallel execution, use `/execute-parallel` instead.

1. **Identify tasks:** Build execution queue sorted by dependencies
2. **Pre-flight:** Show execution plan with estimated times
3. **Execute sequentially:** For each task — check dependencies → execute → verify → mark done → continue
4. **Handle errors:** Stop immediately, report error with resume instructions
5. **Completion:** Update epic status, generate summary, log execution time

## Error Recovery

When execution stops due to an error:

1. Fix the reported issue
2. Resume with: `/execute-task [failed-task-id] --until-finish`
3. Execution continues from the failed task onward

If a task is permanently blocked, manually mark it as `blocked` in `roadmap.json` and re-run — blocked tasks are skipped and their dependents remain blocked.

---

## Status Flow

`todo → in-progress → review → done` (with `blocked`, `on-hold`, `archived` variants)

## Dependency Management

- Check all dependencies have status "done" before executing
- When task completes, auto-unblock dependent tasks (update from "blocked" to "todo")

## Troubleshooting

- **Circular dependencies:** Detect and ask user to break cycle
- **Task in progress:** Ask to continue, restart, or mark complete
- **Command failed:** Log error, revert status, offer recovery
- **Wrong task type:** Handle epics by executing all subtasks sequentially

## Sequential vs Parallel

| Command | Execution | Best For |
|---------|-----------|----------|
| `/execute-task --until-finish` | **Sequential** (one at a time) | Simple projects, debugging, careful review |
| `/execute-parallel` | **Parallel** (batched via subagents) | Large projects, independent tasks |
| `/sdd-full-plan --until-finish` | **Parallel** (creates roadmap + orchestrator) | Full project from scratch |

---

## Related Commands

- `/sdd-full-plan [project-id] --until-finish` — Create roadmap and execute all tasks (parallel)
- `/execute-parallel [project-id]` — Parallel execution via async subagents
- `/brief`, `/research`, `/specify`, `/plan`, `/tasks`, `/implement`, `/evolve`, `/audit`
