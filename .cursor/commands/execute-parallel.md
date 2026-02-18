# /execute-parallel Command

Execute multiple tasks in parallel using async background subagents for coordination.

**Leverages:** Async subagents (Cursor 2.5+), subagent tree pattern, hooks for completion tracking.

**See also:** `.cursor/commands/_shared/agent-manual.md` for full subagent protocol.

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
- `dag.roots` — starting tasks with no dependencies
- `dag.parallelGroups` — tasks that can run simultaneously
- All tasks with their `dependencies` and `status` fields

**Step 2: Identify ready tasks**

Tasks are ready when:
- Status is "todo"
- All dependencies have status "done"
- `canParallelize: true` for parallel execution

**Step 3: Plan execution batches**

Group tasks into parallel batches based on dependency satisfaction, resource requirements (file conflicts), and estimated effort.

### Phase 2: Parallel Execution with Async Subagents

**For each parallel batch, spawn background subagents simultaneously using multiple Task tool calls in a single message.**

**Task-to-Subagent Mapping:**

| Task Phase | Subagent | Model | Mode |
|------------|----------|-------|------|
| research | sdd-explorer | fast | foreground |
| brief/specify/plan/tasks | sdd-planner | inherit | foreground |
| implement | sdd-implementer | inherit | **background** |
| review | sdd-reviewer | fast | foreground |
| verify | sdd-verifier | fast | foreground |

**Subagent Tree Pattern (2.5+):**

Each background `sdd-implementer` automatically spawns `sdd-verifier` as a child subagent after completing its work. This means verification happens inside the subagent tree without blocking the orchestrator.

```
sdd-orchestrator (background)
├── sdd-implementer (task 1) → spawns sdd-verifier
├── sdd-implementer (task 2) → spawns sdd-verifier
└── sdd-explorer (task 3)
```

**Spawning subagents:**

```
Task 1: {
  subagent_type: "sdd-implementer",
  prompt: "Execute task-001: [details from roadmap]. Read specs at [path]...",
  model: "inherit"
}

Task 2: {
  subagent_type: "sdd-implementer",
  prompt: "Execute task-003: [details from roadmap]. Read specs at [path]...",
  model: "inherit"
}
```

**Each subagent receives:** task details from roadmap, relevant spec/plan file paths, expected deliverables, status update instructions.

### Phase 3: Progress Tracking

**After each batch completes:**

1. **Collect results** from subagent responses
2. **Update roadmap.json** statuses: `todo` → `in-progress` → `review` → `done`
3. **Identify next ready tasks** based on completed dependencies
4. The `subagentStop` hook in `.cursor/hooks.json` auto-logs completion

**Progress Report Format:**

```markdown
## Batch 1 Complete

| Task | Status | Notes |
|------|--------|-------|
| task-001 | done | Files: src/auth.ts |
| task-003 | done | Files: src/api.ts |

## Next Batch Ready
- task-002 (deps satisfied: task-001)
- task-004 (deps satisfied: task-003)
```

### Phase 4: Completion

**When all tasks done:**

1. **Final roadmap.json update** — all statuses "done", update statistics
2. **Generate completion report:**

```markdown
## Parallel Execution Complete

**Project:** [project-id]
**Tasks Executed:** [N]
**Parallel Batches:** [M]

### Execution Timeline
| Batch | Tasks | Parallelism |
|-------|-------|-------------|
| 1 | task-001, task-003, task-005 | 3x |
| 2 | task-002, task-004 | 2x |

### Verification Summary
- All implementations verified via subagent tree: YES
- Spec compliance: 100%

### Next Steps
- Review changes in IDE
- Run full test suite
- Deploy to staging
```

---

## Flags

| Flag | Description | Behavior |
|------|-------------|----------|
| `--epic [id]` | Scope to one epic | Only execute tasks within the specified epic |
| `--until-finish` | Loop until done | Repeat batch cycle until all tasks complete or all remaining are blocked |
| `--resume` | Resume after error | Skip completed tasks, restart from last incomplete batch |
| `--dry-run` | Preview only | Show execution plan and batch groupings without running |

### `--until-finish` Behavior

Without `--until-finish`: executes one batch of ready tasks and reports.
With `--until-finish`: continuously identifies ready tasks, spawns batches, collects results, and repeats until the entire roadmap is complete or all remaining tasks are blocked.

This is the **parallel** equivalent of `/execute-task --until-finish` (which runs sequentially).

---

## Error Handling

**If subagent fails:**
1. Task marked as `blocked` in roadmap
2. Error details captured
3. Dependent tasks remain blocked
4. Continue with independent tasks in same batch
5. Report all failures at end of batch

**File Conflict Prevention:** When multiple tasks modify same files, execute those tasks sequentially within their batch or restructure into separate batches.

**Recovery:**
```
/execute-parallel [project] --resume
```
Skips all `done` tasks and restarts from the last incomplete batch.

---

## Related

- `/sdd-full-plan` — Create roadmap with DAG
- `/execute-task` — Execute single task sequentially
- `sdd-orchestrator` subagent — Detailed orchestration logic
- `.cursor/hooks.json` — Auto-tracks subagent completion
- `.cursor/commands/_shared/agent-manual.md` — Full agent protocol
