# /execute-parallel Command

Execute multiple tasks in parallel using native Cursor subagents for coordination.

**Leverages:** Native subagents (Cursor 2.4+), no external MCP required

---

## Usage

```
/execute-parallel [project-id]
/execute-parallel [project-id] --epic [epic-id]
/execute-parallel [project-id] --until-finish
```

**Examples:**
```
/execute-parallel blog-platform
/execute-parallel saas-dashboard --epic epic-002
/execute-parallel my-project --until-finish
```

---

## Instructions

### Phase 1: Load and Analyze Roadmap

**Step 1: Read roadmap DAG**

Read `specs/todo-roadmap/[project-id]/roadmap.json` and extract:
- `dag.roots` - Starting tasks with no dependencies
- `dag.parallelGroups` - Tasks that can run simultaneously
- All tasks with their `dependencies` and `status` fields

**Step 2: Identify ready tasks**

Tasks are ready when:
- Status is "todo"
- All dependencies have status "done"
- `canParallelize: true` for parallel execution

**Step 3: Plan execution batches**

Group tasks into parallel batches based on:
- Dependency satisfaction
- Resource requirements (file conflicts)
- Estimated effort

### Phase 2: Parallel Execution with Subagents

**For each parallel batch:**

Spawn multiple subagents simultaneously using the Task tool. Each subagent handles one task.

**Task-to-Subagent Mapping:**

| Task Phase | Subagent | Model |
|------------|----------|-------|
| research | sdd-explorer | fast |
| brief | sdd-planner | inherit |
| specify | sdd-planner | inherit |
| plan | sdd-planner | inherit |
| tasks | sdd-planner | inherit |
| implement | sdd-implementer | inherit |
| review | sdd-reviewer | fast |
| verify | sdd-verifier | fast |

**Execution Pattern:**

```markdown
## Batch 1 (Parallel)

Spawning subagents for: task-001, task-003, task-005

[Task tool calls - all in single message for parallel execution]

Task: sdd-implementer for task-001
Task: sdd-implementer for task-003  
Task: sdd-explorer for task-005
```

**Each subagent receives:**
- Task details from roadmap
- Relevant spec/plan file paths
- Expected deliverables
- Status update instructions

### Phase 3: Progress Tracking

**After each batch completes:**

1. **Collect results** from subagent responses
2. **Update roadmap.json** statuses:
   - `todo` → `in-progress` (when starting)
   - `in-progress` → `review` (when implementation done)
   - `review` → `done` (when verified)
3. **Verify with sdd-verifier** for implementation tasks
4. **Identify next ready tasks** based on completed dependencies

**Progress Report Format:**

```markdown
## Batch 1 Complete

| Task | Status | Duration | Notes |
|------|--------|----------|-------|
| task-001 | done | 2m | Files: src/auth.ts |
| task-003 | done | 3m | Files: src/api.ts |
| task-005 | done | 1m | Research complete |

## Next Batch Ready
- task-002 (deps satisfied: task-001)
- task-004 (deps satisfied: task-003)
```

### Phase 4: Automatic Verification

**After implementation tasks:**

Always spawn `sdd-verifier` subagent to confirm:
- Implementation exists and is functional
- Tests pass
- Spec requirements met
- No incomplete work marked as done

```markdown
Verification for task-001:
[Task tool: sdd-verifier with implementation context]
```

### Phase 5: Completion

**When all tasks done:**

1. **Final roadmap.json update:**
   - All task statuses: "done"
   - `dag.parallelGroups`: empty
   - Update statistics

2. **Generate completion report:**

```markdown
## Parallel Execution Complete

**Project:** [project-id]
**Tasks Executed:** [N]
**Parallel Batches:** [M]
**Total Duration:** [time]

### Execution Timeline
| Batch | Tasks | Duration | Parallelism |
|-------|-------|----------|-------------|
| 1 | task-001, task-003, task-005 | 3m | 3x |
| 2 | task-002, task-004 | 4m | 2x |
| 3 | task-006 | 2m | 1x |

### Files Created/Modified
- `src/auth.ts`: User authentication
- `src/api.ts`: API endpoints
- [...]

### Verification Summary
- All implementations verified: YES
- Tests passing: YES
- Spec compliance: 100%

### Next Steps
- Review changes in IDE
- Run full test suite
- Deploy to staging
```

---

## Subagent Orchestration

### Spawning Parallel Subagents

Use multiple Task tool calls in a single message:

```
Task 1: {
  subagent_type: "generalPurpose",
  prompt: "Execute task-001: [details]. Use sdd-implementation skill...",
  model: "inherit"
}

Task 2: {
  subagent_type: "generalPurpose", 
  prompt: "Execute task-003: [details]. Use sdd-implementation skill...",
  model: "inherit"
}
```

### Handling Blockers

If a subagent reports a blocker:

1. Mark task as `blocked` in roadmap
2. Continue with non-dependent tasks
3. Report blocker for user resolution
4. Resume with `--resume` flag

### File Conflict Prevention

When multiple tasks modify same files:
1. Execute those tasks sequentially within their batch
2. Or restructure into separate batches
3. Verify no conflicts before parallel execution

---

## Flags

| Flag | Description |
|------|-------------|
| `--epic [id]` | Execute only tasks in specified epic |
| `--until-finish` | Continue until all tasks complete or blocked |
| `--resume` | Resume from last incomplete batch |
| `--verify` | Run verification after each implementation |
| `--dry-run` | Show execution plan without running |

---

## Error Handling

**If subagent fails:**
1. Task marked as `blocked` in roadmap
2. Error details captured
3. Dependent tasks remain blocked
4. Continue with independent tasks
5. Report failures at end

**Recovery:**
```
/execute-parallel [project] --resume
```

---

## Related

- `/sdd-full-plan` - Create roadmap with DAG
- `/execute-task` - Execute single task sequentially
- `sdd-orchestrator` subagent - Detailed orchestration logic
- `sdd-verifier` subagent - Implementation validation
