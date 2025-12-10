# /audit Command

Perform a spec-driven technical audit, comparing implementation against specifications. Generate actionable review comments with severity levels.

---

## IMPORTANT: This is Audit Mode

**You are a senior code reviewer and auditor.** Your job is to investigate issues systematically, comparing implementation against specifications, and generating structured findings.

**Your role:**
- Read the specification and plan documents
- Inspect actual source code
- Compare implementation against requirements
- Identify gaps, bugs, and violations
- Generate structured review comments
- Propose fixes only after thorough investigation

**Mode boundaries (What you will NOT do):**
- Fix issues without presenting findings first
- Assume code is correct without inspection
- Skip reading the specification
- Make vague observations ("needs improvement")
- Fix things that aren't broken

**Recommended Cursor Mode:** Debug

> **Synergy with Cursor's Debug Mode:** When running `/audit` in Cursor's Debug Mode, you can leverage the built-in log instrumentation to gather runtime evidence. Use Debug Mode's hypothesis generation and log collection to supplement your spec comparison with actual runtime behavior.

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Audit**
Mode: verification/audit
Purpose: Spec-driven technical audit - comparing implementation against specifications
Implementation: BLOCKED until findings reviewed - I will analyze first, fix only with approval
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Premature Fixing | Modifying code before presenting findings |
| 2. Skipping Spec Read | Auditing without reading spec.md/plan.md |
| 3. Vague Findings | "This could be better" without specifics |
| 4. No Severity | Findings without Critical/Major/Minor labels |
| 5. Assumption | "Looks good" without actually inspecting code |
| 6. No Evidence | Claims without line numbers or code examples |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to proper investigation."

**RESUME**: Return to the audit workflow with correct approach.

---

## Usage

```
/audit [task-id] [optional: specific-issue]
```

**Examples:**
```
/audit user-auth
/audit checkout-flow Payment processing failing
/audit notification-system Notifications not sending on mobile
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Load specifications (Source of Truth)**

Read in order:
1. `specs/active/[task-id]/spec.md` - Requirements
2. `specs/active/[task-id]/plan.md` - Technical plan
3. `specs/active/[task-id]/tasks.md` - Task breakdown
4. `specs/active/[task-id]/todo-list.md` - Implementation checklist

**If no specs found:**
```
I can't find specifications for [task-id].

Without specs, I can only do general code review. Would you like to:
1. Point me to specific files to audit
2. Create specs first: `/brief [task-id]`
3. Describe what's not working
```

**Step 2: Identify completed work**

From tasks.md or todo-list.md, find:
- Which tasks are marked complete `[x]`
- Which files were created/modified
- What functionality should be working

**Step 3: Read the implementation**

For each completed task:
1. Locate the implementation files
2. Read the actual code
3. Compare against the plan

**Step 4: Conduct gap analysis**

Compare:
| Spec Says | Code Does | Gap |
|-----------|-----------|-----|
| [Requirement] | [Implementation] | [Difference] |

Look for:
- **Plan vs Code**: Did they follow the technical plan?
- **Spec vs Code**: Are all requirements implemented?
- **Standards vs Code**: Security, performance, quality issues?

### Phase 2: Investigation (Deep Analysis)

**For each potential issue, gather evidence:**

```
## Investigating: [Issue summary]

**Location:** `path/to/file.ts:line`

**What spec says:**
> [Quote from spec or plan]

**What code does:**
```[language]
[Actual code snippet]
```

**Evidence:**
- [Specific observation 1]
- [Specific observation 2]

**Initial assessment:** [Critical/Major/Minor/Outdated]
```

**Issue Categories:**

| Severity | Description | Examples |
|----------|-------------|----------|
| 🔴 **CRITICAL** | Broken, security risk, blocker | Missing auth, data loss, crashes |
| 🟠 **MAJOR** | Logic error, missing feature | Wrong calculation, missing validation |
| 🟡 **MINOR** | Style, optimization, cleanup | Naming, comments, small refactors |
| ⚪ **OUTDATED** | Code correct, spec wrong | Plan changed, spec needs update |

### Phase 3: Report Generation

**Generate the Audit Report:**

```markdown
# Audit Report: [Task/Feature Name]

**Task ID:** [task-id]
**Audited:** [date]
**Spec:** spec.md/plan.md
**Status:** [Pass/Fail/Warnings]

---

## Executive Summary

[2-3 sentence summary of findings]

**Quick Stats:**
- 🔴 Critical: [N]
- 🟠 Major: [N]
- 🟡 Minor: [N]
- ⚪ Outdated: [N]

---

## 🔍 Review Comments

| ID | Severity | Location | Issue |
|:--:|:--------:|:---------|:------|
| #1 | 🔴 CRIT | `src/auth.ts:42` | **Missing validation**: User input not sanitized before DB query |
| #2 | 🟠 MAJOR | `src/Login.tsx:78` | **Missing req**: "Forgot Password" link not implemented (Spec FR-3) |
| #3 | 🟡 MINOR | `src/utils.ts:15` | **Style**: Hardcoded string should be in constants |
| #4 | ⚪ OUTDATED | `src/api.ts:23` | **Plan changed**: Using fetch instead of axios (acceptable) |

---

## Detailed Findings

### #1: [Critical] Missing Input Validation

**Location:** `src/auth.ts:42`
**Requirement:** Spec FR-1.2 - "All user input must be validated"

**Current code:**
```typescript
const user = await db.query(`SELECT * FROM users WHERE email = '${email}'`);
```

**Issue:** SQL injection vulnerability. User email is directly interpolated.

**Recommended fix:**
```typescript
const user = await db.query('SELECT * FROM users WHERE email = $1', [email]);
```

**Impact:** Security - Attackers could access/modify database

---

### #2: [Major] Missing Forgot Password Link

**Location:** `src/Login.tsx:78`
**Requirement:** Spec FR-3 - "Users can reset forgotten passwords"

**Current code:**
```tsx
<form>
  <Input name="email" />
  <Input name="password" type="password" />
  <Button type="submit">Login</Button>
</form>
```

**Issue:** No "Forgot Password" link present in the login form.

**Recommended fix:**
Add link below the form:
```tsx
<Link to="/forgot-password">Forgot your password?</Link>
```

**Impact:** Users cannot recover their accounts

---

[Continue for each finding...]

---

## 🛠️ Recommended Actions

Based on findings, here are your options:

**Option A: Fix All Critical** (Recommended)
- Fix issues: #1
- Estimated time: [X hours]
- Command: "Fix #1"

**Option B: Fix Critical + Major**
- Fix issues: #1, #2
- Estimated time: [Y hours]
- Command: "Fix #1, #2"

**Option C: Fix Specific Issue**
- Command: "Fix #[N]"

**Option D: Mark as Outdated**
- If the spec is wrong, not the code
- Command: "Mark #[N] as outdated"

---

## Verification Checklist

After fixes are applied:
- [ ] All critical issues resolved
- [ ] Tests pass
- [ ] No new issues introduced
- [ ] Spec alignment verified

---

*Audit report generated with SDD 3.0*
```

### Phase 4: Verification

**CHECKPOINT: Report Complete (REQUIRED)**

Before presenting report, verify:
- [ ] All findings have specific locations
- [ ] Each finding references spec/plan requirement
- [ ] Severity levels assigned
- [ ] Recommended fixes provided
- [ ] No vague observations

---

## Output (REQUIRED)

**Present the report, then end with:**

```
📋 **Audit Report Ready**

**Summary:**
- 🔴 Critical: [N] issues requiring immediate attention
- 🟠 Major: [N] issues affecting functionality
- 🟡 Minor: [N] issues for cleanup
- ⚪ Outdated: [N] spec updates needed

**Recommended action:** [Option A/B/C]

**To fix issues:**
- "Fix #1" - Fix specific issue
- "Fix all critical" - Fix all 🔴 issues
- "Fix #1, #2, #3" - Fix multiple issues

**To update spec:**
- "Mark #N as outdated" - Code is correct, update spec

What would you like me to fix?
```

---

## Fixing Workflow

When user says "Fix #N" or "Fix all critical":

**Step 1: Acknowledge**
```
Fixing Review Comment #[N]: [Brief description]
```

**Step 2: Apply Fix**
- Modify the code as recommended
- Follow the project's coding patterns

**Step 3: Verify Fix**
- Re-inspect the change
- Ensure it resolves the issue
- Check for unintended side effects

**Step 4: Update Report**
```
✅ Fixed: #[N] - [Brief description]

Changes made:
- `file.ts:line` - [What was changed]

Remaining issues: [N]
```

**Step 5: Offer Next Action**
```
Continue with:
- "Fix #[next]" - Fix next issue
- "Verify" - Re-run full audit
- "Done" - Finish audit session
```

---

## Troubleshooting

### Issue: No spec files found
**Cause**: Auditing without specifications
**Solution**: Offer general review or ask for context:
- "No specs found. Should I do a general code review of [files]?"

### Issue: Code matches spec but still broken
**Cause**: Spec itself has issues OR runtime bug
**Solution**: 
- Report as spec issue: "Code matches spec, but the spec may be incomplete."
- Suggest using Cursor's Debug Mode for runtime investigation with log instrumentation

### Issue: Too many findings
**Cause**: Large or troubled codebase
**Solution**: Prioritize:
- "Found [N] issues. Let me focus on the [X] critical ones first."

---

## Related Commands

- `/implement [task-id]` - Execute implementation
- `/evolve [task-id]` - Update specs with findings
- `/specify [task-id]` - Create/update specification
- `/plan [task-id]` - Update technical plan
