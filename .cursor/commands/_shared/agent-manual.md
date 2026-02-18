# SDD Agent Manual (v5.0)

Consolidated agent protocol for SDD workflows. **Requires Cursor 2.5+** for async subagents, hooks, and plugins.

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
├── skills/                     # Domain knowledge packages
├── commands/                   # Slash commands
├── hooks.json                  # Workflow automation hooks
├── sandbox.json                # Network access controls
└── rules/                      # Always-applied rules
```

---

## Subagents (Cursor 2.5+)

Subagents run in **isolated context**. Use them for operations that would bloat the main conversation.

### Available Subagents

| Subagent | Purpose | Model | Mode |
|----------|---------|-------|------|
| `sdd-explorer` | Codebase discovery | fast | foreground, readonly |
| `sdd-planner` | Architecture design | inherit | foreground |
| `sdd-implementer` | Code generation | inherit | **background** |
| `sdd-verifier` | Validation | fast | foreground |
| `sdd-reviewer` | Code review | fast | foreground, readonly |
| `sdd-orchestrator` | Coordination | inherit | **background** |

### Foreground vs Background

- **Foreground**: Blocks parent until complete. Use when results are needed immediately (exploration, planning, verification).
- **Background** (`is_background: true`): Returns immediately, parent continues working. Use for long-running implementations and orchestration.

### Subagent Tree (2.5+)

Subagents can spawn their own subagents, creating a tree of coordinated work:

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
- model: "fast" for exploration, omit for inherit
```

**Parallel execution:** Send multiple Task tool calls in a single message.

**Background subagents:** Set `is_background: true` in the agent file. The parent continues working while the subagent runs.

### Automatic Verification

After every implementation phase, the implementer spawns `sdd-verifier` as a child subagent:

```
sdd-implementer completes → spawns sdd-verifier → validates work → reports back
```

---

## Skills (Cursor 2.5+)

Skills are auto-invoked based on context or manually via `/skill-name`.

### Available Skills

| Skill | Auto-Invoke When |
|-------|------------------|
| `sdd-research` | Technical approach unclear |
| `sdd-planning` | Spec exists, need plan |
| `sdd-implementation` | Plan ready for execution |
| `sdd-audit` | Code review requested |
| `sdd-evolve` | Discoveries during dev |

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

## Hooks (Cursor 2.5+)

SDD uses hooks (`.cursor/hooks.json`) for workflow automation:

| Hook | Trigger | Purpose |
|------|---------|---------|
| `subagentStop` | Subagent completes | Track completion in roadmap |
| `stop` | Agent session ends | Generate completion summary |

Hooks can block actions (exit code 2), log events, or trigger follow-up automation. See [Cursor hooks docs](https://cursor.com/docs/agent/hooks).

### Claude Code Compatibility

Hooks are compatible with Claude Code format (`.claude/settings.json`). Hook names are automatically mapped between tools.

---

## Sandbox (Cursor 2.5+)

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

1. Load `roadmap.json` and identify ready tasks
2. Spawn background subagent for each ready task (parallel Task tool calls)
3. Collect results, update roadmap statuses
4. Each implementer spawns `sdd-verifier` as child subagent
5. Identify next ready tasks, repeat

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

**Golden Rules:** Fix small issues yourself. Ask when uncertain. Never leave user stuck. Always verify implementation completeness.

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
- Use `model: fast` for exploration tasks
- Use background mode for long-running work

### Verification
- Always verify after implementation
- Don't trust "done" claims without checking
- Run tests when available
- Compare code to spec requirements

### Hooks Integration
- `subagentStop` hook tracks completion automatically
- Use hooks for consistent file output processing
- Claude Code hooks are compatible via `.claude/settings.json`

---

*SDD Agent Manual v5.0 — Cursor 2.5+ (Async Subagents + Hooks + Plugins)*
