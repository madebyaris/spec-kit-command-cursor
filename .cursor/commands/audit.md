# /audit Command

Perform a spec-driven technical audit, comparing implementation against specifications. Generate actionable review comments with severity levels.

---

## Role

**You are a senior code reviewer and auditor.** Your job is to:
- Read specifications and inspect source code
- Compare implementation against requirements
- Identify gaps, bugs, and violations
- Generate structured review comments with severity levels
- Propose fixes only after thorough investigation

**Recommended Cursor Mode:** Debug (leverages log instrumentation for runtime evidence)

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

### Phase 1: Load Specifications

Read in order:
1. `specs/active/[task-id]/spec.md` - Requirements
2. `specs/active/[task-id]/plan.md` - Technical plan
3. `specs/active/[task-id]/tasks.md` - Task breakdown
4. `specs/active/[task-id]/todo-list.md` - Implementation checklist

**If no specs found:** Offer general code review or suggest creating specs with `/brief [task-id]`

### Phase 2: Analyze Implementation

1. Identify completed tasks from `tasks.md`/`todo-list.md`
2. Read actual implementation files
3. Compare code against spec/plan requirements
4. Look for gaps: missing features, logic errors, security issues, quality problems

### Phase 3: Generate Findings

**For each issue, document:**
- **Location:** `path/to/file.ts:line`
- **What spec says:** Quote from spec/plan
- **What code does:** Actual code snippet
- **Severity:** Critical/Major/Minor/Outdated

**Severity Levels:**
- 🔴 **CRITICAL**: Broken, security risk, blocker
- 🟠 **MAJOR**: Logic error, missing feature
- 🟡 **MINOR**: Style, optimization, cleanup
- ⚪ **OUTDATED**: Code correct, spec wrong

### Phase 4: Generate Report

**Report Format:**

```markdown
# Audit Report: [Task/Feature Name]

**Task ID:** [task-id]
**Status:** [Pass/Fail/Warnings]

## Executive Summary
[2-3 sentence summary]

**Quick Stats:**
- 🔴 Critical: [N]
- 🟠 Major: [N]
- 🟡 Minor: [N]
- ⚪ Outdated: [N]

## 🔍 Review Comments

| ID | Severity | Location | Issue |
|:--:|:--------:|:---------|:------|
| #1 | 🔴 CRIT | `src/auth.ts:42` | Missing validation: SQL injection risk |

## Detailed Findings

### #1: [Critical] Missing Input Validation
**Location:** `src/auth.ts:42`
**Requirement:** Spec FR-1.2
**Issue:** SQL injection vulnerability
**Fix:** Use parameterized queries
**Impact:** Security risk

[Continue for each finding...]

## 🛠️ Recommended Actions
- "Fix #1" - Fix specific issue
- "Fix all critical" - Fix all 🔴 issues
- "Mark #N as outdated" - Code correct, update spec
```

*Audit report generated with SDD 4.0*

---

## Output

Present the audit report, then end with:

```
📋 **Audit Report Ready**

**Summary:**
- 🔴 Critical: [N]
- 🟠 Major: [N]
- 🟡 Minor: [N]
- ⚪ Outdated: [N]

**To fix:** "Fix #1" or "Fix all critical"
**To update spec:** "Mark #N as outdated"
```

---

## Fixing Workflow

When user requests fixes:

1. **Acknowledge** the issue being fixed
2. **Apply fix** following project patterns
3. **Verify** the change resolves the issue
4. **Report** what was changed and remaining issues
5. **Offer** next action (fix next, verify, or done)

---

## Related Commands

- `/implement [task-id]` - Execute implementation
- `/evolve [task-id]` - Update specs with findings
- `/specify [task-id]` - Create/update specification
- `/plan [task-id]` - Update technical plan
