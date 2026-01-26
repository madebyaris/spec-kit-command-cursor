# /execute-task Command

Execute a specific task from a project roadmap, automatically determining the appropriate SDD command and updating roadmap status.

**Supports `--until-finish` flag** for automated sequential execution of all tasks in an epic.

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
/execute-task epic-001
/execute-task task-001-1
/execute-task epic-001 --until-finish  # Automated sequential execution
```

**`--until-finish` flag:** Executes epic/subtasks sequentially without stopping. Stops on error and reports for fixing.

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

1. **Identify tasks:** Build execution queue sorted by dependencies
2. **Pre-flight:** Show execution plan with estimated times
3. **Execute sequentially:** For each task, check dependencies → execute → mark done → continue
4. **Handle errors:** Stop immediately, report error, wait for fix before resuming
5. **Completion:** Update epic status, generate summary, log execution time

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
- **Wrong task type:** Handle epics by executing subtasks

---

## Related Commands

- `/sdd-full-plan [project-id] --until-finish` - Create roadmap and execute all tasks
- `/brief`, `/research`, `/specify`, `/plan`, `/tasks`, `/implement`, `/evolve`, `/audit`
