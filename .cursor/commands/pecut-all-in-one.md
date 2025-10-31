# /pecut-all-in-one Command

Alias for `/sdd-full-plan` - Create comprehensive SDD roadmap from A to Z.

## Overview

This command is an **alias** for `/sdd-full-plan` and provides identical functionality. Use whichever name you prefer!

## Usage
```
/pecut-all-in-one [project-id] [description]
```

## Quick Examples

```bash
# Create roadmap for a simple feature
/pecut-all-in-one notifications Add email and push notifications

# Plan a full application
/pecut-all-in-one blog-platform Full-featured blog with CMS and analytics

# Design a complex system
/pecut-all-in-one marketplace Multi-vendor e-commerce with payments
```

## Full Documentation

This command is **identical** to `/sdd-full-plan`.

For complete documentation, see:
- **[sdd-full-plan.md](./sdd-full-plan.md)** - Full command documentation
- **[ROADMAP_FORMAT_SPEC.md](../../.sdd/ROADMAP_FORMAT_SPEC.md)** - JSON format specification
- **[FULL_PLAN_EXAMPLES.md](../../.sdd/FULL_PLAN_EXAMPLES.md)** - Detailed examples

## Why Two Names?

- **`/sdd-full-plan`** - Descriptive, clear purpose
- **`/pecut-all-in-one`** - Short, memorable, all-in-one solution

Choose the one that feels natural to you!

## What This Command Does

1. **Analyzes** your project description
2. **Presents** roadmap plan for approval
3. **Asks** your execution preference (One-by-One or Immediate)
4. **Creates** comprehensive roadmap with kanban structure
5. **Organizes** tasks into epics, phases, and subtasks
6. **Maps** to SDD commands for execution
7. **Generates** VSCode-compatible JSON files

### Execution Modes

**One-by-One Mode:**
- Review each task/epic before it's created
- Learn about your project step-by-step
- Interactive, educational experience
- Best for: New projects, learning, detailed review

**Immediate Mode:**
- All tasks created at once after roadmap approval
- Fast, automated setup
- Complete roadmap ready immediately
- Best for: Experienced users, well-understood projects

## Output

Creates a complete project roadmap at:
```
specs/todo-roadmap/[project-id]/
├── roadmap.json          # Kanban board data
├── roadmap.md            # Human-readable view
├── tasks/                # Individual task details
└── execution-log.md      # Execution tracking
```

## Next Steps After Running

1. Review your roadmap in `roadmap.md`
2. Execute first task with `/execute-task epic-001`
3. Track progress in kanban board
4. Use with VSCode extensions (future)

---

**Need help?** See [sdd-full-plan.md](./sdd-full-plan.md) for detailed documentation!

