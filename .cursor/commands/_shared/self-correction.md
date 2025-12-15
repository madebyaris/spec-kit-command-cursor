# Self-Correction Protocol

This protocol helps you detect and recover from common mistakes during SDD workflows.

---

## The DETECT → STOP → CORRECT → RESUME Pattern

### DETECT

Watch for these common mistake patterns:

| Type | What It Looks Like | Severity |
|------|--------------------|----------|
| 1. **Implementation Code** | Writing functions, components, API endpoints when in planning mode | Critical |
| 2. **Skipping Questions** | Not asking clarifying questions when information is missing | Major |
| 3. **No Plan Presentation** | Creating files without showing plan first | Major |
| 4. **Wrong Mode** | Doing implementation work when in planning mode (or vice versa) | Critical |
| 5. **Skipping Verification** | Not verifying files were created after writing | Major |
| 6. **Capability Hallucination** | Claiming features SDD doesn't have, inventing commands | Major |
| 7. **Silent Assumptions** | Making decisions without informing the user | Minor |
| 8. **Incomplete Output** | Not providing the required literal output format | Minor |

### STOP

When you detect a mistake:
1. **Immediately halt** the incorrect action
2. **Do not continue** down the wrong path
3. **Do not try to hide** the mistake

### CORRECT

Output this correction message:

```
I apologize - I was [describe the specific mistake].
Let me return to [the correct workflow/mode].
```

Examples:
- "I apologize - I was starting to write implementation code. Let me return to creating the brief."
- "I apologize - I was skipping the plan presentation. Let me show you what I'm planning to create first."
- "I apologize - I was making assumptions about the tech stack. Let me ask you about that."

### RESUME

1. Re-read the mode declaration at the top of the template
2. Output the state assertion to reset context
3. Continue from the correct workflow step

---

## Recovery Patterns

### If Stuck in Wrong Mode

```
1. STOP what you're doing
2. Re-read the template header
3. Output state assertion:
   **SDD MODE: [Correct Mode]**
   Mode: [planning|implementation|research|verification]
   Purpose: [What you should be doing]
   Implementation: [BLOCKED|AUTHORIZED]
4. Resume from correct step
```

### If User Asks You to Violate Mode Boundaries

```
1. Acknowledge what they want to do
2. Explain why this mode can't do that
3. Suggest the correct command

Example:
"I understand you want to start coding now. Since we're in Brief mode, 
I can't write implementation code yet. Once we finish the brief, you can 
run `/implement` to start building. Would you like to complete the brief first?"
```

### If You Made Partial Progress Before Catching the Mistake

```
1. STOP immediately - don't finish the wrong action
2. Explain what was done incorrectly
3. Ask user if they want to undo/revert those changes
4. Resume from the correct workflow step

Example:
"I started creating the spec file before showing you the plan - that was 
a mistake. I've created a partial file. Would you like me to:
1. Delete it and start properly with a plan
2. Show you what I created and continue from there"
```

### If Unsure Which Mode You're In

```
1. Check the template header for "SDD MODE:"
2. Look for the state assertion requirements
3. If still unclear, output:
   "Let me confirm - are we working on [planning/implementation/research]?"
```

---

## Prevention Checklist

Before taking any action, mentally check:

- [ ] Am I in the right mode for this action?
- [ ] Have I shown the user a plan first?
- [ ] Do I have enough information, or should I ask?
- [ ] Am I about to write code in a planning mode? (STOP!)
- [ ] Have I verified the previous file operation succeeded?

---

## Mode-Specific Mistake Patterns

### Planning Modes (Brief, Research, Specify, Plan, Tasks)

| Mistake | Detection | Recovery |
|---------|-----------|----------|
| Writing `src/` or application code | File path outside `specs/` | Stop, apologize, return to spec creation |
| Creating implementation files | `.js`, `.ts`, `.py` etc. | Stop, explain this is planning only |
| Running build/test commands | `npm run`, `pytest`, etc. | Stop, explain we're still planning |

### Implementation Mode (Implement)

| Mistake | Detection | Recovery |
|---------|-----------|----------|
| Skipping todo items | Not following todo-list order | Stop, return to next unchecked item |
| Not marking completion | `- [ ]` not changed to `- [x]` | Go back, update the checkbox |
| Implementing without plan | No `plan.md` exists | Stop, suggest running `/plan` first |

### Research Mode (Research)

| Mistake | Detection | Recovery |
|---------|-----------|----------|
| Making decisions | Choosing tech without presenting options | Stop, present findings with pros/cons |
| Skipping codebase search | Not searching existing patterns | Stop, search codebase first |

---

*Include this protocol in all SDD command templates*
