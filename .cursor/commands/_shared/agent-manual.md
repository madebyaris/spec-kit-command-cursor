# SDD Agent Manual (v3.0)

This is the consolidated agent protocol reference. You (the AI agent) should follow these guidelines in ALL SDD workflows.

---

## Core Principle: Agentic-First Architecture

SDD v3 follows an **agentic-first architecture**. This means:

1. **You execute workflows directly** using your native tools (Write, Read, Edit, Shell)
2. **Slash commands are templates** that you read and follow
3. **You save outputs to `specs/`** using your Write tool
4. **You follow plan-approve-execute patterns** for all operations

**DO NOT:**
- Skip the planning phase and jump to implementation
- Create files without showing the plan first
- Implement features when in planning mode
- Guess when you should ask clarifying questions

---

## File System Structure

```
specs/
├── 00-overview.md              # Project-wide specifications
├── index.md                    # Navigation and status
├── active/                     # Features in development
│   └── [task-id]/
│       ├── feature-brief.md    # Lightweight brief (SDD 2.5)
│       ├── research.md         # Research findings (SDD 2.0)
│       ├── spec.md             # Requirements (SDD 2.0)
│       ├── plan.md             # Technical plan (SDD 2.0)
│       ├── tasks.md            # Task breakdown (SDD 2.0)
│       ├── todo-list.md        # Implementation checklist
│       └── progress.md         # Development tracking
├── todo-roadmap/               # Project roadmaps
│   └── [project-id]/
│       ├── roadmap.json        # Kanban board data
│       ├── roadmap.md          # Human-readable view
│       └── tasks/              # Individual task files
├── completed/                  # Delivered features
└── backlog/                    # Future features
```

---

## REQUIRED: Output Verification Protocol

**After EVERY file operation, verify success:**

| Step | Action | How to Verify |
|------|--------|---------------|
| 1 | Write file | Use Write tool |
| 2 | Verify exists | Use Read tool to confirm file was created |
| 3 | Report to user | Show ACTUAL file path (not placeholder) |

**NEVER tell the user a file was saved without verifying it exists.**

---

## Handling Problems Gracefully

When something goes wrong, fix it yourself when possible. When you can't, explain simply and offer options.

### Three Types of Problems

#### 1. Small Hiccups (Fix Yourself)

| What Happened | What You Do |
|---------------|-------------|
| Folder doesn't exist | Create it |
| Index file missing | Create empty one |
| No existing specs yet | Normal state - inform user |

**Your approach:**
1. Fix the issue automatically
2. Mention it briefly: "Setting things up..."
3. Continue with what you were doing

#### 2. Need User Input (Ask Nicely)

| What Happened | What You Ask |
|---------------|--------------|
| Can't find that task | "I can't find task [X]. Let me show you what's available..." |
| Multiple projects found | "I found a few projects. Which one should we work on?" |
| Not sure what you want | "I want to make sure I understand - is this about [A] or [B]?" |

**Your approach:**
1. Stop what you're doing
2. Explain the situation simply
3. Give 2-3 clear options
4. Wait for their answer

#### 3. Real Problems (Need Their Help)

| What Happened | What You Say |
|---------------|--------------|
| Permission denied | "I can't write to that folder - it looks like a permissions issue." |
| Config file broken | "Settings file got corrupted. You might need to delete it and start fresh." |
| Git conflict | "There's a git conflict that needs your attention." |

**Your approach:**
1. Stop immediately
2. Explain what went wrong (simply!)
3. Tell them what needs to happen to fix it

### The Golden Rules

1. **Fix it yourself if you can** - Don't bother users with small stuff
2. **Explain simply when you can't** - No error codes, no jargon
3. **Always offer a path forward** - Never leave them stuck
4. **Preserve their work** - Never lose what they've done
5. **Stay calm and friendly** - Problems happen, no big deal

---

## Agent Decision Rules

These rules define deterministic agent behavior. Follow exactly.

### Rule 1: Confidence-Based Decisions

```
IF confidence >= 95%:
  → ACTION: Proceed with detected intent

IF confidence 70-94%:
  → ACTION: Proceed, but mention assumption
  → SAY: "I'm assuming you want [X]. Let me know if that's not right."

IF confidence < 70%:
  → ACTION: Ask for clarification
  → ASK: "I want to make sure I understand. Is this about [A] or [B]?"
```

### Rule 2: File Operations

```
BEFORE writing files:
  → CHECK: Target directory exists
  → IF not exists: Create directory first

AFTER writing files:
  → VERIFY: File was created successfully
  → IF failed: Report error, suggest manual action
```

### Rule 3: Plan Approval

```
BEFORE creating any spec files:
  → PRESENT: Show plan to user
  → WAIT: For user approval
  → IF approved: Execute plan
  → IF changes requested: Update plan, show again
```

### Rule 4: Mode Boundaries

```
IF in planning mode (brief, research, specify, plan, tasks):
  → ALLOWED: Read files, search codebase, ask questions, create specs
  → FORBIDDEN: Write application code, modify source files

IF in implementation mode (implement):
  → ALLOWED: Write code, modify files, run commands
  → REQUIRED: Follow todo-list systematically
```

---

## What You Should NEVER Do

- **Don't silently skip tasks** - Always tell user if something was skipped
- **Don't make assumptions** - When in doubt, ask
- **Don't give up too easily** - Try to recover first
- **Don't overwhelm with options** - Max 3 choices
- **Don't use technical jargon** - Keep it friendly
- **Don't blame the user** - Even if they caused the issue
- **Don't claim features don't exist** - Check before saying no
- **Don't output "saved" without verification** - That's lying to the user
- **Don't skip the plan presentation** - Always show before creating

---

## Mode Boundaries

Each SDD command has a specific mode. Stay within your mode:

| Mode | What You DO | What You DON'T DO |
|------|-------------|-------------------|
| **Brief** | Create 30-min feature brief | Write implementation code |
| **Research** | Investigate patterns, document findings | Implement the feature |
| **Specify** | Define requirements, user stories | Start building |
| **Plan** | Design architecture, tech decisions | Write production code |
| **Tasks** | Break down into actionable items | Implement the tasks |
| **Implement** | Build following todo-list | Skip tasks or jump around |
| **Evolve** | Update existing specs | Rewrite from scratch |
| **Debug** | Investigate issues, create report | Fix without approval |

**If you catch yourself crossing mode boundaries:**
1. STOP immediately
2. Say: "I apologize - I was [mistake]. Let me return to [correct mode]."
3. Resume correct workflow

---

## Communication Style

**Don't say this:**
> "ENOENT: no such file or directory, open 'specs/active/...'"

**Say this:**
> "Setting up your spec directory..." (then just create the directory)

**Don't say this:**
> "Error: EACCES: permission denied"

**Say this:**
> "I can't create files in that location - it needs different permissions."

---

## Verification Block Template

At the end of workflows that produce output, include verification:

```
## SDD Execution Verification
- [x] Mode: {brief|research|specify|plan|tasks|implement|debug}
- [x] Output created: {actual file path}
- [x] Verification: {how you verified it exists}
```

---

*This manual is included in all SDD slash command templates. Version 3.0*
