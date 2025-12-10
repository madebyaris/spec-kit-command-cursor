# /evolve Command

Update existing specifications with new discoveries, changes, or refinements made during development. Keep documentation aligned with reality.

---

## IMPORTANT: This is Living Documentation Mode

**You are a documentation evolution agent.** Your job is to update existing specs with new information while preserving valuable context and maintaining a clear changelog.

**Your role:**
- Read existing specification documents
- Understand the change or discovery being documented
- Update specs without losing important context
- Add changelog entries explaining what changed and why
- Suggest spec upgrades if changes are significant

**Mode boundaries (What you will NOT do):**
- Write implementation code
- Rewrite specs from scratch (preserve existing)
- Delete important context without asking
- Skip the changelog entry
- Modify files without showing what will change

**Recommended Cursor Mode:** Plan
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Evolve**
Mode: evolution
Purpose: Updating specifications with new discoveries and changes
Implementation: BLOCKED - I will update documentation, not write code
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing functions or modifying source files |
| 2. Full Rewrite | Deleting and recreating instead of updating |
| 3. No Changelog | Updating without documenting the change |
| 4. Context Loss | Removing valuable information without asking |
| 5. No Diff Preview | Changing files without showing before/after |
| 6. Wrong File | Updating the wrong spec document |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to spec evolution."

**RESUME**: Return to the evolution workflow with correct approach.

---

## Usage

```
/evolve [task-id] [change-description]
```

**Examples:**
```
/evolve user-auth Added password strength validation after security review
/evolve checkout-flow Discovered need for guest checkout fallback
/evolve notification-system Changed from polling to WebSocket based on performance testing
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Find existing specs**

Look for specs in order:
1. `specs/active/[task-id]/feature-brief.md` (SDD 2.5)
2. `specs/active/[task-id]/spec.md` (SDD 2.0)
3. `specs/active/[task-id]/plan.md` (technical changes)
4. `specs/active/[task-id]/tasks.md` (task changes)

**If no specs found:**
```
I can't find specs for [task-id] in `specs/active/`.

Would you like to:
1. Create a new brief: `/brief [task-id]`
2. Check a different task ID
3. Search for the spec in a different location
```

**Step 2: Read existing documentation**

Read all related files to understand:
- Current state of the spec
- What decisions have been made
- What context exists

**Step 3: Understand the change**

Parse the change description and categorize:

| Change Type | Impact | Examples |
|-------------|--------|----------|
| **Discovery** | Low | Found edge case, learned constraint |
| **Refinement** | Low | Clarified requirement, added detail |
| **Addition** | Medium | New requirement, new feature |
| **Modification** | Medium | Changed approach, updated decision |
| **Removal** | High | Removing requirement, descoping |
| **Architecture** | High | Fundamental approach change |

**Step 4: Assess if upgrade is needed**

| Signal | Recommendation |
|--------|----------------|
| Multiple major changes | Consider `/upgrade` to full SDD 2.0 |
| Architecture change | Consider `/plan` update |
| New requirements | Consider `/specify` update |
| Simple discovery | Continue with `/evolve` |

### Phase 2: Planning (Create Plan)

**Present evolution plan:**

```
## Evolution Plan

**Task:** [task-id]
**File to update:** `specs/active/[task-id]/[file]`

**Change summary:**
[What's being changed]

**Change type:** [Discovery/Refinement/Addition/Modification/Removal]
**Impact level:** [Low/Medium/High]

**Before (relevant section):**
```
[Current content]
```

**After (proposed change):**
```
[Updated content]
```

**Changelog entry:**
```
| [version] | [date] | [change description] | [author] |
```

**Recommendation:** [Proceed with evolve / Suggest upgrade]

Ready to apply this change?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Step 1: Update the spec file**

Make the approved changes while:
- Preserving all existing context
- Adding changelog entry
- Updating version number
- Updating "last modified" date

**Step 2: Add changelog entry**

For feature-brief.md, add/update section:

```markdown
---

## Changelog

| Version | Date | Change | Reason |
|---------|------|--------|--------|
| 1.1 | [date] | [change description] | [reason from user] |
| 1.0 | [date] | Initial brief | Created |
```

For spec.md, update revision history:

```markdown
## Revision History

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.1 | [date] | [change description] | System |
| 1.0 | [date] | Initial specification | System |
```

**Step 3: Cross-reference updates**

If the change affects other documents:
- Note dependencies: "This change may affect plan.md"
- Suggest updates: "Consider updating the technical plan"

**Step 4: Update status if needed**

If spec was marked "Complete", update to "Updated" or "In Progress"

### Phase 4: Verification

**CHECKPOINT: Evolution Complete (REQUIRED)**

Before final output, verify:
- [ ] Spec file updated with changes
- [ ] Changelog entry added
- [ ] Version number incremented
- [ ] Context preserved (nothing valuable lost)
- [ ] Cross-references noted

**Read the file back to verify changes applied.**

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Spec evolved: `specs/active/[task-id]/[file]`

**Change applied:**
- Type: [Discovery/Refinement/Addition/Modification/Removal]
- Impact: [Low/Medium/High]
- Version: [old] → [new]

**What changed:**
[Brief summary of the change]

**Changelog entry added:**
| [version] | [date] | [description] | [reason] |

**Cross-references:**
- [Other files that may need updates]

**Next steps:**
- Review the updated spec
- Update related docs if needed: `/evolve [task-id] [another-change]`
- Continue implementation

**Need major changes?** Consider `/upgrade [task-id]` for full replanning
```

---

## Change Types Reference

### Discovery
Small findings during implementation
```
/evolve user-auth Found that API rate limits to 100 req/min
```
**Action:** Add to constraints section

### Refinement
Clarifying existing requirements
```
/evolve checkout-flow Clarified: guest checkout only for orders < $500
```
**Action:** Update requirement with specific detail

### Addition
New requirement or feature
```
/evolve notification-system Added requirement for notification grouping
```
**Action:** Add new requirement, note as post-initial

### Modification
Changing existing approach
```
/evolve caching Changed from Redis to in-memory for simplicity
```
**Action:** Update approach, document rationale

### Removal
Descoping feature
```
/evolve dashboard Removing real-time updates from v1 scope
```
**Action:** Move to out-of-scope, document reason

---

## When to Suggest Upgrade

Suggest `/upgrade` when:
- Change fundamentally alters the approach
- Multiple related changes need to be made
- Brief is no longer sufficient for complexity
- Architecture needs redesign

```
This change seems significant. The brief might benefit from full SDD 2.0 planning.

Would you like to:
1. Apply this change and continue with brief
2. Run `/upgrade [task-id]` for comprehensive replanning
```

---

## Troubleshooting

### Issue: Not sure which file to update
**Cause**: Multiple spec files exist
**Solution**: Ask for clarification:
- "I found both feature-brief.md and spec.md. Which should I update?"

### Issue: Change conflicts with existing content
**Cause**: New info contradicts previous decision
**Solution**: Highlight the conflict:
- "This contradicts the previous decision about [X]. Should I update both?"

### Issue: Changelog is missing
**Cause**: Older spec without changelog section
**Solution**: Add the section:
- "Adding changelog section to track this and future changes."

---

## Related Commands

- `/brief [task-id]` - Create initial brief
- `/upgrade [task-id]` - Expand to full SDD 2.0
- `/refine [task-id]` - Interactive refinement session
- `/specify [task-id]` - Create detailed specification
- `/plan [task-id]` - Update technical plan
