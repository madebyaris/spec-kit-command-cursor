# SDD Agent Manual (v4.0)

Consolidated agent protocol for SDD workflows. **Requires Cursor 2.3+** (2.4+ recommended for Agent Skills).

---

## Core Principles

1. **Plan-approve-execute** - Show plans before creating files
2. **Save outputs to `specs/`** - All specs go in the specs directory
3. **Verify file operations** - Confirm files were created
4. **Ask when uncertain** - Don't guess, clarify

---

## File System Structure

```
specs/
├── 00-overview.md              # Project-wide specifications
├── index.md                    # Navigation and status
├── active/                     # Features in development
│   └── [task-id]/
│       ├── feature-brief.md    # Lightweight brief (SDD 2.5)
│       ├── research.md         # Research findings (SDD 2.0)
│       ├── spec.md             # Requirements (SDD 2.0)
│       ├── plan.md             # Technical plan (SDD 2.0)
│       ├── tasks.md            # Task breakdown (SDD 2.0)
│       ├── todo-list.md        # Implementation checklist
│       └── progress.md         # Development tracking
├── todo-roadmap/               # Project roadmaps
│   └── [project-id]/
│       ├── roadmap.json        # Kanban board data
│       ├── roadmap.md          # Human-readable view
│       └── tasks/              # Individual task files
├── completed/                  # Delivered features
└── backlog/                    # Future features
```

---

## Problem Handling

| Problem Type | Action |
|--------------|--------|
| Folder missing | Create it automatically |
| Task not found | Show available options |
| Permission denied | Explain simply, suggest fix |

**Golden Rules:** Fix small issues yourself. Ask when uncertain. Never leave user stuck.

---

## Agent Skills (Cursor 2.4+)

Skills provide **context isolation** - they work internally and return only summaries.

| Skill | Purpose |
|-------|---------|
| `sdd-research` | Pattern investigation, returns summary |
| `sdd-planning` | Creates specs and plans |
| `sdd-implementation` | Executes todo-lists systematically |
| `sdd-audit` | Reviews code against specs |

**Skills Location:** `.cursor/skills/*.md`

---

## DAG-Based Execution

Tasks organized as Directed Acyclic Graph with dependencies:

- **EPIC 0**: Prerequisites that must complete before feature work
- **dependencies**: Array of task IDs that must complete first
- **canParallelize**: Whether task can run in parallel with siblings
- **parallelGroups**: Groups of tasks that can execute simultaneously

---

## Parallel Execution (agent-orchestration)

Use `/execute-parallel` with agent-orchestration MCP for multi-agent coordination:

| Tool | Purpose |
|------|---------|
| `bootstrap` | Initialize orchestration session |
| `task_create` | Create task with dependencies |
| `claim_todo` | Sub-agent claims task |
| `task_complete` | Mark done, unblock dependents |
| `lock_acquire/release` | Prevent file conflicts |

---

## Hooks (Cursor 2.3+)

Simple iteration loops via `.cursor/hooks/`:
- Run tests until pass
- Iterate on UI until matches design
- Fix linter errors until clean

---

*SDD Agent Manual v4.0 - Cursor 2.3+ (2.4+ for Skills)*
