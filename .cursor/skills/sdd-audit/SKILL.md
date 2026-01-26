---
name: sdd-audit
description: Compare implementation against specifications, identify gaps and issues. Use for code review, quality assurance, and verifying spec compliance.
---

# SDD Audit Skill

Compare implementations against specifications and generate structured review reports.

## When to Use

- Code review before marking tasks complete
- Quality assurance checks
- Verifying implementation matches spec
- Identifying technical debt and issues

## Workflow

1. **Load specs**: Read `spec.md` → `plan.md` → `tasks.md`
2. **Identify scope**: Check `todo-list.md` for completed work
3. **Inspect code**: Review implementation for each task
4. **Gap analysis**: Compare spec requirements vs actual code
5. **Generate report**: Structured findings with severity levels

## Audit Checklist

Reference `references/checklist.md` for the complete audit checklist covering:
- Functional requirements compliance
- Non-functional requirements (performance, security)
- Code quality standards
- Edge case handling

## Severity Levels

- **CRITICAL**: Broken functionality, security risk, release blocker
- **MAJOR**: Logic error, missing feature, significant bug
- **MINOR**: Style issue, optimization opportunity, cleanup
- **OUTDATED**: Code correct but spec needs updating

## Report Format

```markdown
## Audit Report: [Feature]

**Status:** Pass | Fail | Warnings
**Date:** [timestamp]
**Spec Version:** [version]

### Quick Stats
- CRITICAL: [N]
- MAJOR: [N]  
- MINOR: [N]

### Review Comments
| ID | Severity | Location | Issue | Recommendation |
|:--:|:--------:|:---------|:------|:---------------|
| #1 | CRITICAL | `file:line` | Description | Fix suggestion |

### Spec Compliance
| Requirement | Status | Evidence |
|-------------|--------|----------|
| Req 1 | MET | [file:line] |
| Req 2 | NOT MET | [gap description] |

### Recommended Actions
1. [Priority action]
2. [Secondary action]
```

## Integration

- Works with `sdd-verifier` subagent for automated validation
- Can trigger `scripts/validate.sh` for automated checks
- Best used with Cursor's Debug Mode for runtime evidence
- Use the ask question tool if audit criteria are unclear
