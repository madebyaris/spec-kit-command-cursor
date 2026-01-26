---
name: sdd-evolve
description: Update specifications with discoveries made during development. Use when implementation reveals new requirements, constraints, or design changes.
---

# SDD Evolve Skill

Keep specifications in sync with implementation discoveries.

## When to Use

- Implementation reveals new requirements
- Technical constraints discovered during development
- Design changes needed based on learnings
- Edge cases found that weren't in original spec
- Architecture decisions made during implementation

## Evolution Protocol

### Step 1: Identify the Discovery
Categorize the change:
- **Discovery**: New information that was unknown
- **Refinement**: Clarification of existing requirement
- **Addition**: New requirement not in original scope
- **Modification**: Change to existing requirement
- **Removal**: Requirement no longer needed

### Step 2: Assess Impact
1. Which spec files are affected?
2. Does this change the plan?
3. Are there downstream impacts?
4. Should implementation pause for review?

### Step 3: Document the Change
Add changelog entry with:
- What changed
- Why it changed
- Impact on existing work
- Decision made

### Step 4: Update Specs
Modify the appropriate files:
- `spec.md` for requirement changes
- `plan.md` for architecture changes
- `tasks.md` for task adjustments
- `todo-list.md` for new/removed items

## Change Documentation Format

Add to the relevant spec file:

```markdown
## Changelog

### [Date] - [Category]: [Brief Description]

**Context**: [Why this change is needed]

**Change**: [What specifically changed]

**Impact**: [How this affects existing work]

**Decision**: [What was decided and by whom]

---
[Previous changelog entries...]
```

## Evolution Categories

### Discovery
```markdown
### [Date] - Discovery: [Title]
**Context**: During implementation of [task], discovered that [finding]
**Change**: Added [new requirement/constraint] to spec
**Impact**: [minimal/moderate/significant] - [explanation]
**Decision**: Proceeding with [approach]
```

### Refinement
```markdown
### [Date] - Refinement: [Title]
**Context**: Original requirement "[X]" was ambiguous
**Change**: Clarified to mean [specific interpretation]
**Impact**: None - aligns with existing implementation
**Decision**: Updated spec for clarity
```

### Addition
```markdown
### [Date] - Addition: [Title]
**Context**: [Why new requirement is needed]
**Change**: Added requirement for [new feature/constraint]
**Impact**: [New tasks required / timeline adjustment]
**Decision**: [Approved by / scope discussion needed]
```

### Modification
```markdown
### [Date] - Modification: [Title]
**Context**: Original approach [X] not feasible because [reason]
**Change**: Changed from [old] to [new]
**Impact**: [Rework required / tasks affected]
**Decision**: [Rationale for new approach]
```

### Removal
```markdown
### [Date] - Removal: [Title]
**Context**: [Why requirement no longer needed]
**Change**: Removed [requirement/feature]
**Impact**: [Tasks that can be skipped / simplification]
**Decision**: [Who approved removal]
```

## Best Practices

1. **Document immediately** - Don't wait until end of implementation
2. **Be specific** - Include enough detail to understand later
3. **Link to context** - Reference related tasks or discussions
4. **Assess impact** - Flag if review is needed before continuing
5. **Preserve history** - Never delete, always add changelog

## Integration

- Called during `sdd-implementer` subagent work
- Triggered by `/evolve` command
- Works with `sdd-verifier` to validate changes
- Feeds into future `/audit` runs
- Use the ask question tool if change requires stakeholder input
