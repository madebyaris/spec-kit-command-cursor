# Spec-Driven Development Guidelines v3.0

## Overview

This project follows **Agentic-First Spec-Driven Development (SDD)** methodology. All slash commands are direct agent instructions that you (the AI) execute using Cursor's native tools.

## Agentic-First Architecture

### Core Principles

1. **Slash commands are agent instructions** - Not descriptions, but direct instructions to you
2. **State assertions required** - Every command starts with declaring your mode and boundaries
3. **Self-correction protocol** - Built-in mistake detection and recovery
4. **Plan-approve-execute pattern** - Show plans before creating files

### Every Command Template Contains

| Component | Purpose |
|-----------|---------|
| **Role Declaration** | "You are a [role]. Your job is [purpose]." |
| **State Assertion** | Output mode, purpose, implementation status |
| **Mode Boundaries** | What you WILL and WILL NOT do |
| **Self-Correction** | Mistake detection and recovery protocol |
| **Checkpoints** | Verification gates before completion |
| **Literal Output** | Exact format for final output |

### Self-Correction Protocol

When you detect a mistake:

```
DETECT: If you find yourself doing [mistake type]...
STOP: Immediately halt the incorrect action
CORRECT: Output "I apologize - I was [mistake]. Let me return to [correct mode]."
RESUME: Return to the correct workflow
```

Common mistakes to detect:
- Writing implementation code in planning mode
- Skipping the plan presentation
- Not asking clarifying questions
- Making assumptions without informing user
- Claiming features don't exist without checking

## Cursor Mode Integration

### Mode Mapping

| SDD Command | Cursor Mode | Tools Available |
|-------------|-------------|-----------------|
| `/brief` | Plan | Codebase, Read, Terminal |
| `/research` | Ask | Search only (read-only) |
| `/specify` | Plan | Codebase, Read, Terminal |
| `/plan` | Plan | Codebase, Read, Terminal |
| `/tasks` | Plan | Codebase, Read, Terminal |
| `/implement` | Agent | All tools |
| `/evolve` | Plan | Codebase, Read, Terminal |
| `/upgrade` | Plan | Codebase, Read, Terminal |
| `/refine` | Plan | Codebase, Read, Terminal |
| `/generate-prd` | Plan | Codebase, Read, Terminal |
| `/debug` | Custom (Debug) | All Search, Terminal, Edit |
| `/execute-task` | Agent | All tools |
| `/generate-rules` | Plan | Codebase, Read, Terminal |

### Switching Modes

Users can switch modes with `Cmd+.` (Mac) or `Ctrl+.` (Windows/Linux).

Suggest mode switches when appropriate:
- "/research works best in Ask mode for read-only exploration"
- "/implement needs Agent mode for full file access"

## PLAN Mode Integration

### Universal Workflow Pattern

```
User Command → Analysis (Readonly) → Create Plan → User Approval → Execute → Document
```

### Four Phases

**Phase 1: Analysis (Readonly)**
- Read relevant files and context
- Ask clarifying questions if needed
- Analyze what needs to be done
- No file modifications

**Phase 2: Planning (Show Plan)**
- Present detailed plan
- Explain reasoning and approach
- Show structure and content preview
- Wait for user approval

**Phase 3: Execution (After Approval)**
- Create or modify files as planned
- Follow templates and guidelines
- Track progress continuously

**Phase 4: Verification**
- Verify files were created
- Update tracking files
- Present completion summary

## Workflow Phases

### SDD 2.5: Lightweight (80% of features)

#### `/brief` - 30-Minute Planning
- **Purpose**: Quick planning for rapid development
- **Output**: `feature-brief.md`
- **Use for**: Standard features, clear requirements

#### `/evolve` - Living Documentation
- **Purpose**: Update specs during development
- **Output**: Updated brief with changelog
- **Use for**: Discoveries, refinements

#### `/refine` - Interactive Refinement
- **Purpose**: Iterate on specs through discussion
- **Output**: Refined documentation
- **Use for**: Improving existing specs

### SDD 2.0: Full Planning (20% of features)

#### `/research` → `/specify` → `/plan` → `/tasks` → `/implement`

For complex, high-risk, or multi-team features:
- Multiple teams involved
- Architectural changes required
- High business risk/compliance needs
- 3+ week development timeline

### New Commands

#### `/generate-prd` - PRD Generation
Create Product Requirements Documents through Socratic questioning.
- **Output**: `full-prd.md` + `quick-prd.md`
- **Use for**: New products, major features

#### `/debug` - Spec-Driven Audit
Investigate issues by comparing code against specs.
- **Output**: Debug report with severity ratings
- **Use for**: Bug investigation, code review

#### `/generate-rules` - Coding Rules
Auto-generate Cursor rules based on tech stack detection.
- **Output**: `.cursor/rules/*.mdc` files
- **Use for**: New projects, establishing conventions

### Project Planning

#### `/sdd-full-plan` (or `/pecut-all-in-one`)
Create comprehensive A-to-Z project roadmap.
- **Output**: Kanban board in `specs/todo-roadmap/`
- **Use for**: Full applications, major systems

#### `/execute-task`
Execute specific task from roadmap.
- **Output**: Varies by task type
- **Use for**: Roadmap task execution

## Directory Structure

```
specs/
├── 00-overview.md              # Project-wide specifications
├── active/                     # Features in development
│   └── [task-id]/
│       ├── feature-brief.md    # SDD 2.5 brief
│       ├── research.md         # SDD 2.0 research
│       ├── spec.md             # SDD 2.0 specification
│       ├── plan.md             # SDD 2.0 technical plan
│       ├── tasks.md            # SDD 2.0 task breakdown
│       ├── todo-list.md        # Implementation checklist
│       └── progress.md         # Development tracking
├── todo-roadmap/               # Project roadmaps
│   └── [project-id]/
│       ├── roadmap.json        # Kanban board data
│       ├── roadmap.md          # Human-readable view
│       ├── tasks/              # Individual task files
│       └── execution-log.md    # Execution tracking
├── completed/                  # Delivered features
└── backlog/                    # Future features

.cursor/
├── commands/                   # SDD slash commands
│   ├── _shared/               # Shared agent protocols
│   │   ├── agent-manual.md    # Universal protocols
│   │   ├── self-correction.md # Self-correction protocol
│   │   └── cursor-modes.md    # Cursor mode reference
│   ├── brief.md
│   ├── research.md
│   ├── specify.md
│   ├── plan.md
│   ├── tasks.md
│   ├── implement.md
│   ├── evolve.md
│   ├── upgrade.md
│   ├── refine.md
│   ├── generate-prd.md
│   ├── debug.md
│   ├── generate-rules.md
│   ├── sdd-full-plan.md
│   └── execute-task.md
└── rules/
    └── sdd-system.mdc          # Always-applied SDD rules
```

## Task ID Convention

- **Use semantic slugs**: `user-auth-system`, `payment-integration`, `dashboard-redesign`
- **Avoid generic numbering**: `feat-001` (legacy approach)
- **Focus on meaningful, searchable identifiers**

## Quality Standards

### Specifications Should Include
- Clear user stories with acceptance criteria
- Business requirements and constraints
- Success metrics
- Edge cases and error scenarios
- Out of scope items

### Plans Should Include
- Architecture diagrams
- Technology stack with rationale
- Data models and API contracts
- Security and performance considerations
- Risk assessment

### Tasks Should Include
- Clear, actionable descriptions
- Estimated effort
- Dependencies
- Acceptance criteria

## Implementation Rules

**CRITICAL FOR AI ASSISTANTS:**
Todo-lists are NOT suggestions - they are executable checklists that MUST be followed systematically.

### Todo Execution Rules
1. **Read entire list** before starting
2. **Execute in order** - respect dependencies
3. **Mark completion**: `- [ ]` → `- [x]`
4. **Document blockers** - never skip silently
5. **Update progress** continuously

### Anti-Patterns to Avoid
- Skipping tasks without explanation
- Marking items done without completing them
- Implementing differently than planned without noting it
- Not updating checkboxes after completing work

## Best Practices

1. **Choose the right starting point:**
   - `/brief` - For 80% of features
   - `/sdd-full-plan` - For full applications
   - `/research` + `/specify` - For complex features

2. **Keep specs updated with `/evolve`**

3. **Use `/refine` for iterative improvements**

4. **Upgrade when complexity emerges with `/upgrade`**

5. **Use `/debug` to investigate issues systematically**

6. **Generate coding rules for new projects with `/generate-rules`**

## References

- **Shared Protocols**: `.cursor/commands/_shared/`
- **Implementation Guide**: `.sdd/IMPLEMENTATION_GUIDE.md`
- **Roadmap Spec**: `.sdd/ROADMAP_FORMAT_SPEC.md`
