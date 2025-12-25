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
| `/audit` | Spec-driven technical audit (compare code against specs) |
| `/refine` | Iterate on specs through discussion |

### Cursor Mode Integration

Each command now maps to the optimal Cursor mode:

| SDD Commands | Cursor Mode |
|--------------|-------------|
| `/brief`, `/specify`, `/plan`, `/tasks` | Plan |
| `/research` | Ask (read-only) |
| `/implement`, `/execute-task` | Agent |
| `/audit` | Debug |

### Agent Skills (Cursor 2.4+)

SDD now includes **Agent Skills** - specialized subagents that Cursor auto-activates based on context:

| Skill | Purpose |
|-------|---------|
| `sdd-research-agent` | Deep codebase investigation, pattern discovery |
| `sdd-planning-agent` | Specs, plans, task breakdowns |
| `sdd-implementation-agent` | Code generation, todo execution |
| `sdd-audit-agent` | Code review, spec comparison |

**Why Skills?** Context isolation - each skill does focused work internally and returns only summaries, keeping your main context clean.

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

# Audit code against specs
/audit user-auth Login failures on mobile
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

**🚀 NEW: `--until-finish` flag** - Add to any command above for automated execution!

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
| `/audit` | Spec-driven technical audit | Audit report with fixes |
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

# 3. Audit issues
/audit task-001-1 Payment processing failing
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
│   ├── agents/             # Agent Skills (Cursor 2.4+)
│   │   ├── sdd-research-agent/
│   │   │   └── SKILL.md
│   │   ├── sdd-planning-agent/
│   │   │   └── SKILL.md
│   │   ├── sdd-implementation-agent/
│   │   │   └── SKILL.md
│   │   └── sdd-audit-agent/
│   │       └── SKILL.md
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
│   │   ├── audit.md
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
| `/audit` | Debug | Spec-driven audit with runtime evidence |

### Switching Modes

Use `Cmd+.` (Mac) or `Ctrl+.` (Windows/Linux) to switch modes.

### Using Debug Mode with /audit

Cursor's built-in Debug Mode pairs perfectly with the `/audit` command:

1. **Switch to Debug Mode** (`Cmd+.` or `Ctrl+.`)
2. **Run `/audit [task-id]`** to compare code against specs
3. **Leverage Debug Mode's features** for runtime evidence:
   - Hypothesis generation
   - Log instrumentation
   - Runtime analysis

---

## 🔍 The /audit Command

Spec-driven technical audit that compares implementation against specifications:

```bash
/audit user-auth Login failures on mobile
```

**What it does:**
1. Reads specifications (spec.md, plan.md)
2. Inspects actual implementation
3. Compares code against requirements
4. Generates Review Board with severity levels
5. Proposes fixes only after investigation

**Synergy with Debug Mode:**
When running in Cursor's Debug Mode, `/audit` can leverage log instrumentation to gather runtime evidence alongside spec comparison.

**Output:**
```
📋 Audit Report Ready

Summary:
- 🔴 Critical: 1 issue (SQL injection)
- 🟠 Major: 2 issues (missing validation)
- 🟡 Minor: 3 issues (naming, comments)

To fix: "Fix #1" or "Fix all critical"
```

---

## 🤖 Agent Skills (Cursor 2.4+)

SDD includes specialized **Agent Skills** that act as focused subagents. Cursor automatically activates them based on context.

### Available Skills

| Skill | Location | When Activated |
|-------|----------|----------------|
| `sdd-research-agent` | `.cursor/agents/sdd-research-agent/` | Deep codebase exploration, pattern investigation |
| `sdd-planning-agent` | `.cursor/agents/sdd-planning-agent/` | Creating specs, plans, task breakdowns |
| `sdd-implementation-agent` | `.cursor/agents/sdd-implementation-agent/` | Building features, executing todos |
| `sdd-audit-agent` | `.cursor/agents/sdd-audit-agent/` | Code review, spec compliance checks |

### Why Agent Skills?

**The Problem:** When an agent does 10+ searches, context fills with raw results.

**The Solution:** Skills do focused work internally and return only summaries.

```
User: "Research how we handle auth"
    ↓
sdd-research-agent activates
    ↓
[Does 12 searches, analyzes 8 files internally]
    ↓
Returns: "JWT pattern in src/auth/. Key files: jwt.service.ts, auth.middleware.ts"
    ↓
Main context stays CLEAN!
```

### Enabling Skills

1. Open **Cursor Settings → Rules → Import Settings**
2. Toggle **Agent Skills** on
3. Skills in `.cursor/agents/` are now available

### Skills vs Commands

| Aspect | Slash Commands | Agent Skills |
|--------|----------------|--------------|
| **Trigger** | User types `/command` | Cursor auto-activates |
| **Location** | `.cursor/commands/` | `.cursor/agents/` |
| **Control** | Explicit user action | Context-based activation |
| **Use for** | Specific workflows | Focused subtasks |

---

## 🚀 The `--until-finish` Flag

**Automated execution mode** - run entire projects without stopping!

```bash
# Execute an entire epic automatically
/execute-task epic-001 --until-finish

# Create roadmap AND execute everything
/sdd-full-plan my-project Complete app with auth --until-finish
/pecut-all-in-one my-project Full SaaS dashboard --until-finish
```

**What it does:**
1. Executes all tasks in dependency order
2. No user approval needed between tasks
3. **Stops on error** - reports issue for you to fix
4. Resume with same command after fixing
5. Continues until complete

**Flow:**
```
Start → Task 1 ✅ → Task 2 ✅ → Task 3 ❌ Error → STOP → Fix → Resume → Task 3 ✅ → Done! 🎉
```

**Scope:**
- `/execute-task [epic-id] --until-finish` - Executes that epic and all its subtasks
- `/execute-task [task-id] --until-finish` - Executes from that task to end of epic
- `/sdd-full-plan --until-finish` - Creates roadmap AND executes ALL tasks

This is **"fire and forget"** mode - start it and come back when your project is built!

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

- ✅ v3.1: **Agent Skills** for Cursor 2.4+ (specialized subagents)
- ✅ v3.0: Agentic-first template rewrite
- ✅ New commands: `/generate-prd`, `/audit`, `/refine`
- ✅ `--until-finish` flag - Automated execution mode
- ✅ Cursor mode integration (including Debug Mode)
- ✅ Self-correction protocols
- ✅ Shared agent protocols (`_shared/`)

## 🙏 Acknowledgments

Special thanks to [ClavixDev](https://github.com/ClavixDev) for providing valuable ideas and suggestions on how to improve this project!

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
