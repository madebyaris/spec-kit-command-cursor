# /evolve Command

Update existing specifications with new discoveries, changes, or refinements made during development. Keep documentation aligned with reality.

**Skill:** Uses `sdd-evolve` skill for structured spec updates.

**See also:** `.cursor/commands/_shared/agent-manual.md` for full agent protocol.

---

## Role

**Documentation evolution agent:** Update existing specs with new discoveries and changes while preserving context and maintaining changelog entries.

---

## Usage

```
/evolve [task-id] [change-description]
```

**Examples:**
- `/evolve user-auth Added password strength validation after security review`
- `/evolve checkout-flow Discovered need for guest checkout fallback`
- `/evolve notification-system Changed from polling to WebSocket based on performance testing`

---

## Instructions

### Phase 1: Analysis

1. **Find existing specs** in `specs/active/[task-id]/` (check feature-brief.md, spec.md, plan.md, tasks.md)
2. **Read all related files** to understand current state and context
3. **Categorize the change**: Discovery/Refinement (Low), Addition/Modification (Medium), Removal/Architecture (High)
4. **Assess upgrade need**: Multiple major changes → suggest `/upgrade`, simple discovery → continue with `/evolve`

### Phase 2: Planning

Present evolution plan with:
- Task ID and file to update
- Change summary, type, and impact level
- Before/after diff of relevant sections
- Proposed changelog entry
- Recommendation (proceed or suggest upgrade)

**Wait for user approval before proceeding.**

### Phase 3: Execution

1. **Update spec file** preserving context, adding changelog, incrementing version, updating date
2. **Add changelog entry** (feature-brief.md uses "Changelog" table, spec.md uses "Revision History" table)
3. **Note cross-references** if change affects other documents
4. **Update status** if spec was marked "Complete"

### Phase 4: Downstream Propagation

Check for stale downstream documents:

1. **List downstream files** in `specs/active/[task-id]/` — check for `plan.md`, `tasks.md`, `todo-list.md`
2. **Assess impact** using the change category:
   - Discovery/Refinement → downstream docs usually unaffected
   - Addition/Modification → `plan.md` and `tasks.md` likely stale
   - Removal/Architecture → all downstream docs stale
3. **Add staleness marker** to affected files (insert at top of file):
   ```
   > **[STALE]** — Upstream spec updated on [DATE]. Review needed.
   > Change: [Brief description] (spec.md v[VERSION])
   ```
4. **Report affected files** in the evolution summary output

### Phase 5: Verification

Verify before final output:
- Spec file updated, changelog added, version incremented
- Context preserved, cross-references noted
- Staleness markers added to affected downstream files
- **Read file back to confirm changes applied**

---

## Output

End response with:

```
✅ Spec evolved: `specs/active/[task-id]/[file]`

**Change:** [Type] | Impact: [Level] | Version: [old] → [new]
**Changelog:** | [version] | [date] | [description] | [reason] |
**Downstream impact:** [List of files marked STALE, or "None"]
**Cross-references:** [Other files that may need updates]
**Next steps:** Review spec, update stale downstream docs, or consider `/upgrade` for major changes
```

---

## Change Types

- **Discovery** (Low): Small findings → Add to constraints
- **Refinement** (Low): Clarifying requirements → Update with specific detail
- **Addition** (Medium): New requirement → Add, note as post-initial
- **Modification** (Medium): Changed approach → Update, document rationale
- **Removal** (High): Descoping → Move to out-of-scope, document reason

---

## When to Suggest Upgrade

Suggest `/upgrade` when change fundamentally alters approach, multiple related changes needed, brief insufficient, or architecture needs redesign.

---

## Troubleshooting

- **Multiple spec files**: Ask which to update
- **Change conflicts**: Highlight contradiction and ask if both should be updated
- **Missing changelog**: Add changelog section to older specs

---

## Related Commands

- `/brief [task-id]` - Create initial brief
- `/upgrade [task-id]` - Expand to full SDD 5.0
- `/refine [task-id]` - Interactive refinement session
- `/specify [task-id]` - Create detailed specification
- `/plan [task-id]` - Update technical plan
