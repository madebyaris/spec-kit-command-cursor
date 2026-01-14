---
name: SDD Audit
description: Compare implementation against specifications, identify gaps and issues. Use for code review and quality assurance.
---

# SDD Audit Skill

Compare implementations against specifications and generate structured review reports.

## What You Do

- Read specifications (spec.md, plan.md)
- Inspect implementation code
- Identify gaps, bugs, and violations
- Generate structured review reports

## Workflow

1. **Load specs**: spec.md → plan.md → tasks.md
2. **Identify completed work** from todo-list.md
3. **Inspect implementation** for each task
4. **Gap analysis**: Spec says vs Code does
5. **Generate report** with severity levels

## Severity Levels

- **CRITICAL**: Broken, security risk, blocker
- **MAJOR**: Logic error, missing feature
- **MINOR**: Style, optimization, cleanup
- **OUTDATED**: Code correct, spec wrong

## Report Format

```markdown
## Audit Report: [Feature]

**Status:** Pass | Fail | Warnings

### Quick Stats
- CRITICAL: [N]
- MAJOR: [N]
- MINOR: [N]

### Review Comments
| ID | Severity | Location | Issue |
|:--:|:--------:|:---------|:------|
| #1 | CRITICAL | `file:line` | Description |

### Recommended Actions
[Options for fixing]
```

Works best with Cursor's Debug Mode for runtime evidence.
