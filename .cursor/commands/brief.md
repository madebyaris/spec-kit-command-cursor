# /brief Command

Create a lightweight, single-document feature brief optimized for rapid development.

## Usage
```
/brief [task-id] [feature-description]
```

## Purpose
Generate a comprehensive but concise feature brief that balances planning with agility. Designed to be completed in ~30 minutes before coding begins.

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure deliberate, thoughtful brief creation.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Parse the feature description** - Extract key requirements and intent
2. **Check for existing patterns** - Search codebase for similar features
3. **Identify gaps** - Determine what information is missing
4. **Assess complexity** - Evaluate if brief is appropriate or if full SDD needed

**Ask clarifying questions if needed:**
- What problem does this solve? Who are the primary users?
- What are the must-have vs nice-to-have features?
- Are there technical constraints or preferences?
- What does success look like for this feature?
- Are there existing patterns we should follow?

**Note (Cursor 2.1+):** Questions will appear in Cursor's interactive UI. Answer directly in the question interface for faster workflow. You can skip questions if the information is already clear from your description.

**Read relevant files:**
- Existing task briefs in `specs/active/*/feature-brief.md` for patterns
- Project overview at `specs/00-overview.md` for context
- Templates at `.sdd/templates/feature-brief-v2.md`

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be created:**
   - File path: `specs/active/[task-id]/feature-brief.md`
   - Directory structure if new

2. **Brief structure outline:**
   - Problem statement and target users
   - Research scope (what patterns to look for)
   - Core requirements (must-haves only)
   - Implementation approach summary
   - Immediate next actions (2-3 items)
   - Success criteria

3. **Research approach:**
   - Which parts of codebase to examine
   - What patterns to look for
   - Time allocation (~15 minutes)

4. **Why this approach:**
   - Justification for structure chosen
   - How it balances planning vs execution
   - Why brief is appropriate (vs full SDD)

**The plan should be specific enough that the user can:**
- Understand what will be documented
- See the scope of research
- Approve or suggest modifications

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Create directory structure:**
   ```
   specs/active/[task-id]/
   └── feature-brief.md
   ```

2. **Conduct quick research (15 min):**
   - Search for similar patterns in codebase
   - Document findings concisely
   - Note reusable components

3. **Generate feature-brief.md using template:**
   - Use `.sdd/templates/feature-brief-v2.md` as foundation
   - Fill in all sections based on analysis
   - Include research findings
   - Keep concise but complete

4. **Ensure quality:**
   - All essential sections populated
   - Clear, actionable next steps
   - Success criteria defined
   - No ambiguity in core requirements

### Phase 4: Documentation

**Update tracking:**
- Update `specs/index.md` if it exists
- Set status to "briefed" or "ready"
- Note creation timestamp

---

## Example
```
/brief checkout-flow Streamlined one-page checkout with guest option
```

## Philosophy
- **Plan before create** → Review structure before generating
- **30 minutes planning** → Start coding after brief
- **Single document** instead of 5 separate files
- **Living document** that updates during development
- **Agile-compatible** with iterative refinement

## Output
Creates: `specs/active/[task-id]/feature-brief.md`

## Notes for AI Assistants

- **Always present a plan first** using the create_plan tool
- **Use interactive question UI (Cursor 2.1+)** - Questions appear automatically in interactive interface
- **Ask questions early** if feature description is vague
- **Show your thinking** in the plan about structure and approach
- **Wait for approval** before creating any files
- **Execute completely** once approved - don't leave partial work
- **Note plan search capability** - Users can ⌘+F to search within plans
