# /sdd-memory Command

Configure how SDD remembers project knowledge across sessions. Choose a memory backend, wire it up, and (optionally) seed it from existing specs.

**Uses:** `sdd-memory` skill, `.sdd/config.json` `memory` block.

**See also:** `.cursor/commands/_shared/agent-manual.md` for the full agent protocol.

---

## Role

**Memory architect** — Present the available memory providers, explain trade-offs, set the chosen provider in `.sdd/config.json`, verify any required wiring (MCP server, env vars), and confirm the agents will consult it.

## State Assertion

- **Mode:** Planning → (after approval) configuration
- **Purpose:** Pick and wire a memory backend; do NOT change feature code
- **Boundaries:** I WILL edit `.sdd/config.json` and create MCP/env scaffolding when asked. I WILL NOT install heavy services without approval.

---

## Usage

```
/sdd-memory                      # Show current provider + interactive picker
/sdd-memory status               # Report active provider and wiring health
/sdd-memory use standard         # Rules-only, no persistent memory (default)
/sdd-memory use cursor-native    # Cursor 3.8 built-in Memories
/sdd-memory use mem0             # mem0 open-source semantic memory
/sdd-memory seed                 # Backfill memory from existing specs/decisions
/sdd-memory off                  # Disable memory (equivalent to `use standard`)
```

---

## The Three Providers

| Provider | Setup | Cost | Best for |
|----------|-------|------|----------|
| `standard` *(default)* | None | Free | Solo work, small repos, max portability, Privacy Mode users. Relies only on `.cursor/rules/` + `specs/`. |
| `cursor-native` | Toggle on in Settings | Free (Free/Pro/Team) | Anyone on Cursor 3.8. Durable facts captured as Cursor Memories, editable/deletable in the UI. |
| `mem0` | mem0 MCP server or local API | Free (self-host) | Cross-project semantic recall, long-lived knowledge, querying past decisions by meaning. Works even in Privacy Mode if self-hosted. |

> **`cursor-native` availability:** Cursor Memories works on **all plans (Free, Pro, Team)** at the individual, per-project level — it is **not** gated behind a Team plan. Enable at **Settings → Rules → "Generate Memories."** Requires **Privacy Mode off** (needs server-side state). If Privacy/Ghost mode is on, prefer `standard` or self-hosted `mem0`.

**Decision guide:**
- Want zero moving parts, or run Privacy Mode? → `standard`
- On Free/Pro/Team and want free, automatic, in-IDE memory with no extra services? → `cursor-native`
- Want searchable, semantic, cross-session/cross-project memory you control? → `mem0`

---

## Instructions

### Phase 1: Analysis (Readonly)

1. Read `.sdd/config.json` → report current `memory.provider` and `memory.enabled`.
2. If a specific provider was requested (`use <provider>`), validate it is one of `standard | cursor-native | mem0`.
3. If no argument, present the provider table above and ask which to use.

### Phase 2: Plan (Show before changing)

Show the exact `memory` block you will write and any wiring steps:
- **standard** → set `provider: "standard"`, `enabled: false`. No wiring.
- **cursor-native** → set `provider: "cursor-native"`, `enabled: true`. Wiring checklist: (1) confirm the user is **not** in Privacy/Ghost mode (Memories needs server-side state); (2) ensure **Settings → Rules → "Generate Memories"** is toggled on. Works on Free/Pro/Team — no Team plan required. Cursor manages storage; users review/delete memories in the UI.
- **mem0** → set `provider: "mem0"`, `enabled: true`. Wiring checklist:
  1. Ensure a `mem0` MCP server is available (preferred) OR a local mem0 API endpoint.
  2. Confirm env vars from `memory.providers.mem0.config` (`MEM0_API_BASE`, `MEM0_API_KEY`) — for fully local self-host these can point at `http://localhost`.
  3. If the MCP server is missing, output setup guidance (do not silently fail).

Wait for approval before editing config.

### Phase 3: Execute (After approval)

1. Update the `memory` block in `.sdd/config.json`.
2. For `mem0`, verify the MCP tool is reachable; if not, print the exact steps to add it and mark status `pending-wiring`.
3. If `seed` was requested, follow the `sdd-memory` skill's seeding protocol to backfill durable facts from `specs/` (decisions, conventions, gotchas, architecture).

### Phase 4: Verify

- Re-read `.sdd/config.json` to confirm the change persisted.
- For `mem0`, do a read/write smoke test through the skill if the server is reachable.
- Report final status.

---

## Output

```
✅ Memory provider configured

- **Provider:** [standard | cursor-native | mem0]
- **Enabled:** [true | false]
- **Wiring:** [none needed | healthy | pending-wiring: <next step>]
- **Scope:** decisions, conventions, gotchas, architecture

Agents (explorer, planner, implementer) will now consult and persist memory via the `sdd-memory` skill.

To change later: `/sdd-memory use <provider>`
```

---

## Related

- `sdd-memory` skill — read/write protocol per provider
- `/generate-rules` — the `standard` provider leans on generated rules
- `.sdd/config.json` — `memory` block
