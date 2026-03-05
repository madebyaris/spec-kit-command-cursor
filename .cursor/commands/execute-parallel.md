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
/execute-parallel [project-id] --resume
```

**Examples:**
```
/execute-parallel blog-platform
/execute-parallel saas-dashboard --epic epic-002
/execute-parallel my-project --until-finish
/execute-parallel my-project --resume
```

---

## Instructions

### Phase 1: Load and Analyze Roadmap

**Step 0: Resume mode (if `--resume` flag)**

When `--resume` is provided:
1. Read `specs/todo-roadmap/[project-id]/execution-checkpoint.json` if it exists
2. Use `nextReadyTasks` as the starting point; skip tasks already `done` in roadmap.json
3. If no checkpoint, fall back to normal flow (load from roadmap)

**Step 1: Read roadmap (progressive loading for large roadmaps)**

For heavy roadmaps (20+ tasks), load only what's needed:
- **Orchestrator:** Read `dag.roots`, `dag.parallelGroups`, `statistics`, and for the current batch only: `tasks.[task-id]` for ready tasks (including `sdd.touchedFiles`). Do NOT load full `tasks` object for all 40+ tasks.
- **Implementer prompts:** Pass only `task-id`, `task title`, `linkedSpec path`, `executeCommand`. The implementer reads `specs/todo-roadmap/[project-id]/tasks/[task-id].json` and spec files on demand. This keeps orchestrator context lean.

**Step 2: Identify ready tasks**

Tasks are ready when:
- Status is "todo"
- All dependencies have status "done"
- `canParallelize: true` for parallel execution

**Step 3: Plan execution batches**

Group tasks into parallel batches based on:
- Dependency satisfaction (all deps done)
- **File conflict detection:** For implementation tasks, check `sdd.touchedFiles` on each task. If two ready tasks have overlapping `touchedFiles` (e.g. both include `package.json` or `src/auth/**`), they must run in **separate batches** (sequential). Tasks with disjoint file sets can run in parallel.
- Estimated effort (prefer similar-sized tasks in same batch)

**Conflict detection rule:** Two tasks conflict if their `touchedFiles` arrays share any path or if one path is a prefix of another (e.g. `src/auth` and `src/auth/login.ts`). When in doubt, run sequentially.

**Step 4: Parallelism limits**

- **Max parallel implementers:** 3–5 (default: 4). Read from `.sdd/config.json` `settings.maxParallelImplementers` if present.
- When more tasks are ready than the limit, run in waves: batch 1 (first N tasks) → wait for completion → batch 2 (next N tasks) → repeat.
- Do not spawn more than `maxParallelImplementers` in a single batch.

### Phase 2: Parallel Execution with Async Subagents

**For each parallel batch, spawn background subagents simultaneously using multiple Task tool calls in a single message.** Limit batch size to `maxParallelImplementers` (default 4).

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

**Spawning subagents (prompt economy):**

Pass minimal context — implementer loads full details on demand:

```
Task 1: {
  subagent_type: "sdd-implementer",
  prompt: "Execute task-001: [title]. Read task details from specs/todo-roadmap/[project-id]/tasks/task-001.json and linked spec at [linkedSpec path]. Run [executeCommand].",
  model: "inherit"
}
```

**Each subagent receives:** `task-id`, `task title`, `linkedSpec path`, `executeCommand`. Implementer fetches full task JSON and spec files itself. Do NOT inline full roadmap or task objects into the prompt.

### Phase 3: Progress Tracking

**After each batch completes:**

1. **Collect results** from subagent responses
2. **Update roadmap.json** statuses: `todo` → `in-progress` → `review` → `done`
3. **Write execution-checkpoint.json** in `specs/todo-roadmap/[project-id]/`:
   - `lastCompletedBatch`: task IDs that completed
   - `failedTaskId`: task that failed (if any), else null
   - `nextReadyTasks`: task IDs ready for next batch
   - `timestamp`: ISO8601
   - `batchNumber`: incrementing batch index
4. **Identify next ready tasks** based on completed dependencies
5. The `subagentStop` hook in `.cursor/hooks.json` auto-logs completion

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
| `--resume` | Resume after error | Read `execution-checkpoint.json`, skip `done` tasks, restart from `nextReadyTasks` or last incomplete batch |
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

**File Conflict Prevention:** Use `sdd.touchedFiles` when present. Tasks with overlapping `touchedFiles` must run in separate batches (sequential). When `touchedFiles` is missing, infer from task description or run sequentially if uncertain. Never run two implementation tasks in parallel that may edit the same files.

**Recovery:**
```
/execute-parallel [project] --resume
```
1. Read `specs/todo-roadmap/[project-id]/execution-checkpoint.json` if present
2. Skip all tasks with status `done`
3. Use `nextReadyTasks` from checkpoint, or recompute from roadmap
4. Continue execution from the next batch

Checkpoint is written after each batch during `--until-finish` runs.

---

## Related

- `/sdd-full-plan` — Create roadmap with DAG
- `/execute-task` — Execute single task sequentially
- `sdd-orchestrator` subagent — Detailed orchestration logic
- `.cursor/hooks.json` — Auto-tracks subagent completion
- `.cursor/commands/_shared/agent-manual.md` — Full agent protocol
