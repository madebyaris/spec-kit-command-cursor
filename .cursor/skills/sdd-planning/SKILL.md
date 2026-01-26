---
name: sdd-planning
description: Generate technical plans from specifications. Use when creating architecture documents, designing system components, or preparing for implementation.
---

# SDD Planning Skill

Transform specifications into actionable technical plans.

## When to Use

- Spec exists but plan doesn't
- Designing system architecture
- Breaking down features into components
- Preparing for implementation phase
- After research is complete

## Planning Protocol

### Step 1: Understand Requirements
1. Read `spec.md` thoroughly
2. Note functional requirements and acceptance criteria
3. Identify non-functional requirements (performance, security)
4. Review research findings if available

### Step 2: Design Architecture
1. Identify major components
2. Define component responsibilities
3. Design interfaces and contracts
4. Plan data flow

### Step 3: Select Technology
1. Evaluate options against requirements
2. Consider existing codebase stack
3. Document rationale for choices

### Step 4: Plan Implementation
1. Break into phases (Setup → Core → Integration → Polish)
2. Identify dependencies between components
3. Estimate effort for each phase

### Step 5: Assess Risks
1. Identify technical risks
2. Plan mitigations
3. Note assumptions

## Plan Output Format

```markdown
# Technical Plan: [Task ID]

## Overview
[2-3 sentence summary of approach]

## Architecture

### System Diagram
```mermaid
[architecture diagram]
```

### Components
| Component | Responsibility | Dependencies |
|-----------|---------------|--------------|
| [name] | [what it does] | [depends on] |

## Technology Stack
- **Frontend**: [choice] - [rationale]
- **Backend**: [choice] - [rationale]
- **Database**: [choice] - [rationale]
- **Infrastructure**: [choice] - [rationale]

## API Design
[Key endpoints and contracts]

## Data Models
[Entity definitions and relationships]

## Security Considerations
- [consideration]: [approach]

## Performance Targets
| Metric | Target | Approach |
|--------|--------|----------|
| [metric] | [value] | [how to achieve] |

## Implementation Phases

### Phase 1: Setup
- [task with estimate]

### Phase 2: Core
- [task with estimate]

### Phase 3: Integration
- [task with estimate]

### Phase 4: Polish
- [task with estimate]

## Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| [risk] | [H/M/L] | [H/M/L] | [approach] |

## Testing Strategy
- **Unit**: [approach]
- **Integration**: [approach]
- **E2E**: [approach]

## Open Questions
- [questions needing answers before implementation]
```

## Diagram Templates

See `assets/diagram-templates.md` for common architecture diagram patterns.

## Integration

- Input from: `sdd-research` skill, `sdd-explorer` subagent
- Output to: `/tasks` command, `sdd-implementer` subagent
- Works with: `sdd-planner` subagent for complex architectures
- Use the ask question tool for architectural decisions with significant tradeoffs
