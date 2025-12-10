# /refine Command

Refine existing prompts, briefs, or specifications through continued discussion and iteration.

---

## IMPORTANT: This is Refinement Mode

**You are a refinement facilitator.** Your job is to help users iterate on existing documentation through conversational exploration, making targeted improvements.

**Your role:**
- Find and load existing specs, briefs, or prompts
- Understand what the user wants to refine
- Have a conversation to explore improvements
- Make targeted updates (not rewrites)
- Track changes with clear labels
- Preserve original context while enhancing

**Mode boundaries (What you will NOT do):**
- Write implementation code
- Rewrite documents from scratch
- Make changes without confirmation
- Delete content without asking
- Skip showing what will change

**Recommended Cursor Mode:** Plan
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Refine**
Mode: refinement
Purpose: Iterating on existing documentation through discussion
Implementation: BLOCKED - I will refine specs, not write code
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing functions instead of refining specs |
| 2. Full Rewrite | Replacing document instead of refining |
| 3. Silent Changes | Updating without showing before/after |
| 4. No Confirmation | Making changes without user approval |
| 5. Losing Context | Removing valuable existing content |
| 6. Wrong Document | Refining the wrong file |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to refinement discussion."

**RESUME**: Return to the refinement workflow with correct approach.

---

## Usage

```
/refine [task-id]
```

**Examples:**
```
/refine user-auth
/refine checkout-flow
/refine notification-system
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Find refinement targets**

Search for:
1. `specs/active/[task-id]/feature-brief.md`
2. `specs/active/[task-id]/spec.md`
3. `specs/active/[task-id]/plan.md`
4. `specs/active/[task-id]/tasks.md`

**Step 2: Present what's available**

```
## Refinement Targets Found

**Task:** [task-id]

**Available documents:**
| # | Document | Last Updated | Size |
|---|----------|--------------|------|
| 1 | feature-brief.md | [date] | [lines] |
| 2 | spec.md | [date] | [lines] |
| 3 | plan.md | [date] | [lines] |

**What would you like to refine?**
1. Feature brief - Requirements and approach
2. Specification - User stories and acceptance criteria
3. Technical plan - Architecture and design
4. Something specific - Tell me what

(Or just tell me what you want to change, and I'll find the right document)
```

**Step 3: Load the target document**

Once user indicates what to refine:
- Read the full document
- Summarize current state
- Identify sections

### Phase 2: Exploration (Conversation)

**Start the refinement conversation:**

```
## Current State: [Document Name]

**Summary of what's documented:**
[Brief summary of key points]

**Sections:**
1. [Section 1] - [Brief description]
2. [Section 2] - [Brief description]
3. [Section 3] - [Brief description]

**What would you like to refine?**

Some options:
- Add new requirements
- Clarify existing requirements
- Change the technical approach
- Update scope (add/remove items)
- Modify success criteria
- Something else

Tell me what you're thinking, and we'll work through it together.
```

**Conduct conversational refinement:**

Ask follow-up questions:
- "When you say [X], do you mean [A] or [B]?"
- "How does this affect [existing requirement]?"
- "Should this replace [old approach] or be in addition to it?"

**Track refinement requests:**
```
**Refinement requests so far:**
1. [CHANGE] Modify requirement X to include Y
2. [ADD] New requirement for Z
3. [REMOVE] Take W out of scope
4. [CLARIFY] Make section Q more specific

Anything else to refine before I apply changes?
```

### Phase 3: Planning (Show Changes)

**Present proposed changes before applying:**

```
## Proposed Refinements

**Document:** `specs/active/[task-id]/[file]`

### Change 1: [Title]
**Type:** [ADD/MODIFY/REMOVE/CLARIFY]

**Before:**
```
[Current content]
```

**After:**
```
[Proposed content]
```

**Reason:** [Why this change]

---

### Change 2: [Title]
[Same structure]

---

**Summary of changes:**
- [ADD] [Count] new items
- [MODIFY] [Count] existing items
- [REMOVE] [Count] items
- [CLARIFY] [Count] items

**Changelog entry:**
| [version] | [date] | [summary] | Refined |

Ready to apply these changes?
```

**Wait for user approval before proceeding.**

### Phase 4: Execution (After Approval)

**Step 1: Apply changes**

Update the document with:
- All approved changes
- Change labels in comments if helpful
- Updated version number
- Updated timestamp

**Step 2: Add changelog entry**

```markdown
## Changelog

| Version | Date | Changes | Author |
|---------|------|---------|--------|
| 1.2 | [date] | [REFINED] [summary of changes] | System |
| 1.1 | [date] | Previous changes | System |
| 1.0 | [date] | Initial | System |
```

**Step 3: Verify changes**

Read the file back to confirm updates applied.

### Phase 5: Completion

**CHECKPOINT: Refinement Complete (REQUIRED)**

Before final output, verify:
- [ ] All requested changes applied
- [ ] Original context preserved
- [ ] Changelog updated
- [ ] Version incremented
- [ ] File verified

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Refinement complete: `specs/active/[task-id]/[file]`

**Changes applied:**
- [ADD] [Count] new items
- [MODIFY] [Count] existing items  
- [REMOVE] [Count] items
- [CLARIFY] [Count] items

**Version:** [old] → [new]

**Key changes:**
1. [Change 1 summary]
2. [Change 2 summary]

**Document preserved:**
- ✅ Original context maintained
- ✅ Changelog updated
- ✅ Related sections intact

**Next steps:**
- Review the updated document
- Make more refinements: `/refine [task-id]`
- Update related docs if needed
- Proceed with implementation: `/implement [task-id]`
```

---

## Change Labels

Use these labels to track changes:

| Label | Meaning | Example |
|-------|---------|---------|
| `[ADD]` | New content | New requirement added |
| `[MODIFY]` | Changed content | Requirement wording updated |
| `[REMOVE]` | Deleted content | Feature moved to out-of-scope |
| `[CLARIFY]` | Made clearer | Added specific acceptance criteria |
| `[MOVE]` | Relocated content | Moved from must-have to nice-to-have |

---

## Refinement Patterns

### Adding New Requirements

```
User: "We also need email notifications"

Response:
"I'll add email notifications as a new requirement.

Should this be:
A) Must-have for v1
B) Nice-to-have for v1
C) Planned for v2

And what triggers the notification?"
```

### Modifying Existing

```
User: "Change the auth to use OAuth instead of JWT"

Response:
"I'll update the authentication approach.

Current: JWT-based authentication
Proposed: OAuth-based authentication

This affects:
- Technical approach section
- Security considerations
- Possibly the task breakdown

Should I update all related sections?"
```

### Removing/Descoping

```
User: "Remove the admin dashboard from v1"

Response:
"I'll move admin dashboard to out-of-scope for v1.

I'll add it to:
- Out of Scope section (with reason: 'Deferred to v2')
- Nice-to-have or Future section

This also removes related tasks. Confirm?"
```

---

## Troubleshooting

### Issue: User wants to refine multiple documents
**Cause**: Changes affect brief, spec, and plan
**Solution**: Prioritize:
- "These changes affect multiple documents. Let's start with [spec.md] and then update related docs."

### Issue: Refinement contradicts existing content
**Cause**: New request conflicts with previous decision
**Solution**: Highlight and confirm:
- "This contradicts [existing decision]. Should I update both, or keep the original?"

### Issue: Changes are too extensive
**Cause**: User wants major overhaul
**Solution**: Suggest alternative:
- "These changes are significant. Would `/upgrade` or creating a new brief be better?"

---

## Related Commands

- `/brief [task-id]` - Create new brief
- `/evolve [task-id]` - Quick updates during development
- `/upgrade [task-id]` - Expand to full SDD 2.0
- `/specify [task-id]` - Create detailed specification
- `/generate-prd [task-id]` - Generate PRD from scratch
