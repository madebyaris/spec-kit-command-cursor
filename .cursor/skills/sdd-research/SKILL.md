---
name: sdd-research
description: Pattern investigation and technical research before specification. Use when technical approach is unclear, exploring existing solutions, or analyzing codebase patterns.
---

# SDD Research Skill

Investigate codebase patterns and external solutions to inform specification and planning.

## When to Use

- Technical approach is unclear
- Need to understand existing patterns
- Evaluating solution options
- Before `/specify` or `/plan` commands

## Research Protocol

### Phase 1: Codebase Analysis
1. **Existing patterns** — how similar problems are solved
2. **Reusable components** — what can be leveraged
3. **Conventions** — naming, structure, architecture patterns
4. **Dependencies** — libraries/frameworks in use

### Phase 2: External Solutions
1. **Best practices** — industry standards for this problem
2. **Library options** — available tools and tradeoffs
3. **Architecture patterns** — applicable design patterns

### Phase 3: Synthesis
1. **Compare options** — pros/cons matrix
2. **Recommend approach** — based on findings
3. **Flag risks** — technical concerns and unknowns

## Output Format

```markdown
# Research: [Topic]

## Summary
[1-2 sentence overview]

## Codebase Analysis
### Existing Patterns
| Pattern | Location | Relevance |

### Reusable Components
- [component]: [how to leverage]

## External Solutions
### Option 1: [Name]
- **Pros**: | **Cons**: | **Effort**:

## Comparison Matrix
| Criteria | Option 1 | Option 2 |

## Recommendation
[Recommended approach with rationale]

## Risks & Unknowns
- [risk]: [mitigation]
```

## References

See `references/patterns.md` for common architectural patterns.

## Integration

- Findings feed into `/specify` and `sdd-planner` subagent
- Can be invoked by `sdd-explorer` for deeper analysis
- Use the ask question tool when research reveals multiple valid approaches
