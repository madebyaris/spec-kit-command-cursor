# SDD Features Index

## Navigation

- [Project Overview](00-overview.md)
- [Agent Manual](../.cursor/commands/_shared/agent-manual.md)

## Feature Status Dashboard

### Active Features (In Development)

| Task ID | Feature | Status | Created |
|---------|---------|--------|---------|
| *none* | — | — | — |

### Completed Features

| Task ID | Feature | Completed |
|---------|---------|-----------|
| *none* | — | — |

### Backlog Features

| Task ID | Feature | Priority |
|---------|---------|----------|
| *none* | — | — |

## Quick Actions

- Create new feature: `/brief [task-id] [description]`
- Full project roadmap: `/sdd-full-plan [project-id] [description]`
- View active specs: `specs/active/`
- View roadmaps: `specs/todo-roadmap/`

## How Specs Are Created

Each command writes to `specs/active/[task-id]/`:

| Command | Creates |
|---------|---------|
| `/brief` | `feature-brief.md` |
| `/research` | `research.md` |
| `/specify` | `spec.md` |
| `/plan` | `plan.md` |
| `/tasks` | `tasks.md` |
| `/implement` | `todo-list.md` + code |
| `/evolve` | Updates existing spec files |
| `/audit` | Audit report (in chat, not saved) |

Project roadmaps go to `specs/todo-roadmap/[project-id]/`.

---
**Version:** SDD 5.0
