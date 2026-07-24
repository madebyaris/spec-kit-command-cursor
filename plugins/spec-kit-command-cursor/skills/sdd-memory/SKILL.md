---
name: sdd-memory
description: Recall and persist durable project knowledge (decisions, conventions, gotchas, architecture) across SDD sessions. Provider-aware — supports standard (rules-only), Cursor native Memories, and mem0. Use at the start of planning/implementation to recall context, and at the end to persist discoveries.
---

# SDD Memory Skill

Give SDD agents a configurable, optional long-term memory. The active backend is set in `.sdd/config.json` → `memory.provider`. This skill is a thin, provider-agnostic protocol: **recall before you plan, persist after you learn.**

## When to Use

- **Recall** — starting `/brief`, `/research`, `/specify`, `/plan`, or `/implement`: load relevant prior decisions, conventions, and gotchas before acting.
- **Persist** — finishing a task or hitting a durable discovery: save facts worth remembering next time.
- **Manage** — `/sdd-memory` configures, seeds, or disables the backend.

> If `memory.enabled` is `false` or `provider` is `standard`, this skill is a no-op beyond reading `.cursor/rules/` and `specs/`. Never block work waiting on memory.

## Step 0: Resolve Provider (always first)

Read `.sdd/config.json` → `memory`. Branch on `provider`:

| Provider | Recall source | Persist target |
|----------|---------------|----------------|
| `standard` | `.cursor/rules/` + `specs/` only | nothing (write specs/rules instead) |
| `cursor-native` | Cursor-injected Memories + rules/specs | surface durable facts as memory candidates (Cursor captures them) |
| `mem0` | `mem0` MCP `search` + rules/specs | `mem0` MCP `add` |

Full per-provider read/write recipes: `references/providers.md`.

## Step 1: Recall

1. Derive 2–4 search intents from the task (e.g. "auth token storage decision", "API error-handling convention").
2. Query the active provider (see `references/providers.md`). For `standard`, scan `specs/` + rules.
3. Summarize the top relevant memories into the working context. Cite the source. If a recalled memory conflicts with the current request, surface the conflict — do not silently follow stale memory.

## Step 2: Persist (what is worth remembering)

Save only **durable, reusable, non-obvious** facts in these categories (`memory.scope`):

- **decisions** — chosen approach + the why (e.g. "Use Postgres over Mongo for relational integrity").
- **conventions** — project rules an agent should follow (naming, structure, test style).
- **gotchas** — traps, flaky areas, env quirks, "don't do X".
- **architecture** — durable system shape (service boundaries, data flow).

Do **not** persist: transient state, secrets/tokens, full file contents, or anything already captured in a spec/rule.

### Memory record shape

```
[category] <one-line fact> — <short why/context> (source: <task-id or file>)
```

## Step 3: Hygiene

- Prefer updating an existing memory over creating a near-duplicate.
- When a decision is reversed, persist the reversal and mark the old one outdated (for `cursor-native`, tell the user it can be deleted in the UI; for `mem0`, update/delete the record).

## Integration

- Called by `sdd-explorer`, `sdd-planner`, and `sdd-implementer` (recall at start, persist at end).
- Configured by `/sdd-memory`.
- `secrets are never stored` — enforce this regardless of provider.

## References

- `references/providers.md` — exact recall/persist recipes for `standard`, `cursor-native`, and `mem0` (incl. mem0 MCP tool calls and self-host notes).
