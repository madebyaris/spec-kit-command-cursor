# Memory Providers — Recall & Persist Recipes

Exact protocols for each backend. The active one is `.sdd/config.json` → `memory.provider`.
All providers share the same rule: **never store secrets, tokens, or full file dumps.**

---

## `standard` (default, zero-dependency)

No external memory. The "memory" is the repo itself.

**Recall:**
- Read `.cursor/rules/*.mdc` for conventions.
- Scan `specs/` (active + completed) for prior decisions, especially `plan.md` "Decisions" sections and `changelog` entries.

**Persist:**
- Write durable facts where they belong: a decision → `plan.md`; a convention → a `.cursor/rules/*.mdc` (consider `/generate-rules`); a gotcha → `progress.md` / `notes.md`.
- There is no separate memory store. This keeps the toolkit fully portable.

---

## `cursor-native` (Cursor 3.8 built-in Memories)

Use Cursor's first-party Memories. Available on **all plans (Free, Pro, Team)** at the individual, per-project level — **not** a Team-plan feature. User-manageable in the Cursor UI (memories can be reviewed/deleted there; automations can prune outdated ones).

**Requirements:**
- **Privacy Mode off** — Memories needs server-side state, so Privacy/Ghost mode disables it. If the user is in Privacy Mode, this provider cannot work; recommend `standard` or self-hosted `mem0` and report it.
- **"Generate Memories" toggled on** at Settings → Rules. Memories are proposed by a background model and stored per project.

**Recall:**
- Cursor injects relevant memories into context automatically. Read them as authoritative project knowledge alongside rules/specs.
- Do not build a parallel store — that would duplicate and drift.

**Persist:**
- State durable facts plainly in the conversation in the canonical record shape so Cursor captures them as memories, e.g.:
  `[decision] Auth uses short-lived JWT + refresh rotation — chosen for stateless API scaling (source: user-auth).`
- Keep each memory atomic (one fact per memory) so it can be individually edited/deleted later.

**Hygiene:**
- When a fact changes, state the new fact and note the old one is superseded; advise the user they can delete the stale memory in the Cursor UI, or let a `/automate` job prune outdated memories.

---

## `mem0` (open-source semantic memory, free self-host)

Semantic, searchable, cross-session/cross-project memory. Preferred wiring is the **mem0 MCP server** so the agent reads/writes through standard MCP tool calls; a local mem0 API also works.

Config lives in `.sdd/config.json` → `memory.providers.mem0`:
- `mcpServer` (default `"mem0"`) — MCP server id to call.
- `config.userId` (default `"sdd"`) — namespace for this project's memories.
- `config.apiBaseEnv` / `config.apiKeyEnv` — env var names; for full local self-host point `MEM0_API_BASE` at `http://localhost:<port>`.

### Setup (one-time)
1. Run mem0 locally (self-host) or use a mem0 endpoint. See https://github.com/mem0ai/mem0.
2. Add a mem0 MCP server to Cursor (Settings → MCP), id matching `memory.providers.mem0.mcpServer`.
3. Set the env vars referenced by `apiBaseEnv` / `apiKeyEnv`.
4. Run `/sdd-memory status` to smoke-test connectivity.

### Recall
Call the mem0 MCP search/retrieve tool (inspect the server's tool schema first):

```
CallMcpTool(server="mem0", toolName="search_memory", arguments={
  "query": "<search intent>",
  "user_id": "sdd"
})
```

Merge the top results into context; cite them.

### Persist
Call the mem0 MCP add tool with a single atomic fact:

```
CallMcpTool(server="mem0", toolName="add_memory", arguments={
  "messages": "[decision] <fact> — <why> (source: <task-id>)",
  "user_id": "sdd",
  "metadata": { "category": "decisions", "project": "<repo>", "taskId": "<task-id>" }
})
```

> Tool names (`search_memory`/`add_memory`/`add`/`search`) vary by mem0 MCP build. Always read the server's tool descriptor before calling, and adapt argument names accordingly.

### Hygiene
- Before adding, search for a near-duplicate; update instead of duplicating when the server supports it.
- On a reversed decision, add the new fact and delete/supersede the old record.

### Fallback
If the mem0 server is unreachable, degrade gracefully to `standard` behavior for this run and report `pending-wiring` — never block the task.

---

## Other free backends

The architecture is provider-agnostic. To add another free/local backend (e.g. a local vector store or self-hosted graph memory), add an entry under `memory.providers` in `.sdd/config.json` and a recall/persist recipe here mirroring the `mem0` pattern (MCP tool calls preferred). No agent code changes are required.
