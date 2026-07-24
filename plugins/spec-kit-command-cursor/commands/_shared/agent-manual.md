# SDD Agent Manual (v6.0)

Consolidated agent protocol for SDD workflows. **Requires Cursor 3.8+** for async subagents, nested subagent trees, skills, plugins, cloud subagents (`/in-cloud`, `/babysit`), native review (`/review`), Memories, agent multitasking, worktrees, and multi-root sessions.

---

## Core Principles

1. **Plan-approve-execute** — show plans before creating files
2. **Save outputs to `specs/`** — all specs go in the specs directory
3. **Verify file operations** — confirm files were created
4. **Ask when uncertain** — don't guess, clarify
5. **Delegate appropriately** — use subagents for context isolation

---

## File System Structure

```
specs/
├── 00-overview.md              # Project-wide specifications
├── index.md                    # Navigation and status
├── active/                     # Features in development
│   └── [task-id]/
│       ├── feature-brief.md    # Lightweight brief (Quick Planning)
│       ├── research.md         # Research findings (Full Planning)
│       ├── spec.md             # Requirements (Full Planning)
│       ├── plan.md             # Technical plan (Full Planning)
│       ├── tasks.md            # Task breakdown (Full Planning)
│       ├── todo-list.md        # Implementation checklist
│       └── progress.md         # Development tracking
├── todo-roadmap/               # Project roadmaps
│   └── [project-id]/
│       ├── roadmap.json        # Kanban board data with DAG
│       ├── roadmap.md          # Human-readable view
│       └── tasks/              # Individual task files
├── completed/                  # Delivered features
└── backlog/                    # Future features

.cursor/
├── agents/                     # Subagents (foreground + background)
├── skills/                     # Domain knowledge packages (incl. sdd-memory)
├── commands/                   # Slash commands
├── environment.json            # Cloud agent environment setup (3.7+)
├── worktrees.json              # Cursor worktree setup
├── sandbox.json                # Network access controls
└── rules/                      # Always-applied rules
```

---

## Subagents (Cursor 3.8+)

Subagents run in **isolated context**. Use them for operations that would bloat the main conversation.

### Available Subagents

| Subagent | Purpose | Model | Mode |
|----------|---------|-------|------|
| `sdd-explorer` | Codebase discovery | inherit | foreground, readonly |
| `sdd-planner` | Architecture design | inherit | foreground |
| `sdd-implementer` | Code generation | inherit | **background** |
| `sdd-verifier` | Validation | inherit | foreground |
| `sdd-reviewer` | Pre-merge code review | inherit | foreground, readonly |
| `sdd-orchestrator` | Coordination | inherit | **background** |

### Foreground vs Background

- **Foreground**: Blocks parent until complete. Use when results are needed immediately (exploration, planning, verification).
- **Background** (`is_background: true`): Returns immediately, parent continues working. Use for long-running implementations and orchestration.

### Subagent Tree

Subagents can spawn their own subagents to any depth, creating a tree of coordinated work:

```
sdd-orchestrator (background)
├── sdd-implementer (task 1) → spawns sdd-verifier
├── sdd-implementer (task 2) → spawns sdd-verifier
└── sdd-implementer (task 3) → spawns sdd-verifier
```

This enables true parallel DAG execution where each implementer independently verifies its own work.

### Delegation Guidelines

**Delegate to subagent when:**
- Deep codebase exploration needed (use `sdd-explorer`)
- Long implementation that would consume context (use `sdd-implementer`)
- Independent tasks can run in parallel (use multiple subagents)
- Verification of completed work (use `sdd-verifier`)
- Code review before completion (use `sdd-reviewer`)

**Keep in main context when:**
- Simple, quick operations (few tool calls)
- User interaction needed mid-task
- Sequential dependent steps requiring shared context

### Spawning Subagents

Use the Task tool to spawn subagents:

```markdown
[Use Task tool with:]
- subagent_type: "sdd-implementer" (or other agent name)
- prompt: Detailed instructions with all necessary context
- model: omit for inherit, or use an exact Cursor-supported model ID when a specific model is required
```

**Parallel execution:** Send multiple Task tool calls in a single message.

**Background subagents:** Set `is_background: true` in the agent file. The parent continues working while the subagent runs.

### Cursor 3.8 Multitask, Worktrees, and Cloud

Use Cursor's native `/multitask` for ad hoc independent requests, especially when there is no SDD roadmap to update. Use SDD `/execute-parallel` when work must respect roadmap dependencies, file-conflict batching, checkpoints, or mandatory verifier handoffs.

Use Agents Window worktrees for parallel or risky implementation attempts. `.cursor/worktrees.json` prepares the isolated checkout; keep setup commands lightweight and avoid assuming one package manager unless the target project declares one.

**Cloud subagents (3.7+):** Offload long-running, risky, or environment-heavy tasks with `/in-cloud` — each runs on its own VM and branch so the local workspace stays responsive. Use `/babysit` to have a cloud agent prepare a PR for merge (resolve comments, conflicts, CI). Commit `.cursor/environment.json` so cloud agents start faster.

For multi-root workspaces, always resolve generated files, specs, and roadmap updates from the active project root. Do not write cross-repo state unless the command explicitly targets that root.

### Automatic Verification

After every implementation phase, the implementer spawns `sdd-verifier` as a child subagent:

```
sdd-implementer completes → spawns sdd-verifier → validates work → reports back
```

### Reviewer vs Verifier

These two agents serve distinct purposes — do not confuse them:

| Aspect | `sdd-reviewer` | `sdd-verifier` |
|--------|---------------|----------------|
| **When** | Before merging / on demand via `/audit` | Automatically after every implementation |
| **Perspective** | Code review — quality, security, performance | Completeness — does the code match the spec? |
| **Scope** | Broad: style, patterns, security, perf | Focused: spec requirements, file existence, tests pass |
| **Spawned by** | Main agent or user request | `sdd-implementer` (child subagent) |
| **Mode** | Readonly | Foreground (can report but not edit) |

**Rule of thumb:** Verifier answers "is it done?", Reviewer answers "is it good?"

---

## Skills (Cursor 3.8+)

Skills are auto-invoked based on context or manually via `/skill-name`.

### Available Skills

| Skill | Auto-Invoke When |
|-------|------------------|
| `sdd-research` | Technical approach unclear |
| `sdd-planning` | Spec exists, need plan |
| `sdd-implementation` | Plan ready for execution |
| `sdd-audit` | Code review requested |
| `sdd-evolve` | Discoveries during dev |
| `sdd-memory` | Start/finish of planning or implementation (recall + persist) |

### Skill Structure

Skills use progressive loading — keep main `SKILL.md` focused:

```
.cursor/skills/[skill-name]/
├── SKILL.md          # Core instructions (~50 lines)
├── references/       # Loaded on demand
├── scripts/          # Executable helpers
└── assets/           # Templates, diagrams
```

---

## Memory (Cursor 3.8+)

SDD long-term memory is **optional and pluggable**, configured in `.sdd/config.json` → `memory` and managed with `/sdd-memory`:

| Provider | Setup | Notes |
|----------|-------|-------|
| `standard` *(default)* | none | Rules-only; relies on `.cursor/rules/` + `specs/`. No persistent store. |
| `cursor-native` | toggle on | Cursor 3.8 Memories — all plans (Free/Pro/Team), individual level. Needs Privacy Mode off + "Generate Memories" enabled. |
| `mem0` | mem0 MCP / local API | Free self-host semantic memory across sessions. |

The `sdd-memory` skill **recalls** relevant decisions/conventions/gotchas before planning or implementing, and **persists** durable discoveries afterward. When `standard`, it is a no-op. **Never store secrets in memory.**

---

## Native Review (Cursor 3.8+)

Prefer Cursor's first-party reviewers for mechanical checks, then let SDD agents own spec compliance:

- `/review` lets you pick Bugbot + Security Review; `/review-bugbot` and `/review-security` run them directly. Bugbot (Composer 2.5) reviews in ~90s and syncs with GitHub/GitLab so the same diff isn't re-reviewed on PR.
- `sdd-reviewer` and `/audit` fold native findings into one consolidated report and add the spec-compliance verdict native reviewers don't provide.

---

## Sandbox (Cursor 3.8+)

Network access controls for sandboxed commands are configured in `.cursor/sandbox.json`:

- **Per-repo**: `.cursor/sandbox.json` (higher priority)
- **Per-user**: `~/.cursor/sandbox.json` (lower priority)

Controls: allowed/denied domains, filesystem paths, build cache sharing.

---

## DAG-Based Execution

Tasks organized as Directed Acyclic Graph with dependencies:

- **EPIC 0**: Prerequisites that must complete before feature work
- **dependencies**: Array of task IDs that must complete first
- **canParallelize**: Whether task can run in parallel with siblings
- **parallelGroups**: Groups of tasks that can execute simultaneously

### Parallel Execution Pattern

1. Load `roadmap.json` (for heavy roadmaps: only `dag`, `statistics`, and current batch tasks — not full `tasks` object)
2. Spawn background subagent for each ready task (parallel Task tool calls). Pass minimal context: `task-id`, `title`, `linkedSpec path`, `executeCommand` — implementer loads full details on demand
3. Collect results, update roadmap statuses
4. Each implementer spawns `sdd-verifier` as child subagent
5. Identify next ready tasks, repeat

### Context Management for Heavy Roadmaps

- **Orchestrator:** Load only `dag.roots`, `dag.parallelGroups`, and `tasks.[id]` for the current batch. Avoid loading 40+ task objects.
- **Implementer prompts:** Pass task ID and paths; implementer reads `specs/todo-roadmap/[project-id]/tasks/[task-id].json` and spec files itself.

```markdown
Batch 1 (parallel, background):
├── sdd-implementer → task-001 → sdd-verifier
├── sdd-implementer → task-003 → sdd-verifier
└── sdd-explorer → task-005

[Collect results]

Batch 2 (deps satisfied):
├── sdd-implementer → task-002 → sdd-verifier
└── sdd-implementer → task-004 → sdd-verifier
```

---

## Problem Handling

| Problem Type | Action |
|--------------|--------|
| Folder missing | Create it automatically |
| Task not found | Show available options |
| Permission denied | Explain simply, suggest fix |
| Subagent blocked | Report blocker, continue others |
| Verification failed | Report gaps, don't mark done |
| Implementation breaks build | Revert with `git checkout -- [files]`, document blocker, re-attempt with fix |
| Verification fails critically | Revert task changes, update task status to `blocked`, report to orchestrator |
| Context window exhaustion | Save progress to spec files, summarize state, hand off to new session |
| Concurrent file conflict | Only orchestrator writes to `roadmap.json`; implementers report results back |

**Golden Rules:** Fix small issues yourself. Ask when uncertain. Never leave user stuck. Always verify implementation completeness. When in doubt, revert and retry rather than building on broken state.

---

## Command-to-Subagent Mapping

| Command | Primary Subagent | Skill Used |
|---------|------------------|------------|
| `/research` | sdd-explorer | sdd-research |
| `/specify` | sdd-planner | sdd-planning |
| `/plan` | sdd-planner | sdd-planning |
| `/tasks` | sdd-planner | — |
| `/implement` | sdd-implementer | sdd-implementation |
| `/audit` | sdd-reviewer | sdd-audit |
| `/evolve` | — | sdd-evolve |
| `/execute-task` | sdd-implementer | varies |
| `/execute-parallel` | sdd-orchestrator | varies |

---

## Best Practices

### Context Management
- Use subagents for exploration to avoid context bloat
- Keep main conversation focused on decisions and user communication
- Let background subagents handle verbose operations

### Parallel Efficiency
- Identify independent tasks early
- Spawn multiple subagents in single message
- Prefer inherited models for custom agents unless an exact Cursor-supported model ID is required
- Use background mode for long-running work

### Verification
- Always verify after implementation
- Don't trust "done" claims without checking
- Run tests when available
- Compare code to spec requirements

### Memory Integration
- Recall at the start of planning/implementation; persist durable discoveries at the end (via `sdd-memory` skill)
- Provider is set in `.sdd/config.json`; `standard` keeps the toolkit dependency-free
- Never persist secrets, tokens, or full file dumps

---

*SDD Agent Manual v6.0 — Cursor 3.8 optimized (Async + Nested Subagents + Cloud + Native Review + Memory + Worktrees + Multi-root)*
