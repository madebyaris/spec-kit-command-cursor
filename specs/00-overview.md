# Project Overview: SDD Cursor Commands

## Description

A Spec-Driven Development toolkit for Cursor IDE (v2.5+) that provides structured commands, subagents, and skills for feature specification, planning, and parallel execution.

## Core Philosophy

Create specifications **before** code. Plan-approve-execute for all operations.

## Architecture

```
User Request → Main Agent → Subagents (parallel/async) → Skills (auto-invoked)
                    ↓                    ↓
              Verification ←── Subagent Tree (nested spawning)
```

### Components

| Component | Location | Purpose |
|-----------|----------|---------|
| Rules | `.cursor/rules/` | Always-applied system configuration |
| Subagents | `.cursor/agents/` | 6 specialized agents (foreground + background) |
| Skills | `.cursor/skills/` | 5 auto-invoked domain knowledge packages |
| Commands | `.cursor/commands/` | 16 slash commands + shared manual |
| Hooks | `.cursor/hooks.json` | Workflow automation |
| Sandbox | `.cursor/sandbox.json` | Network access controls |

## Workflows

| Flow | Commands | Use When |
|------|----------|----------|
| **Quick Planning** | `/brief` → `/evolve` → `/refine` | 80% of features |
| **Full Planning** | `/research` → `/specify` → `/plan` → `/tasks` → `/implement` | Complex features |
| **Parallel Execution** | `/sdd-full-plan` → `/execute-parallel` | Project roadmaps |

## Spec Directory Structure

```
specs/
├── 00-overview.md              # This file
├── index.md                    # Navigation and status
├── active/[task-id]/           # Features in development
│   ├── feature-brief.md        # Quick Planning output
│   ├── research.md             # /research output
│   ├── spec.md                 # /specify output
│   ├── plan.md                 # /plan output
│   ├── tasks.md                # /tasks output
│   ├── todo-list.md            # /implement creates this
│   └── progress.md             # Development tracking
├── todo-roadmap/[project-id]/  # /sdd-full-plan output
│   ├── roadmap.json            # DAG-based task graph
│   ├── roadmap.md              # Human-readable view
│   └── tasks/                  # Individual task files
├── completed/                  # Delivered features (moved from active/)
└── backlog/                    # Future features
```

## Links

- [Feature Index](index.md)
- [Agent Manual](../.cursor/commands/_shared/agent-manual.md)
- [System Rule](../.cursor/rules/sdd-system.mdc)

---
**Version:** SDD 5.0 | **Requires:** Cursor 2.5+
