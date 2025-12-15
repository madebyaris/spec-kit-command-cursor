# /execute-task Command

Execute a specific task from a project roadmap, automatically determining the appropriate SDD command and updating roadmap status.

**Supports `--until-finish` flag** for automated sequential execution of all tasks in an epic.

---

## IMPORTANT: This is Task Execution Mode

**You are a task execution orchestrator.** Your job is to execute tasks from the roadmap by running the appropriate SDD commands and tracking progress.

**Your role:**
- Read the roadmap and find the specified task
- Validate dependencies are complete
- Determine the appropriate SDD command
- Execute the command with task context
- Update roadmap status after completion
- Log execution in execution-log.md
- **With `--until-finish`:** Automatically continue to next task until epic is complete

**Mode boundaries (What you will NOT do):**
- Execute tasks with incomplete dependencies
- Skip dependency validation
- Forget to update roadmap status
- Execute without showing the plan first (unless `--until-finish`)
- **With `--until-finish`:** Continue past errors without fixing them first

**Recommended Cursor Mode:** Agent (for implementation tasks) or Plan (for planning tasks)
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Task Execution**
Mode: orchestration
Purpose: Executing roadmap task with appropriate SDD command
Implementation: DETERMINED BY TASK TYPE
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Skipping Dependencies | Executing a task when blockers exist |
| 2. Wrong SDD Command | Using /implement for a research task |
| 3. No Status Update | Completing work without updating roadmap |
| 4. No Execution Log | Not logging the execution |
| 5. Task Not Found | Proceeding without finding the task |
| 6. Orphan Execution | Executing without reading roadmap first |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to proper task execution."

**RESUME**: Return to the execution workflow with correct approach.

---

## Usage

```
/execute-task [task-id] [--until-finish]
```

**Examples:**
```
/execute-task epic-001
/execute-task task-001-1
/execute-task task-002-3

# Automated execution - complete entire epic without stopping
/execute-task epic-001 --until-finish
/execute-task task-001-1 --until-finish
```

### The `--until-finish` Flag

When `--until-finish` is provided:
- **For an epic:** Executes the epic and ALL its subtasks sequentially
- **For a task:** Executes the task and continues with remaining tasks in the same epic
- **No user approval needed** between tasks - fully automated
- **Stops on error:** If any task fails, stops and reports the error for fixing
- **Auto-marks done:** After successful execution, marks task as "done" (not "review")

**Flow with `--until-finish`:**
```
Start → Execute Task 1 → ✅ Done → Execute Task 2 → ✅ Done → ... → All Complete!
                              ↓
                         ❌ Error → STOP → Report Error → Wait for Fix → Resume
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Find the roadmap**

Look for roadmap in:
1. `specs/todo-roadmap/*/roadmap.json` - Find all roadmaps
2. Parse task-id to determine project

**If roadmap not found:**
```
I can't find a roadmap containing task [task-id].

Available roadmaps:
- [project-1]: [X tasks]
- [project-2]: [Y tasks]

Or run `/sdd-full-plan [project-id]` to create a new roadmap.
```

**Step 2: Find the task**

Read roadmap.json and locate the task:
- Find task by ID in `tasks` object
- Read task details (type, phase, dependencies, status)

**If task not found:**
```
I can't find task [task-id] in the roadmap.

Available tasks:
- [task-1]: [Title]
- [task-2]: [Title]
[...]

Did you mean one of these?
```

**Step 3: Validate dependencies**

Check if all dependencies are complete:

```javascript
for each dependency in task.dependencies:
  if roadmap.tasks[dependency].status !== "done":
    // Task is blocked
```

**If blocked:**
```
⚠️ Task [task-id] is blocked by incomplete dependencies:

| Dependency | Status | Title |
|------------|--------|-------|
| [dep-1] | [status] | [title] |
| [dep-2] | [status] | [title] |

Would you like to:
1. Execute blocking task first: `/execute-task [dep-1]`
2. Force execution anyway (not recommended)
3. View dependency details
```

**Step 4: Determine SDD command**

Map task phase to command:

| Task Phase | SDD Command | Mode |
|------------|-------------|------|
| research | `/research [task-id]` | Ask |
| brief | `/brief [task-id]` | Plan |
| specification | `/specify [task-id]` | Plan |
| planning | `/plan [task-id]` | Plan |
| tasks | `/tasks [task-id]` | Plan |
| implementation | `/implement [task-id]` | Agent |
| evolution | `/evolve [task-id]` | Plan |

### Phase 2: Planning (Create Plan)

**Present execution plan:**

```
## Task Execution Plan

**Task:** [task-id]
**Title:** [Task title]
**Type:** [epic/task/subtask]
**Phase:** [research/brief/specification/planning/implementation]

**Current status:** [todo/in-progress/blocked]
**Dependencies:** ✅ All complete (or list incomplete)

**What I'll do:**
1. Run: `[SDD command] [task-id] [context]`
2. Create: `specs/active/[task-id]/[output-file]`
3. Update: `roadmap.json` status to "in-progress" → "review"
4. Log: Add entry to `execution-log.md`

**Recommended Cursor Mode:** [Agent/Plan/Ask]

Ready to execute?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Step 1: Update roadmap status to in-progress**

Update the task in `roadmap.json` (example with actual values):

```json
{
  "id": "task-001-1",
  "status": "in-progress",
  "startedAt": "2024-01-15T10:30:00Z"
}
```

Also update the column:
- Remove from `columns.todo.tasks`
- Add to `columns.in-progress.tasks`

**Step 2: Execute the SDD command**

Run the appropriate command with context from the task:

```
Executing: /[command] [task-id] [task.description]
```

**The command execution follows the template for that command** (e.g., /research template, /implement template, etc.)

**Step 3: Link spec to task**

After command completes, update task (example with actual values):

```json
{
  "id": "task-001-1",
  "sdd": {
    "linkedSpec": "specs/active/task-001-1/",
    "executedAt": "2024-01-15T11:00:00Z"
  }
}
```

**Step 4: Update status to review**

```json
{
  "id": "task-001-1",
  "status": "review"
}
```

Move in columns:
- Remove from `columns.in-progress.tasks`
- Add to `columns.review.tasks`

**Step 5: Log execution**

Add to `execution-log.md`:

```markdown
| [date] | [task-id] | Completed | [duration] | [command] executed, output: [file] |
```

**Step 6: Check for unblocked tasks**

After completion, check if this unblocks other tasks:

```
Completing [task-id] unblocked:
- [task-X]: Now ready to execute
- [task-Y]: Now ready to execute
```

### Phase 4: Verification

**CHECKPOINT: Execution Complete (REQUIRED)**

Before final output, verify:
- [ ] SDD command executed successfully
- [ ] Output file created in `specs/active/[task-id]/`
- [ ] roadmap.json updated with new status
- [ ] Task moved to correct column
- [ ] execution-log.md updated

**Read roadmap.json to verify updates.**

---

## Output (REQUIRED)

### Standard Output (without `--until-finish`)

**Your response MUST end with:**

```
✅ Task executed: [task-id]

**Execution summary:**
- Command: `/[command] [task-id]`
- Output: `specs/active/[task-id]/[file]`
- Status: todo → in-progress → review
- Duration: [time]

**Roadmap updated:**
- Task status: review
- Column: In Progress → Review
- Linked spec: `specs/active/[task-id]/`

**Unblocked tasks:** [Count]
- [task-X]: Ready to execute
- [task-Y]: Ready to execute

**Next steps:**
- Review the output: `specs/active/[task-id]/[file]`
- Mark as done: (manually update status to "done")
- Continue: `/execute-task [next-task]`

**Progress:** [Completed]/[Total] tasks ([Percentage]%)
```

### Output with `--until-finish` (Per Task)

After each task in the sequence:

```
✅ [N/Total] Task completed: [task-id]
   Command: /[command] | Duration: [time] | Status: done
   
   Continuing to next task...
```

### Final Output with `--until-finish`

When all tasks are complete:

```
🎉 **All Tasks Complete!**

**Epic:** [epic-id] - [Epic Title]
**Total tasks executed:** [N]
**Total duration:** [time]

**Execution Summary:**
| # | Task | Command | Duration | Status |
|---|------|---------|----------|--------|
| 1 | [task-001-1] | /brief | 5m | ✅ done |
| 2 | [task-001-2] | /implement | 15m | ✅ done |
| 3 | [task-001-3] | /implement | 10m | ✅ done |

**Files created:**
- `specs/active/[task-id]/feature-brief.md`
- `src/components/[Component].tsx`
- [...]

**Roadmap updated:**
- Epic status: done
- All subtasks: done
- Progress: [X]/[Total] ([Y]%)

**What's next:**
- Start next epic: `/execute-task epic-002 --until-finish`
- Or review: Open `specs/todo-roadmap/[project]/roadmap.md`
```

### Error Output with `--until-finish`

If a task fails during automated execution:

```
❌ **Execution Stopped - Error in Task [task-id]**

**Completed before error:** [N] tasks
**Failed task:** [task-id] - [Title]

**Error:**
[Description of what went wrong]

**Current state:**
- Tasks 1-[N]: ✅ done
- Task [N+1]: ❌ failed (status: in-progress)
- Tasks [N+2]-[Total]: ⏸️ pending

**To fix and continue:**
1. Fix the error in [task-id]
2. Resume: `/execute-task [task-id] --until-finish`

**Or to skip and continue:**
- Mark as blocked: Update status to "blocked" in roadmap.json
- Continue: `/execute-task [next-task-id] --until-finish`
```

---

## `--until-finish` Workflow

When the `--until-finish` flag is provided, follow this automated workflow:

### Step 1: Identify All Tasks to Execute

**If starting from an epic:**
```
1. Read the epic and find all subtasks
2. Sort by dependency order (tasks with no dependencies first)
3. Create execution queue
```

**If starting from a task:**
```
1. Find the parent epic
2. Get all sibling tasks in the epic
3. Filter to: current task + all tasks after it (by order)
4. Create execution queue
```

### Step 2: Pre-flight Check

Before starting automated execution:

```
**Automated Execution Mode: --until-finish**

**Epic:** [epic-id] - [Epic Title]
**Tasks to execute:** [N]

| Order | Task | Phase | Command | Est. Time |
|-------|------|-------|---------|-----------|
| 1 | [task-001-1] | brief | /brief | ~30m |
| 2 | [task-001-2] | implementation | /implement | ~2h |
| 3 | [task-001-3] | implementation | /implement | ~1h |

**Total estimated time:** [X hours]

⚠️ **This will run without stopping until complete or error.**

Starting automated execution...
```

### Step 3: Execute Each Task Sequentially

For each task in the queue:

```python
for task in execution_queue:
    # 1. Check dependencies
    if not all_dependencies_complete(task):
        # Execute dependencies first (they should be earlier in queue)
        continue
    
    # 2. Update status to in-progress
    update_status(task, "in-progress")
    
    # 3. Execute the appropriate SDD command
    result = execute_sdd_command(task)
    
    # 4. Check result
    if result.success:
        # Mark as done (not review - we're automating)
        update_status(task, "done")
        log_execution(task, result)
        print(f"✅ [{current}/{total}] {task.id} completed")
    else:
        # STOP - report error
        print(f"❌ Error in {task.id}: {result.error}")
        print("Execution stopped. Fix the error and resume.")
        return  # Exit the loop
    
    # 5. Continue to next task
```

### Step 4: Handle Errors

When an error occurs:

1. **STOP immediately** - do not continue to next task
2. **Keep current task status as "in-progress"** - indicates where we stopped
3. **Report the error clearly** with context
4. **Provide fix instructions** and resume command
5. **Wait for user to fix** before continuing

**Error recovery:**
```
User fixes the issue → Runs `/execute-task [failed-task] --until-finish` → Continues from where it stopped
```

### Step 5: Completion

When all tasks complete successfully:

1. Update epic status to "done"
2. Generate summary report
3. Log total execution time
4. Suggest next epic or completion message

---

## Status Flow

```
todo → in-progress → review → done
  ↓        ↓           ↓
blocked  on-hold    archived
```

| Status | Meaning | Allowed Transitions |
|--------|---------|---------------------|
| todo | Ready, dependencies met | in-progress, blocked |
| in-progress | Currently executing | review, blocked, on-hold |
| review | Complete, needs review | done, in-progress |
| done | Approved and complete | archived |
| blocked | Waiting on dependency | todo (when unblocked) |
| on-hold | Paused temporarily | todo, in-progress |

---

## Dependency Management

### Checking Dependencies

```
For task [X] with dependencies [A, B, C]:
- A: done ✅
- B: done ✅
- C: in-progress ⏳ (BLOCKS)

Task [X] is BLOCKED until C is done.
```

### Auto-Unblocking

When a task completes, automatically:
1. Find all tasks that depend on it
2. Check if ALL their dependencies are now done
3. Update status from "blocked" to "todo"
4. Notify user of newly available tasks

---

## Troubleshooting

### Issue: Task has circular dependencies
**Cause**: Task A depends on B, B depends on A
**Solution**: Identify the cycle and ask user to break it:
- "Circular dependency detected: [A] ↔ [B]. Which should be done first?"

### Issue: Task already in progress
**Cause**: Re-executing an in-progress task
**Solution**: Ask what to do:
- "Task [X] is already in progress. Want to continue, restart, or mark complete?"

### Issue: SDD command failed
**Cause**: Error during command execution
**Solution**: Log the error and offer recovery:
- "The command encountered an error: [error]. Status reverted to 'todo'."

### Issue: Wrong task type
**Cause**: Epic being executed like a task
**Solution**: Handle epics differently:
- "This is an epic with [N] subtasks. Execute first subtask instead?"

---

## Related Commands

- `/sdd-full-plan [project-id] --until-finish` - Create roadmap AND execute all tasks
- `/brief [task-id]` - Quick feature brief
- `/research [task-id]` - Research phase
- `/implement [task-id]` - Implementation phase
- `/audit [task-id]` - Spec-driven audit
