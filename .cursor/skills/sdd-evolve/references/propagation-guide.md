# Downstream Propagation Guide

When a spec changes, dependent documents may become stale. This guide defines how to detect and handle staleness.

## Document Dependency Chain

```
spec.md (or feature-brief.md)
  └── plan.md
       └── tasks.md
            └── todo-list.md
                 └── implementation (code)
```

Changes flow downstream: a spec change may invalidate the plan, which may invalidate tasks, etc.

## Staleness Detection

After evolving a spec, check each downstream document:

1. **Does the change affect architecture?** → `plan.md` is potentially stale
2. **Does the change add/remove requirements?** → `tasks.md` is potentially stale
3. **Does the change modify acceptance criteria?** → `todo-list.md` is potentially stale
4. **Does the change affect completed work?** → Implementation may need rework

## Staleness Markers

When a downstream document is potentially stale, add a marker at the top:

```markdown
> **[STALE]** — Upstream spec updated on 2026-02-01. Review needed.
> Change: Added rate limiting requirements (spec.md v1.1)
```

Remove the marker after the document has been reviewed and updated.

## Impact Assessment Matrix

| Change Category | plan.md | tasks.md | todo-list.md | Code |
|----------------|---------|----------|-------------|------|
| Discovery | Unlikely | Unlikely | Unlikely | No |
| Refinement | Unlikely | Unlikely | Maybe | No |
| Addition | Likely | Likely | Likely | No |
| Modification | Likely | Likely | Likely | Maybe |
| Removal | Likely | Likely | Likely | Maybe |
| Architecture | Always | Always | Always | Likely |

## Propagation Protocol

1. **Evolve the spec** — apply the change, add changelog entry
2. **List downstream files** — check which exist in `specs/active/[task-id]/`
3. **Assess impact** — use the matrix above
4. **Add staleness markers** — to affected downstream files
5. **Report to user** — list affected files in the evolution summary
6. **Suggest next steps** — `/plan` to update plan, `/tasks` to update tasks, etc.

## When NOT to Propagate

- Discovery/Refinement changes that don't alter the plan or tasks
- Changes to out-of-scope items
- Cosmetic or documentation-only changes
