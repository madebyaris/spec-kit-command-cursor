# SDD Cursor Commands — Technical Documentation

<div align="center">

[![Cursor 3.8+](https://img.shields.io/badge/Cursor-3.8%2B-blue)](https://cursor.com)
[![Cursor 3.8 optimized](https://img.shields.io/badge/Cursor-3.8%20optimized-purple)](https://cursor.com/changelog/06-18-26)

**Full reference for SDD v6.0.** For a quick start, see the [README](README.md).

[What's New](#whats-new-in-v60) • [Commands](#commands) • [Memory](#memory) • [Subagents & Skills](#subagents--skills) • [Workflows](#workflows) • [Architecture](#architecture) • [Project Structure](#project-structure)

</div>

---

## What's New in v6.0

- **Cursor 3.8 throughout** — Aligned to the latest runtime (was 3.2). New badges, docs, and command guidance.
- **Pluggable Memory** — Optional long-term memory with three backends: `standard` (rules-only, default), `cursor-native` (Cursor 3.8 Memories), and `mem0` (free self-host). Configure with `/sdd-memory`; agents recall before planning and persist durable facts after. See [Memory](#memory).
- **Native Review integration** — `sdd-reviewer` and `/audit` now lean on `/review` (Bugbot + Security Review) for mechanical checks and own the spec-compliance verdict.
- **Cloud Subagents** — `/execute-parallel` and `sdd-orchestrator` can offload long-running, risky, or environment-heavy tasks via `/in-cloud`, and prep PRs with `/babysit`. Ships `.cursor/environment.json` for fast cloud startup.
- **Removed session/logging hooks** — Dropped the noisy `stop`/`subagentStop` log hooks (`.cursor/hooks.json`, `.session-log.txt`). Cursor's own UI already surfaces this. Less clutter, fewer moving parts.
- **Deep Research** — Multi-pass external investigation with web search, documentation deep-dives, and confidence scoring (`/research --deep`).
- **File Conflict Detection** — Tasks declare `touchedFiles` so the orchestrator prevents parallel edits to the same files.
- **Progressive Context Loading** — Heavy roadmaps (40+ tasks) load only the current batch.
- **Checkpoints & Resume** — `execution-checkpoint.json` enables `/execute-parallel --resume`.
- **Downstream Propagation** — `/evolve` marks stale downstream docs when a spec changes.
- **Sandbox Controls** — Granular network access via `.cursor/sandbox.json`.
- **Plugin Packaging** — Distributable as a Cursor Marketplace plugin (`.cursor-plugin/`).

---

## Commands

### Planning

| Command | Purpose | Output |
|---------|---------|--------|
| `/brief` | 30-min quick planning | `feature-brief.md` |
| `/research` | Pattern investigation (supports `--deep`) | `research.md` |
| `/specify` | Detailed requirements | `spec.md` |
| `/plan` | Technical architecture | `plan.md` |
| `/tasks` | Task breakdown | `tasks.md` |
| `/generate-prd` | PRD via Socratic questions | `full-prd.md` |
| `/sdd-full-plan` | Complete project roadmap | `roadmap.json` + tasks |

### Execution

| Command | Purpose |
|---------|---------|
| `/implement` | Execute implementation with todo tracking |
| `/execute-task` | Run single task from roadmap (`--until-finish` supported) |
| `/execute-parallel` | Parallel DAG execution via async subagents (`--resume`, `--dry-run`) |

### Maintenance

| Command | Purpose |
|---------|---------|
| `/evolve` | Update specs with discoveries + downstream propagation |
| `/refine` | Iterate on specs through discussion |
| `/upgrade` | Brief → Full SDD planning |
| `/audit` | Compare implementation against specs (folds in native `/review`) |
| `/generate-rules` | Auto-generate coding rules |
| `/sdd-memory` | Configure the memory backend (standard / cursor-native / mem0) |

### Native Cursor 3.8 tools SDD plugs into

| Tool | How SDD uses it |
|------|-----------------|
| `/review`, `/review-bugbot`, `/review-security` | `sdd-reviewer` + `/audit` run these for fast Bugbot/Security checks, then add spec compliance |
| `/in-cloud` | `sdd-orchestrator` / `/execute-parallel` offload long-running or risky tasks to isolated cloud VMs |
| `/babysit` | Hand a finished task's PR to a cloud agent to reach merge-ready |
| `/multitask` | Quick ad hoc parallel prompts with no SDD roadmap state |
| Memories | The `cursor-native` memory provider stores durable facts as Cursor Memories |

---

## Memory

SDD ships an **optional, pluggable memory layer** so agents can recall prior decisions, conventions, and gotchas across sessions — or stay completely stateless. The active backend lives in `.sdd/config.json` → `memory` and is managed with `/sdd-memory`.

| Provider | Setup | Cost | Best for |
|----------|-------|------|----------|
| `standard` *(default)* | None | Free | Solo work, max portability, or Privacy Mode users. Relies only on `.cursor/rules/` + `specs/`. |
| `cursor-native` | Toggle on | Free (Free/Pro/Team) | Anyone on Cursor 3.8 — durable facts captured as Cursor Memories, editable/deletable in the UI. |
| `mem0` | mem0 MCP / local API | Free (self-host) | Semantic, cross-session/cross-project recall you fully control (works even in Privacy Mode if self-hosted). |

**About `cursor-native`:** Cursor Memories is available on **all plans (Free, Pro, Team)** at the individual, per-project level — it is **not** a Team-plan feature. Enable it at **Settings → Rules → "Generate Memories."** It does require **Privacy Mode off** (it needs server-side state); if you run Privacy/Ghost mode, use `standard` or a self-hosted `mem0` instead.

**How it works:** the `sdd-memory` skill **recalls** relevant memories before planning/implementation and **persists** durable discoveries afterward. It never stores secrets, tokens, or file dumps. When the provider is `standard`, it is a no-op — the toolkit stays dependency-free.

```
/sdd-memory                  # interactive picker + status
/sdd-memory use cursor-native
/sdd-memory use mem0
/sdd-memory off              # back to standard
```

Adding another free/local backend is just a new entry under `memory.providers` plus a recipe in `.cursor/skills/sdd-memory/references/providers.md` — no agent changes required.

---

## Subagents & Skills

### Subagents (`.cursor/agents/`)

Specialized agents with isolated context. Background agents run asynchronously — the parent continues working.

| Subagent | Model | Mode | Purpose |
|----------|-------|------|---------|
| `sdd-explorer` | inherit | foreground, readonly | Codebase discovery |
| `sdd-planner` | inherit | foreground | Architecture design |
| `sdd-implementer` | inherit | **background** | Code generation |
| `sdd-verifier` | inherit | foreground | Post-implementation completeness check |
| `sdd-reviewer` | inherit | foreground, readonly | Pre-merge quality review |
| `sdd-orchestrator` | inherit | **background** | Parallel task coordination with DAG |

**Reviewer vs Verifier:** The reviewer is a pre-merge quality gate (security, performance, style). The verifier is a post-implementation completeness check (does the code match the spec?). Verifier answers "is it done?", Reviewer answers "is it good?"

#### Subagent Tree

Subagents can spawn their own subagents to any depth, enabling true parallel DAG execution:

```
sdd-orchestrator (background)
├── sdd-implementer (task 1) → sdd-verifier
├── sdd-implementer (task 2) → sdd-verifier
└── sdd-implementer (task 3) → sdd-verifier
```

### Skills (`.cursor/skills/`)

Auto-invoked domain knowledge packages with progressive loading:

| Skill | Auto-Invoke When | Key References |
|-------|------------------|----------------|
| `sdd-research` | Technical approach unclear | `patterns.md`, `deep-research-guide.md` |
| `sdd-planning` | Spec exists, need plan | `estimation-heuristics.md`, `diagram-templates.md` |
| `sdd-implementation` | Plan ready for execution | `patterns.md`, `progress.sh` |
| `sdd-audit` | Code review requested | `checklist.md`, `validate.sh` |
| `sdd-evolve` | Discoveries during development | `changelog-format.md`, `propagation-guide.md`, `check-staleness.sh` |
| `sdd-memory` | Start/finish of planning or implementation | `providers.md` |

Each skill folder contains:
```
sdd-[name]/
├── SKILL.md          # Core instructions
├── references/       # Loaded on demand
├── scripts/          # Executable helpers
└── assets/           # Templates
```

---

## Workflows

```mermaid
flowchart LR
    subgraph quick [Quick Planning]
        A["/brief"] --> B["/evolve"]
        B --> C["/refine"]
    end
    subgraph full [Full Planning]
        D["/research"] --> E["/specify"] --> F["/plan"] --> G["/tasks"] --> H["/implement"]
    end
    subgraph parallel [Parallel Execution]
        I["/sdd-full-plan"] --> J["/execute-parallel"]
    end
```

| Flow | Commands |
|------|----------|
| **Quick** (80% of features) | `/brief` → `/evolve` → `/refine` |
| **Full** (complex features) | `/research` → `/specify` → `/plan` → `/tasks` → `/implement` |
| **Deep Research** (unfamiliar domain) | `/research --deep` → `/specify` → `/plan` → `/tasks` → `/implement` |
| **Parallel** (project roadmap) | `/sdd-full-plan` → `/execute-parallel` |
| **Heavy App** (20+ tasks) | `/sdd-full-plan` (Option C: Phased for 40+) → `/execute-parallel --until-finish` |

### Heavy App Path

For new apps with 20+ tasks or enterprise complexity:
1. `/sdd-full-plan [project-id] [description]` — create roadmap with DAG
2. For 40+ tasks: choose **Option C: Phased Creation** to create epics incrementally
3. `/execute-parallel [project-id] --until-finish` — run all tasks with conflict detection
4. `/execute-parallel [project-id] --resume` — resume after interruption via checkpoint

### Deep Research

For high-stakes technical decisions (database engines, auth providers, cloud platforms):
```bash
/research auth-provider Compare Auth0 vs Clerk vs Supabase Auth --deep
```

Deep research performs 4 passes: landscape scan → documentation deep-dive → real-world validation → integration feasibility. Results include source URLs, reliability ratings, and a confidence assessment.

### Automated Execution
```bash
# Execute until complete
/execute-task epic-001 --until-finish

# Create and execute entire project
/sdd-full-plan my-project --until-finish
```

---

## Architecture

```mermaid
graph TD
    User["User Request"] --> MainAgent["Main Agent"]
    MainAgent -->|foreground| Explorer["sdd-explorer"]
    MainAgent -->|foreground| Planner["sdd-planner"]
    MainAgent -->|background| Orchestrator["sdd-orchestrator"]
    MainAgent -->|background| Implementer["sdd-implementer"]
    MainAgent -->|foreground| Reviewer["sdd-reviewer"]

    Orchestrator -->|"conflict check"| BatchSelector["Batch Selector"]
    BatchSelector -->|spawns| Impl1["implementer (task 1)"]
    BatchSelector -->|spawns| Impl2["implementer (task 2)"]
    BatchSelector -->|spawns| Impl3["implementer (task 3)"]

    Orchestrator -->|checkpoint| Checkpoint["execution-checkpoint.json"]

    Implementer -->|spawns| Verifier["sdd-verifier"]
    Impl1 -->|spawns| V1["verifier"]
    Impl2 -->|spawns| V2["verifier"]
    Impl3 -->|spawns| V3["verifier"]
```

---

## Project Structure

```
.cursor/
├── agents/           # 6 subagents (foreground + background)
├── skills/           # 6 skills with progressive loading (incl. sdd-memory)
├── commands/         # Slash commands
├── rules/            # Always-applied rules
├── environment.json  # Cloud agent environment setup (3.7+)
└── sandbox.json      # Network access controls

.cursor-plugin/
└── plugin.json       # Cursor Marketplace manifest

.sdd/
├── config.json       # Project configuration (incl. memory provider)
├── guidelines.md     # Methodology guide
├── ROADMAP_FORMAT_SPEC.md  # Roadmap JSON schema (with DAG)
├── FULL_PLAN_EXAMPLES.md   # Worked examples at 3 complexity levels
├── templates/        # Document templates (compact + specialized)
└── archive/          # Historical implementation docs

specs/
├── active/           # Features in development
├── backlog/          # Future features
├── todo-roadmap/     # Project roadmaps with DAG
└── completed/        # Delivered features
```

---

## Cloud & Sandbox

### Cloud environment (`.cursor/environment.json`)

Captures how cloud agents (`/in-cloud`, `/babysit`) set up their VM so they start fast. This toolkit is prompt/markdown-only, so the default install step is a no-op — point it at your project's real install/build commands when you adopt SDD in an app repo. See the [Cursor cloud docs](https://cursor.com/docs).

### Sandbox (`.cursor/sandbox.json`)

Granular network access controls for sandboxed commands. Defaults allow common package registries (npm, pypi, GitHub, Docker, Deno) while denying private networks. Customize by editing `.cursor/sandbox.json`.

---

## Templates

Available in `.sdd/templates/`:

| Template | Purpose |
|----------|---------|
| `feature-brief-v2.md` | Quick 30-min planning brief |
| `spec-compact.md` | Requirements specification |
| `plan-compact.md` | Technical plan (with heavy-app extensions) |
| `tasks-compact.md` | Task breakdown |
| `research-compact.md` | Research findings |
| `todo-compact.md` | Implementation checklist |
| `audit-report.md` | Structured audit output |
| `changelog.md` | Spec evolution log |
| `progress-report.md` | Execution progress summary |
| `retrospective.md` | Post-mortem / lessons learned |
| `roadmap-template.json` | Kanban JSON structure |
| `roadmap-template.md` | Human-readable roadmap |
| `decision-matrix.md` | Brief vs Full SDD decision guide |

---

## Plugin Distribution

SDD is packaged as a Cursor Marketplace plugin. Install via `/add-plugin` or clone the repo directly. See `.cursor-plugin/plugin.json` for the manifest.

---

## Contributing

- [Contributing guide](CONTRIBUTING.md) — How to add commands, subagents, skills, and templates
- [Report bugs](https://github.com/madebyaris/spec-kit-command-cursor/issues)
- [Suggest features](https://github.com/madebyaris/spec-kit-command-cursor/discussions)
