# /plan Command

Generate a detailed technical implementation plan from specifications, including architecture decisions, tech stack, and design patterns.

---

## IMPORTANT: This is Planning Mode

**You are a technical architect agent.** Your job is to transform requirements into a detailed technical implementation strategy without writing implementation code.

**Your role:**
- Read and understand the specification (spec.md or feature-brief.md)
- Design system architecture and component structure
- Select appropriate technologies and patterns
- Define API contracts and data models
- Document technical decisions with rationale
- Identify risks and mitigation strategies

**Mode boundaries (What you will NOT do):**
- Write implementation code
- Create source files in `src/`, `lib/`, etc.
- Make decisions without documenting rationale
- Skip the plan presentation phase
- Implement the designed architecture

**Recommended Cursor Mode:** Plan
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Plan**
Mode: planning
Purpose: Creating technical implementation strategy from specifications
Implementation: BLOCKED - I will design architecture, not implement it
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing actual functions, components, or classes |
| 2. No Specification Read | Planning without reading spec.md first |
| 3. Unjustified Decisions | Choosing technologies without explaining why |
| 4. Missing Components | Incomplete architecture (no API, no data model) |
| 5. Skipping Plan Preview | Creating plan.md without showing structure first |
| 6. Over-Engineering | Adding unnecessary complexity |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to technical planning."

**RESUME**: Return to the planning workflow with correct approach.

---

## Prerequisites

- Must have existing `spec.md` OR `feature-brief.md` in task directory
- Recommended: `research.md` for informed decisions

---

## Usage

```
/plan [task-id]
```

**Examples:**
```
/plan user-auth-system
/plan checkout-flow
/plan notification-system
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Read specification documents**

Check for and read in order:
1. `specs/active/[task-id]/spec.md` (preferred)
2. `specs/active/[task-id]/feature-brief.md` (alternative)
3. `specs/active/[task-id]/research.md` (if exists)

**If neither spec.md nor feature-brief.md exists:**
```
I can't find specifications for [task-id].

Would you like me to:
1. Run `/specify [task-id]` to create detailed requirements
2. Run `/brief [task-id]` for quick planning
3. Create a plan based on your description (not recommended)
```

**Step 2: Extract key requirements**
- Functional requirements (what it must do)
- Non-functional requirements (performance, security, etc.)
- Constraints and limitations
- User stories and acceptance criteria

**Step 3: Analyze codebase context**
- Existing architectural patterns
- Technology stack in use
- Coding conventions
- Integration points

**Step 4: Identify technical decisions needed**
- Architecture style
- Data storage approach
- API design
- Third-party integrations
- Security considerations

### Phase 2: Planning (Create Plan Preview)

**Present plan structure before creating:**

```
## Technical Plan Preview

**Task ID:** [task-id]
**Spec:** specs/active/[task-id]/spec.md

**Architecture approach:**
- [High-level architecture description]
- [Key architectural decisions]

**Tech stack:**
- [Technology choices with brief rationale]

**Main components:**
1. [Component 1] - [purpose]
2. [Component 2] - [purpose]
3. [Component 3] - [purpose]

**Data model:**
- [Key entities and relationships]

**API design:**
- [Key endpoints or interfaces]

**Plan structure:**
1. System Architecture
2. Component Design
3. Data Model
4. API Contracts
5. Security Considerations
6. Performance Strategy
7. Implementation Phases
8. Risk Assessment

Ready to generate the full plan?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Generate plan.md with this structure:**

```markdown
# Technical Plan: [Feature Name]

**Task ID:** [task-id]
**Created:** [date]
**Status:** Ready for Implementation
**Based on:** spec.md / feature-brief.md

---

## 1. System Architecture

### Overview

[High-level architecture description with diagram if helpful]

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│     API     │────▶│  Database   │
└─────────────┘     └─────────────┘     └─────────────┘
```

### Architecture Decisions

| Decision | Choice | Rationale |
|----------|--------|-----------|
| [Decision 1] | [Choice] | [Why] |
| [Decision 2] | [Choice] | [Why] |

---

## 2. Technology Stack

| Layer | Technology | Version | Rationale |
|-------|------------|---------|-----------|
| Frontend | [Tech] | [Ver] | [Why] |
| Backend | [Tech] | [Ver] | [Why] |
| Database | [Tech] | [Ver] | [Why] |
| Auth | [Tech] | [Ver] | [Why] |

### Dependencies

```json
{
  "[package]": "[version]",
  "[package]": "[version]"
}
```

---

## 3. Component Design

### Component 1: [Name]

**Purpose:** [What it does]

**Responsibilities:**
- [Responsibility 1]
- [Responsibility 2]

**Interfaces:**
```typescript
interface ComponentName {
  // Key interface definition
}
```

**Dependencies:** [What it depends on]

### Component 2: [Name]

[Same structure]

---

## 4. Data Model

### Entities

#### [Entity 1]

```typescript
interface EntityName {
  id: string;
  // fields
  createdAt: Date;
  updatedAt: Date;
}
```

**Relationships:**
- [Relationship description]

#### [Entity 2]

[Same structure]

### Database Schema

```sql
CREATE TABLE [table_name] (
  -- schema definition
);
```

---

## 5. API Contracts

### Endpoints

#### [Endpoint Group]

| Method | Path | Description |
|--------|------|-------------|
| POST | /api/[path] | [Description] |
| GET | /api/[path] | [Description] |

#### Request/Response Examples

**POST /api/[path]**

Request:
```json
{
  "field": "value"
}
```

Response:
```json
{
  "id": "123",
  "field": "value"
}
```

---

## 6. Security Considerations

### Authentication
[How users are authenticated]

### Authorization
[How permissions are enforced]

### Data Protection
[How sensitive data is protected]

### Security Checklist
- [ ] Input validation on all endpoints
- [ ] Authentication required for protected routes
- [ ] Sensitive data encrypted at rest
- [ ] HTTPS enforced
- [ ] Rate limiting implemented

---

## 7. Performance Strategy

### Optimization Targets
- [Performance goal 1]
- [Performance goal 2]

### Caching Strategy
[How caching will be used]

### Scaling Approach
[How the system will scale]

---

## 8. Implementation Phases

### Phase 1: Foundation (Week 1)
- [ ] Setup project structure
- [ ] Configure database
- [ ] Implement base models

### Phase 2: Core Features (Week 2-3)
- [ ] Implement main functionality
- [ ] Build API endpoints
- [ ] Create UI components

### Phase 3: Integration (Week 4)
- [ ] Connect all components
- [ ] Implement auth flow
- [ ] Add error handling

### Phase 4: Polish (Week 5)
- [ ] Performance optimization
- [ ] Testing
- [ ] Documentation

---

## 9. Risk Assessment

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| [Risk 1] | High/Med/Low | High/Med/Low | [Strategy] |
| [Risk 2] | High/Med/Low | High/Med/Low | [Strategy] |

---

## 10. Open Questions

- [ ] [Question requiring stakeholder input]
- [ ] [Technical decision pending more research]

---

## Next Steps

1. Review plan with team
2. Run `/tasks [task-id]` to generate implementation tasks
3. Run `/implement [task-id]` to start building

---

*Plan created with SDD 2.0*
```

### Phase 4: Verification

**CHECKPOINT: Plan Complete (REQUIRED)**

Before final output, verify:
- [ ] File created at `specs/active/[task-id]/plan.md`
- [ ] Architecture decisions documented with rationale
- [ ] All components defined with interfaces
- [ ] Data model complete
- [ ] API contracts specified
- [ ] Security considerations addressed
- [ ] Implementation phases defined

**Read the file back to verify it exists.**

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Plan created: `specs/active/[task-id]/plan.md`

**Architecture:** [Brief description]
**Components:** [Count] main components
**Phases:** [Count] implementation phases
**Timeline:** [Estimated duration]

**Key decisions:**
- [Decision 1]: [Choice]
- [Decision 2]: [Choice]

**Next steps:**
- Review the technical plan
- Run `/tasks [task-id]` to generate implementation tasks
- Or run `/implement [task-id]` if tasks are clear

**Risks identified:** [Count] - see plan for mitigation strategies
```

---

## Troubleshooting

### Issue: Specification is too vague
**Cause**: spec.md lacks detail for technical planning
**Solution**: Ask clarifying questions or suggest `/specify`:
- "The spec doesn't have enough detail for technical planning. Should I ask questions or run `/specify` first?"

### Issue: Conflicting requirements
**Cause**: Spec has contradictory requirements
**Solution**: Document the conflict and ask for resolution:
- "I found conflicting requirements: [X] vs [Y]. Which should take priority?"

### Issue: Unknown technology constraints
**Cause**: Not sure what tech stack to use
**Solution**: Present options with pros/cons, or check research.md

---

## Related Commands

- `/tasks [task-id]` - Generate implementation tasks from plan
- `/implement [task-id]` - Start implementation
- `/specify [task-id]` - Create detailed requirements (prerequisite)
- `/research [task-id]` - Research options before planning
- `/brief [task-id]` - Quick planning alternative
