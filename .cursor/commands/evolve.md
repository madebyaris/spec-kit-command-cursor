# /evolve Command

Update existing feature briefs based on implementation discoveries and changes.

## Usage
```
/evolve [task-id] [discovery-or-change]
```

## Purpose
Keep feature briefs aligned with reality during development. Addresses the "outdated specifications" problem by making updates lightweight and continuous.

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure deliberate documentation updates.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Read existing feature-brief.md** - Understand current state
2. **Parse the change/discovery** - Extract what's different
3. **Identify impact** - Which sections need updating
4. **Determine scope** - Is this a minor tweak or significant change?

**Ask clarifying questions if needed:**
- What prompted this change? (user feedback, technical discovery, etc.)
- Does this affect requirements, approach, or both?
- Are there related changes that should be captured?
- Should this trigger an upgrade to full SDD?
- What's the reasoning/rationale for this change?

**Note (Cursor 2.1+):** Questions will appear in Cursor's interactive UI. Answer directly in the question interface for faster workflow.

**Read relevant files:**
- Current `specs/active/[task-id]/feature-brief.md`
- Related implementation files if referenced
- Previous changelog entries for context

**Assess complexity:**
- Is this still appropriate for brief format?
- Should we recommend `/upgrade` to full SDD?
- Are we still in "brief-appropriate" complexity range?

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be updated:**
   - File path: `specs/active/[task-id]/feature-brief.md`
   - Specific sections to modify

2. **Proposed changes:**
   - Show current content (relevant excerpts)
   - Show updated content (what it will become)
   - Explain reasoning for changes

3. **Changelog entry:**
   - Date and change summary
   - Reason for change
   - Impact on implementation

4. **Preservation strategy:**
   - What existing context stays unchanged
   - How we maintain continuity
   - Links to related decisions

**The plan should clearly show:**
- Before/after comparison for modified sections
- Why these specific changes are needed
- How this maintains brief coherence

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Update relevant sections:**
   - Modify problem statement if scope changed
   - Update requirements if new ones emerged
   - Revise implementation approach if pivoted
   - Adjust next actions based on progress

2. **Add changelog entry:**
   ```markdown
   ## Changelog
   
   ### [Date] - [Change Type]
   **Change:** [Description]
   **Reason:** [Why this changed]
   **Impact:** [Effect on implementation]
   ```

3. **Maintain consistency:**
   - Ensure all sections still align
   - Update cross-references
   - Keep brief, actionable format

4. **Preserve context:**
   - Don't remove valuable historical decisions
   - Maintain rationale for original approach
   - Document evolution of thinking

### Phase 4: Documentation

**Update tracking:**
- Note evolution in progress tracking
- Update timestamps
- Flag if complexity is growing (suggest upgrade)

**Quality check:**
- Brief still coherent and readable
- Changes are well-justified
- No contradictions introduced

---

## Example
```
/evolve checkout-flow Changed from Stripe to PayPal based on user feedback
```

## Philosophy
- **Plan before modify** → Review changes before updating
- **Specifications as living documents**
- **Continuous alignment** with implementation
- **Lightweight updates** during development
- **Change tracking** for team awareness
- **Thoughtful evolution** not just documentation debt

## Output
Updates: `specs/active/[task-id]/feature-brief.md` with changelog

## Notes for AI Assistants

- **Always present a plan first** showing what will change
- **Show before/after** for modified sections in the plan
- **Ask about reasoning** if the change rationale is unclear
- **Wait for approval** before modifying files
- **Suggest upgrade** if complexity is outgrowing brief format
- **Maintain changelog discipline** - every change gets documented
