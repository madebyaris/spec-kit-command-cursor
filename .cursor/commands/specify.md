# /specify Command

Create a detailed feature specification based on user requirements.

## Usage
```
/specify [feature-name] [description]
```

## Purpose
Transform feature ideas into detailed, testable requirements focusing on the "what" and "why" before implementation.

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure comprehensive requirements definition.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Parse feature description** - Extract core requirements and intent
2. **Review existing research** - Check if research.md exists for context
3. **Identify requirement gaps** - Determine what's unclear
4. **Assess complexity** - Understand scope and depth needed

**Ask clarifying questions if needed:**
- Who are the primary users? What problems are they facing?
- What are must-have vs nice-to-have features?
- What are the success criteria and KPIs?
- Are there technical constraints or dependencies?
- What edge cases and error scenarios should we consider?
- Are there compliance or security requirements?
- What's the expected user flow?

**Read relevant files:**
- Check for `specs/active/[task-id]/research.md` if it exists
- Review similar specs in `specs/active/*/spec.md`
- Read project overview at `specs/00-overview.md`
- Check templates at `.sdd/templates/spec-template.md`

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be created:**
   - File path: `specs/active/feat-XXX-[name]/spec.md` or `specs/active/[task-id]/spec.md`
   - Directory structure if new

2. **Specification structure outline:**
   - **Problem Statement:**
     - Problem being solved
     - Affected users
     - Business importance
   - **Requirements:**
     - Functional requirements (5-10 items)
     - Non-functional requirements (performance, security, etc.)
   - **User Stories:**
     - 3-7 key user stories with acceptance criteria
     - Priority and effort estimates
   - **Success Metrics:**
     - Measurable KPIs
     - Definition of done
   - **Edge Cases:**
     - Error scenarios to handle
     - Boundary conditions

3. **Reasoning:**
   - Why this structure fits the feature
   - How it connects to research (if available)
   - What makes these requirements testable
   - How we'll handle identified gaps

4. **Open questions:**
   - What still needs clarification
   - What will be deferred to planning phase

**The plan should show:**
- Clear outline of each major section
- Specific requirements to document (preview)
- How gaps will be addressed

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Create directory structure:**
   ```
   specs/active/feat-XXX-[name]/  OR  specs/active/[task-id]/
   └── spec.md
   ```

2. **Generate spec.md using template:**
   - Use `.sdd/templates/spec-template.md` or `spec-compact.md`
   - Fill in all sections comprehensively
   - Include:
     - Clear problem statement with user context
     - Functional requirements with FR-XXX IDs
     - Non-functional requirements with NFR-XXX IDs
     - User stories following standard format
     - Measurable acceptance criteria
     - Success metrics and KPIs
     - Edge cases and error scenarios
     - Dependencies and assumptions
     - Out of scope items

3. **Ensure quality:**
   - All requirements are testable
   - Acceptance criteria are specific and measurable
   - User stories follow INVEST principles
   - Edge cases are comprehensive
   - Success metrics are quantifiable

4. **Reference research:**
   - Link to research findings if available
   - Justify decisions based on research
   - Address patterns and constraints identified

### Phase 4: Documentation

**Update tracking:**
- Update `specs/index.md` if it exists
- Set status to "specified" or "planned"
- Note specification timestamp
- Set up for `/plan` phase

---

## Example
```
/specify photo-organizer Build an application that helps users organize photos into albums with drag-and-drop functionality
```

## Implementation Rules
- **Always ask clarifying questions** if description is vague
- **Focus on "what" and "why"**, not "how"
- **Create measurable acceptance criteria**
- **Consider edge cases** and error scenarios
- **Include user personas** and use cases
- **Define success metrics** and KPIs

## Output
Creates: `specs/active/feat-XXX-[name]/spec.md` or `specs/active/[task-id]/spec.md`

## Notes for AI Assistants

- **Always present a plan first** showing spec structure
- **Ask questions early** - specifications require clarity
- **Show requirement examples** in the plan
- **Wait for approval** before creating files
- **Be comprehensive but focused** - depth matters but avoid bloat
- **Make requirements testable** - each should be verifiable
