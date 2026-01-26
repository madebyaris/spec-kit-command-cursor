# /execute-parallel Command

Execute multiple tasks in parallel using agent-orchestration MCP for coordination.

**Requires:** agent-orchestration MCP server running

---

## Usage

```
/execute-parallel [project-id]
/execute-parallel [project-id] --epic [epic-id]
```

**Examples:**
```
/execute-parallel blog-platform
/execute-parallel saas-dashboard --epic epic-002
```

---

## Instructions

### Phase 1: Initialize Orchestration

**Step 1: Bootstrap agent-orchestration**

```
bootstrap
```

This registers you as the main orchestrator agent.

**Step 2: Load the roadmap DAG**

Read `specs/todo-roadmap/[project-id]/roadmap.json` and extract:
- `dag.roots` - Starting tasks with no dependencies
- `dag.parallelGroups` - Tasks that can run simultaneously
- All tasks with their `dependencies` and `canParallelize` fields

**Step 3: Set shared context**

```
memory_set current_focus "[project-id]"
memory_set current_epic "[epic-id or all]"
```

### Phase 2: Create Tasks in Orchestration

For each task in the DAG:

```
task_create "[task-id]: [task-title]" --deps [dependency-ids]
```

This creates tasks in agent-orchestration's queue with proper dependencies.

### Phase 3: Execute Parallel Groups

**Step 1: Find ready tasks**

```
is_my_turn
```

Returns tasks with all dependencies satisfied.

**Step 2: For each parallelizable task group:**

Spawn sub-agents to claim and execute tasks:

```
# Sub-agent 1
claim_todo "[task-id-1]"
lock_acquire "[files-to-modify]"
# Execute the SDD command (e.g., /brief, /implement)
task_complete "[task-id-1]" "Completed: [summary]"
lock_release "[files]"

# Sub-agent 2 (parallel)
claim_todo "[task-id-2]"
lock_acquire "[files-to-modify]"
# Execute the SDD command
task_complete "[task-id-2]" "Completed: [summary]"
lock_release "[files]"
```

**Step 3: Monitor progress**

```
coordination_status
```

Shows:
- Active agents
- Tasks in progress
- Completed tasks
- Blocked tasks

**Step 4: Continue until DAG empty**

After each parallel group completes:
1. Check for newly unblocked tasks
2. Spawn sub-agents for next parallel group
3. Repeat until all tasks complete

### Phase 4: Completion

**Update roadmap.json:**
- Set all task statuses to "done"
- Update `dag.parallelGroups` to empty
- Update statistics

**Report:**

```
## Parallel Execution Complete

**Project:** [project-id]
**Tasks Executed:** [N]
**Parallel Groups:** [M]
**Total Duration:** [time]

### Execution Summary
| Group | Tasks | Duration |
|-------|-------|----------|
| 1 | task-001, task-003 | 5m |
| 2 | task-002, task-004 | 8m |

### Files Created
- [list of files]

### Next Steps
- Review changes
- Run tests
- Continue to next epic: `/execute-parallel [project] --epic epic-002`
```

---

## agent-orchestration MCP Tools Reference

| Tool | Purpose |
|------|---------|
| `bootstrap` | Initialize session, register agent |
| `task_create` | Create task with dependencies |
| `claim_todo` | Register + claim task for sub-agent |
| `task_complete` | Mark task done, unblock dependents |
| `lock_acquire` | Lock files before editing |
| `lock_release` | Release file locks |
| `memory_set` | Store shared context |
| `memory_get` | Retrieve shared context |
| `coordination_status` | Get overall progress |
| `is_my_turn` | Check for available work |

---

## Error Handling

**If a task fails:**

1. Task remains in "in-progress" status
2. Dependent tasks stay blocked
3. Report error with context
4. User fixes issue
5. Resume: `/execute-parallel [project] --resume`

**If agent-orchestration not available:**

Fall back to sequential execution:
```
agent-orchestration MCP not detected.
Falling back to sequential execution.
Use /execute-task [epic-id] --until-finish instead.
```

---

## Related Commands

- `/sdd-full-plan` - Create roadmap with DAG
- `/execute-task` - Execute single task or sequential epic
- `/audit` - Review completed work
