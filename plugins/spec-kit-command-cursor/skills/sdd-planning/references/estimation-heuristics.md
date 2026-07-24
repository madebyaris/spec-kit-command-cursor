# Estimation Heuristics

Guidelines for estimating task effort in SDD planning.

## Task Sizing

| Size | Hours | Description | Example |
|------|-------|-------------|---------|
| S | 2–4h | Single-file change, clear scope | Add a validation rule |
| M | 4–8h | Multi-file, well-understood | CRUD endpoint + tests |
| L | 8–16h | Cross-cutting, some unknowns | Auth system integration |
| XL | 16h+ | **Split this task** — too large for reliable estimation | Full payment flow |

**Target:** Most tasks should be S or M. If you have many L/XL tasks, break them down further.

## Common Estimation Pitfalls

| Pitfall | Symptom | Fix |
|---------|---------|-----|
| Anchoring | First estimate sticks regardless of complexity | Estimate independently, then compare |
| Optimism bias | "It's just a simple change" | Add 30% buffer for unknowns |
| Ignoring integration | Estimate per-component but miss glue work | Add explicit integration tasks |
| Forgetting tests | Estimate code but not test writing | Include test effort in every task |
| Hidden dependencies | Task blocked by undiscovered prerequisite | Map dependencies before estimating |
| Scope creep | "While we're at it..." additions | Stick to spec; new work = new task |

## Estimation by Task Type

| Task Type | Typical Range | Notes |
|-----------|--------------|-------|
| Research | 4–8h | Cap at 8h; time-box to avoid rabbit holes |
| Specification | 2–4h | Shorter if research was thorough |
| Planning | 4–8h | Includes architecture diagrams |
| Implementation (UI) | 4–16h | Depends on component complexity |
| Implementation (API) | 4–12h | Depends on business logic |
| Implementation (DB) | 2–8h | Schema + migrations + seeds |
| Testing | 2–8h | Unit + integration; E2E adds more |
| DevOps/Infra | 4–16h | High variance; add buffer |

## Parallel Execution Considerations

When estimating for parallel execution:
- Tasks touching **disjoint files** can run simultaneously
- Tasks sharing files (e.g. `package.json`, shared config) must be sequential
- Populate `sdd.touchedFiles` on implementation tasks to enable conflict detection
- Prefer 4–8h tasks for parallel batches — large enough to be meaningful, small enough to finish in one session

## Decision Matrix Reference

See `.sdd/templates/decision-matrix.md` for choosing between Brief and Full SDD planning based on complexity, risk, and team size.
