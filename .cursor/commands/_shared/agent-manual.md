# SDD Agent Manual (v4.1)

Consolidated agent protocol for SDD workflows. **Requires Cursor 2.4+** for subagents and skills.

---

## Core Principles

1. **Plan-approve-execute** - Show plans before creating files
2. **Save outputs to `specs/`** - All specs go in the specs directory
3. **Verify file operations** - Confirm files were created
4. **Ask when uncertain** - Don't guess, clarify
5. **Delegate appropriately** - Use subagents for context isolation

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

.cursor/
├── agents/                     # Subagents for delegation
├── skills/                     # Domain knowledge packages
├── commands/                   # Slash commands
└── hooks/                      # Iteration hooks
```

---

## Subagents (Cursor 2.4+)

Subagents run in **isolated context** - use them for operations that would bloat the main conversation.

### Available Subagents

| Subagent | Purpose | Model | When to Use |
|----------|---------|-------|-------------|
| `sdd-explorer` | Codebase discovery | fast | Before research, pattern investigation |
| `sdd-planner` | Architecture design | inherit | Creating plans, task breakdowns |
| `sdd-implementer` | Code generation | inherit | Executing todos, long implementations |
| `sdd-verifier` | Validation | fast | After implementation, quality checks |
| `sdd-reviewer` | Code review | fast | Security/performance review |
| `sdd-orchestrator` | Coordination | inherit | Parallel execution, DAG traversal |

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
- Direct user communication expected

### Spawning Subagents

Use the Task tool to spawn subagents:

```markdown
[Use Task tool with:]
- subagent_type: "generalPurpose" or "explore"
- prompt: Detailed instructions with context
- model: "fast" for exploration, "inherit" for complex work
```

**Parallel execution:** Send multiple Task tool calls in a single message.

### Automatic Verification

After every implementation phase, spawn `sdd-verifier`:

```
sdd-implementer completes → spawn sdd-verifier → validate work
```

This catches incomplete implementations before marking tasks done.

---

## Skills (Cursor 2.4+)

Skills are auto-invoked based on context or manually via `/skill-name`.

### Available Skills

| Skill | Location | Auto-Invoke When |
|-------|----------|------------------|
| `sdd-research` | `.cursor/skills/sdd-research/` | Technical approach unclear |
| `sdd-planning` | `.cursor/skills/sdd-planning/` | Spec exists, need plan |
| `sdd-implementation` | `.cursor/skills/sdd-implementation/` | Plan ready for execution |
| `sdd-audit` | `.cursor/skills/sdd-audit/` | Code review requested |
| `sdd-evolve` | `.cursor/skills/sdd-evolve/` | Discoveries during dev |

### Skill Structure

Skills use progressive loading - keep main SKILL.md focused:

```
.cursor/skills/[skill-name]/
├── SKILL.md          # Core instructions (~50 lines)
├── references/       # Loaded on demand
├── scripts/          # Executable helpers
└── assets/           # Templates, diagrams
```

### Using Skills in Subagents

Subagents can invoke skills by including in their prompt:
```
"Use the sdd-implementation skill to execute the todo-list..."
```

---

## DAG-Based Execution

Tasks organized as Directed Acyclic Graph with dependencies:

- **EPIC 0**: Prerequisites that must complete before feature work
- **dependencies**: Array of task IDs that must complete first
- **canParallelize**: Whether task can run in parallel with siblings
- **parallelGroups**: Groups of tasks that can execute simultaneously

### Parallel Execution Pattern

1. Load `roadmap.json` and identify ready tasks
2. Spawn subagent for each ready task (parallel Task tool calls)
3. Collect results, update roadmap statuses
4. Verify implementations with `sdd-verifier`
5. Identify next ready tasks, repeat

```markdown
Batch 1 (parallel): task-001, task-003, task-005
├── sdd-implementer → task-001
├── sdd-implementer → task-003
└── sdd-explorer → task-005

[Wait for completion]

sdd-verifier → validate all implementations

Batch 2 (deps satisfied): task-002, task-004
...
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

**Golden Rules:** 
- Fix small issues yourself
- Ask when uncertain
- Never leave user stuck
- Always verify implementation completeness

---

## Command-to-Subagent Mapping

| Command | Primary Subagent | Skill Used |
|---------|------------------|------------|
| `/research` | sdd-explorer | sdd-research |
| `/specify` | sdd-planner | sdd-planning |
| `/plan` | sdd-planner | sdd-planning |
| `/tasks` | sdd-planner | - |
| `/implement` | sdd-implementer | sdd-implementation |
| `/audit` | sdd-reviewer | sdd-audit |
| `/evolve` | - | sdd-evolve |
| `/execute-task` | sdd-implementer | varies |
| `/execute-parallel` | sdd-orchestrator | varies |

---

## Hooks (Cursor 2.3+)

Simple iteration loops via `.cursor/hooks/`:
- Run tests until pass
- Iterate on UI until matches design
- Fix linter errors until clean

---

## Best Practices

### Context Management
- Use subagents for exploration to avoid context bloat
- Keep main conversation focused on decisions and user communication
- Let subagents handle verbose operations (test output, large codebases)

### Parallel Efficiency
- Identify independent tasks early
- Spawn multiple subagents in single message
- Use `model: fast` for exploration tasks
- Reserve `model: inherit` for complex reasoning

### Verification
- Always verify after implementation
- Don't trust "done" claims without checking
- Run tests when available
- Compare code to spec requirements

---

*SDD Agent Manual v4.1 - Cursor 2.4+ (Subagents + Skills)*
