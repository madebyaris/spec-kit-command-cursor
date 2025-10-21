# /upgrade Command

Convert a lightweight feature brief to full SDD 2.0 workflow when complexity is discovered.

## Usage
```
/upgrade [task-id] [reason-for-upgrade]
```

## Purpose
When a feature brief reveals more complexity than expected, seamlessly transition to comprehensive SDD 2.0 planning without losing existing work.

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure smooth escalation.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Read existing feature-brief.md** - Understand current state
2. **Parse upgrade reason** - Understand what triggered escalation
3. **Assess complexity indicators** - Identify what requires full SDD
4. **Map brief to SDD structure** - Determine how to expand content

**Ask clarifying questions if needed:**
- What specific complexity was discovered? (compliance, multi-team, architecture, etc.)
- Are there new requirements that weren't in the brief?
- What stakeholders need to be involved now?
- What's the expected timeline now?
- Are there additional technical constraints to consider?
- What level of detail is needed for each SDD document?

**Read relevant files:**
- Existing `specs/active/[task-id]/feature-brief.md` (required)
- Any implementation code already created
- Related specs for context
- Templates for full SDD documents

**Identify upgrade triggers:**
- Compliance/security requirements
- Multiple team coordination
- Architectural changes
- Stakeholder alignment needs
- Technical uncertainty
- Extended timeline (> 2 weeks)

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be created/modified:**
   - Keep: `specs/active/[task-id]/feature-brief.md` (archived or renamed)
   - Create: `specs/active/[task-id]/research.md`
   - Create: `specs/active/[task-id]/spec.md`
   - Create: `specs/active/[task-id]/plan.md`
   - Create: `specs/active/[task-id]/tasks.md`

2. **Content mapping strategy:**
   Show how brief sections map to full SDD:
   
   **From feature-brief.md:**
   - Problem/Users section → spec.md Problem Statement
   - Research findings → research.md (expanded)
   - Requirements → spec.md Requirements (detailed)
   - Implementation approach → plan.md (comprehensive)
   - Next actions → tasks.md (full breakdown)

3. **Expansion approach for each document:**
   
   **research.md:**
   - Expand brief's research section
   - Add comprehensive codebase analysis
   - Include external solutions comparison
   - Document technical constraints
   
   **spec.md:**
   - Transform requirements into formal specs
   - Add detailed user stories with acceptance criteria
   - Include non-functional requirements
   - Define success metrics and edge cases
   
   **plan.md:**
   - Expand implementation approach into architecture
   - Add technology stack justification
   - Include data models and API contracts
   - Address security and performance
   
   **tasks.md:**
   - Break down next actions into detailed tasks
   - Add effort estimates and dependencies
   - Create comprehensive testing tasks
   - Include deployment planning

4. **Preservation strategy:**
   - What decisions from brief are kept
   - How existing context is maintained
   - Links between brief and new documents

5. **Why full SDD is needed:**
   - Justification for each new document
   - What complexity requires this depth
   - How it addresses the upgrade trigger

**The plan should show:**
- Clear before/after structure
- How brief content expands into SDD
- Why each document is necessary

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Preserve existing brief:**
   - Rename to `feature-brief-v1.md` or move to archive
   - Keep for historical reference
   - Link from new documents

2. **Create research.md:**
   - Extract research from brief
   - Expand with comprehensive analysis
   - Add detailed codebase patterns
   - Include external solution research
   - Use template: `.sdd/templates/research-template.md`

3. **Create spec.md:**
   - Transform brief requirements into detailed specs
   - Add formal requirement IDs (FR-XXX, NFR-XXX)
   - Expand into comprehensive user stories
   - Include acceptance criteria for everything
   - Add edge cases and error scenarios
   - Define measurable success metrics
   - Use template: `.sdd/templates/spec-template.md`

4. **Create plan.md:**
   - Expand implementation approach into architecture
   - Add component design and interactions
   - Detail technology stack with justifications
   - Create comprehensive data models
   - Define API contracts
   - Address security, performance, testing
   - Use template: `.sdd/templates/plan-template.md`

5. **Create tasks.md:**
   - Break down into detailed tasks
   - Add effort estimates
   - Map dependencies
   - Include comprehensive testing tasks
   - Add deployment and monitoring tasks
   - Use template: `.sdd/templates/tasks-template.md`

6. **Link documents:**
   - Ensure cross-references between docs
   - Link back to original brief
   - Note upgrade reason and date

7. **Quality check:**
   - All brief content preserved in expanded form
   - No information loss during upgrade
   - Comprehensive coverage of complexity
   - Clear path forward for team

### Phase 4: Documentation

**Finalize upgrade:**
- Update project tracking to show full SDD workflow
- Note upgrade trigger for future reference
- Provide upgrade summary
- Set up for continued full SDD process

---

## Example
```
/upgrade checkout-flow Discovered PCI compliance requirements and multi-payment provider integration needs
```

## When to Upgrade
**Upgrade triggers:**
- Compliance/security requirements discovered
- Multiple team coordination needed
- Architectural changes required
- Stakeholder alignment issues
- Technical approach uncertainty
- Timeline extends beyond 2 weeks

## Philosophy
- **Plan the escalation** before executing
- **Preserve existing work** from brief
- **Seamless transition** to comprehensive planning
- **No rework** - build upon brief foundation
- **Clear escalation path** when complexity emerges

## Output
- Preserves: `feature-brief.md` (renamed/archived)
- Creates: `research.md`, `spec.md`, `plan.md`, `tasks.md`
- Maintains: All existing decisions and context
- Adds: Comprehensive planning for complex scenarios

## Notes for AI Assistants

- **Always present a plan first** showing upgrade strategy
- **Show content mapping** - how brief expands to full SDD
- **Preserve everything** - no information should be lost
- **Explain escalation** - why full SDD is now needed
- **Wait for approval** before creating documents
- **Be comprehensive** - justify the additional planning depth
- **Link documents** - maintain traceability to original brief
