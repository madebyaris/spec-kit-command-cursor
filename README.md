# 🚀 SDD Cursor Commands v3.0

<div align="center">

[![GitHub stars](https://img.shields.io/github/stars/madebyaris/spec-kit-command-cursor?style=social)](https://github.com/madebyaris/spec-kit-command-cursor/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/madebyaris/spec-kit-command-cursor?style=social)](https://github.com/madebyaris/spec-kit-command-cursor/network/members)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)

**Agentic-First Spec-Driven Development for Cursor IDE**

*AI agents that directly execute specifications - not vague descriptions, but explicit instructions*

[🚀 Quick Start](#-quick-start) • [📖 Commands](#-sdd-commands) • [🎯 Examples](#-example-workflow) • [🤝 Contributing](#-contributing)

</div>

---

## 🆕 What's New in v3.0

### Agentic-First Architecture

SDD v3.0 transforms templates from descriptions into **direct agent instructions**:

- **Role Declarations**: Every command starts with "You are a [role]. Your job is [purpose]."
- **State Assertions**: AI outputs its mode and boundaries before starting
- **Self-Correction Protocol**: Built-in mistake detection and recovery
- **Mode Boundaries**: Explicit "will do" and "will NOT do" rules
- **Verification Checkpoints**: Gates before file creation

### New Commands

| Command | Purpose |
|---------|---------|
| `/generate-prd` | Create PRDs through Socratic questioning |
| `/debug` | Spec-driven technical audit (investigate before fixing) |
| `/refine` | Iterate on specs through discussion |

### Cursor Mode Integration

Each command now maps to the optimal Cursor mode:

| SDD Commands | Cursor Mode |
|--------------|-------------|
| `/brief`, `/specify`, `/plan`, `/tasks` | Plan |
| `/research` | Ask (read-only) |
| `/implement`, `/execute-task` | Agent |
| `/debug` | Custom (Debug) |

---

## 🎯 What is Spec-Driven Development?

> **Stop coding blindly. Start building with purpose.**

Spec-Driven Development creates detailed specifications **before** writing code:

- 🎯 **Requirements are crystal clear** before implementation
- 🏗️ **Technical decisions are well-planned** and documented
- 📋 **Development tasks are structured** and manageable
- 🤝 **AI agents execute systematically** with explicit instructions

### The Agentic Difference

**Old way (vague):**
> "This command helps create specifications..."

**New way (agentic):**
> "**You are a specification agent.** Your job is to create detailed requirements. **You WILL** ask clarifying questions and define acceptance criteria. **You will NOT** write implementation code or skip the plan presentation."

---

## 🚀 Quick Start

### 1. Install
```bash
git clone https://github.com/madebyaris/spec-kit-command-cursor.git
cd spec-kit-command-cursor
```

### 2. Start Using
```bash
# Quick 30-minute planning (80% of features)
/brief user-auth JWT authentication with login/logout

# Full project roadmap
/sdd-full-plan blog-platform Full-featured blog with CMS

# Create PRD through questions
/generate-prd mobile-app

# Debug issues systematically
/debug user-auth Login failures on mobile
```

### 3. Understand the Workflow

Every command follows **plan-approve-execute**:

```
User Command → AI Analyzes → Shows Plan → You Approve → AI Executes → Verifies
```

---

## 📋 SDD Commands

### 🚀 Primary Workflow (80% of features)

| Command | Purpose | Output |
|---------|---------|--------|
| `/brief` | 30-min planning → start coding | `feature-brief.md` |
| `/evolve` | Update specs during development | Updated brief with changelog |
| `/refine` | Iterate on specs through discussion | Refined documentation |

### 📊 Full Project Planning

| Command | Purpose | Output |
|---------|---------|--------|
| `/sdd-full-plan` | Complete A-Z roadmap | Kanban board + tasks |
| `/execute-task` | Run task from roadmap | Executes with appropriate SDD command |
| `/generate-prd` | PRD via Socratic questions | `full-prd.md` + `quick-prd.md` |

### 🏗️ Advanced Workflow (20% of complex features)

| Command | Purpose | Output |
|---------|---------|--------|
| `/research` | Investigate patterns (read-only) | `research.md` |
| `/specify` | Detailed requirements | `spec.md` |
| `/plan` | Technical architecture | `plan.md` |
| `/tasks` | Task breakdown | `tasks.md` |
| `/implement` | Execute implementation | Code + `todo-list.md` |

### 🔧 Utilities

| Command | Purpose | Output |
|---------|---------|--------|
| `/upgrade` | Brief → Full SDD 2.0 | Complete planning suite |
| `/debug` | Spec-driven technical audit | Debug report with fixes |
| `/generate-rules` | Auto-generate coding rules | `.cursor/rules/*.mdc` |

---

## 🎨 Agentic Template Structure

Every command template follows this structure:

```markdown
# /command Command

[Brief description]

---

## IMPORTANT: This is [Mode] Mode

**You are a [role].** Your job is to [purpose].

**Your role:**
- [What you will do 1]
- [What you will do 2]

**Mode boundaries (What you will NOT do):**
- [Forbidden action 1]
- [Forbidden action 2]

**Recommended Cursor Mode:** [Mode]

---

## State Assertion (REQUIRED)

**Before starting, output:**
```
**SDD MODE: [Command]**
Mode: [planning|implementation|research|verification]
Purpose: [Specific purpose]
Implementation: [BLOCKED|AUTHORIZED]
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself...
**STOP**: Immediately halt
**CORRECT**: "I apologize - I was [mistake]. Let me return to [correct mode]."
**RESUME**: Continue correctly

---

## Instructions
[Phase 1: Analysis → Phase 2: Planning → Phase 3: Execution → Phase 4: Verification]

---

## Output (REQUIRED)
[Exact format for completion message]
```

---

## 🎯 Example Workflows

### Quick Feature (SDD 2.5)

```bash
# 1. Create 30-minute brief
/brief checkout-flow Quick checkout for guests

# 2. Start coding! Update as you discover things
/evolve checkout-flow Added guest cart persistence

# 3. Refine if needed
/refine checkout-flow
```

### Full Project (sdd-full-plan)

```bash
# 1. Create complete roadmap
/sdd-full-plan ecommerce-platform Multi-vendor marketplace

# 2. Execute tasks from roadmap
/execute-task epic-001
/execute-task task-001-1

# 3. Debug issues
/debug task-001-1 Payment processing failing
```

### Complex Feature (SDD 2.0)

```bash
# 1. Research patterns
/research payment-system Stripe integration patterns

# 2. Define requirements
/specify payment-system

# 3. Design architecture
/plan payment-system

# 4. Break down tasks
/tasks payment-system

# 5. Implement
/implement payment-system
```

### PRD Creation

```bash
# Create PRD through guided questions
/generate-prd saas-dashboard

# AI asks 5 strategic questions, then creates:
# - full-prd.md (comprehensive)
# - quick-prd.md (AI-optimized)
```

---

## 📁 Project Structure

```
your-project/
├── .cursor/
│   ├── commands/           # SDD slash commands
│   │   ├── _shared/       # Shared agent protocols
│   │   │   ├── agent-manual.md
│   │   │   ├── self-correction.md
│   │   │   └── cursor-modes.md
│   │   ├── brief.md
│   │   ├── research.md
│   │   ├── specify.md
│   │   ├── plan.md
│   │   ├── tasks.md
│   │   ├── implement.md
│   │   ├── evolve.md
│   │   ├── upgrade.md
│   │   ├── refine.md
│   │   ├── generate-prd.md
│   │   ├── debug.md
│   │   ├── generate-rules.md
│   │   ├── sdd-full-plan.md
│   │   └── execute-task.md
│   └── rules/
│       └── sdd-system.mdc  # Always-applied rules
├── .sdd/
│   ├── guidelines.md       # Development methodology
│   ├── IMPLEMENTATION_GUIDE.md
│   └── ROADMAP_FORMAT_SPEC.md
├── specs/
│   ├── active/            # Features in development
│   │   └── [task-id]/
│   │       ├── feature-brief.md
│   │       ├── spec.md
│   │       ├── plan.md
│   │       └── tasks.md
│   └── todo-roadmap/      # Project roadmaps
│       └── [project-id]/
│           ├── roadmap.json
│           ├── roadmap.md
│           └── tasks/
└── src/                   # Your code
```

---

## 🔧 Cursor Mode Integration

### Mode Mapping

| SDD Command | Cursor Mode | Why |
|-------------|-------------|-----|
| `/brief` | Plan | Create specs without code changes |
| `/research` | Ask | Read-only exploration |
| `/specify` | Plan | Define requirements |
| `/plan` | Plan | Architecture design |
| `/tasks` | Plan | Task breakdown |
| `/implement` | Agent | Full multi-file changes |
| `/debug` | Custom (Debug) | Investigate before fixing |

### Switching Modes

Use `Cmd+.` (Mac) or `Ctrl+.` (Windows/Linux) to switch modes.

### Custom Debug Mode

Set up in Cursor Settings → Chat → Custom Modes:

```
Name: Debug
Tools: All Search, Terminal, Edit & Reapply
Instructions: Investigate thoroughly before proposing fixes.
```

---

## 🐛 The /debug Command

Spec-driven technical audit that investigates before fixing:

```bash
/debug user-auth Login failures on mobile
```

**What it does:**
1. Reads specifications (spec.md, plan.md)
2. Inspects actual implementation
3. Compares code against requirements
4. Generates Review Board with severity levels
5. Proposes fixes only after investigation

**Output:**
```
📋 Debug Report Ready

Summary:
- 🔴 Critical: 1 issue (SQL injection)
- 🟠 Major: 2 issues (missing validation)
- 🟡 Minor: 3 issues (naming, comments)

To fix: "Fix #1" or "Fix all critical"
```

---

## 📝 The /generate-prd Command

Create PRDs through guided Socratic questioning:

```bash
/generate-prd mobile-banking
```

**Questions asked:**
1. What problem and goal?
2. What are the must-have features?
3. Any technical requirements?
4. What's explicitly out of scope?
5. Anything else I should know?

**Output:**
- `full-prd.md` - Comprehensive PRD
- `quick-prd.md` - AI-optimized summary

---

## 🤝 Contributing

We ❤️ contributions!

- 🐛 **Report bugs** - [Open an issue](https://github.com/madebyaris/spec-kit-command-cursor/issues)
- 💡 **Suggest features** - [Start a discussion](https://github.com/madebyaris/spec-kit-command-cursor/discussions)
- 🔧 **Submit PRs** - Improvements welcome!
- ⭐ **Star this repo** - Show your support!

### Recent Changes

- ✅ v3.0: Agentic-first template rewrite
- ✅ New commands: `/generate-prd`, `/debug`, `/refine`
- ✅ Cursor mode integration
- ✅ Self-correction protocols
- ✅ Shared agent protocols (`_shared/`)

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

<div align="center">

**Made with ❤️ by [Aris](https://github.com/madebyaris)**

### 🎊 Try Your First Command!

```bash
/brief hello-world Create a simple hello world feature
```

[⬆️ Back to top](#-sdd-cursor-commands-v30)

</div>
