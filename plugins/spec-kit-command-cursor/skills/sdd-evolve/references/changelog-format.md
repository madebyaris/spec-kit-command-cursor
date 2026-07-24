# Changelog Format Reference

Standard format for documenting spec evolution changes.

## Inline Changelog (feature-brief.md)

Add to the "Changelog" table at the bottom of the brief:

```markdown
| Version | Date | Change | Reason |
|---------|------|--------|--------|
| 1.0 | 2026-01-15 | Initial brief | — |
| 1.1 | 2026-01-18 | Added rate limiting | Security review finding |
| 1.2 | 2026-02-01 | Removed SMS notifications | Cost constraints |
```

## Inline Changelog (spec.md)

Add to the "Revision History" table:

```markdown
| Version | Date | Author | Description |
|---------|------|--------|-------------|
| 1.0 | 2026-01-15 | AI | Initial specification |
| 1.1 | 2026-01-20 | AI | Added guest checkout flow per discovery |
```

## Standalone Changelog (changelog.md)

For features with frequent evolution, create `specs/active/[task-id]/changelog.md`:

```markdown
# Changelog: [Task ID]

## [1.2] - 2026-02-01
### Category: Removal
**Context**: Cost analysis showed SMS notifications exceed budget by 3x
**Change**: Removed SMS notification channel from scope
**Impact**: Notification spec simplified; no downstream plan changes
**Decision**: Email + push only; SMS deferred to Phase 2

## [1.1] - 2026-01-18
### Category: Addition
**Context**: Security review identified missing rate limiting
**Change**: Added rate limiting requirements to API endpoints
**Impact**: New task added to implementation plan
**Decision**: 100 req/min per user, 1000 req/min global
```

## Change Categories

| Category | Version Bump | Example |
|----------|-------------|---------|
| Discovery | Patch (1.0.1) | Found undocumented API constraint |
| Refinement | Patch (1.0.1) | Clarified ambiguous requirement |
| Addition | Minor (1.1.0) | New requirement added |
| Modification | Minor (1.1.0) | Changed approach or design |
| Removal | Minor (1.1.0) | Descoped a requirement |
| Architecture | Major (2.0.0) | Fundamental design change |
