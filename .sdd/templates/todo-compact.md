# {{TASK_ID}} Todo

## Pre-flight
- [ ] Review research + spec + plan
- [ ] Create branch `{{TASK_ID}}`
- [ ] Setup dev env

## Implementation
{{#each TODOS}}
- [ ] **{{this.id}}**: {{this.desc}}
  - Time: {{this.estimate}} | Deps: {{this.deps}}
  - Pattern: {{this.pattern}} | Files: {{this.files}}
{{/each}}

## Pattern Reuse
{{#each REUSE}}
- **{{this.component}}** → {{this.usage}}
{{/each}}

## Execution Rules
1. Execute in dependency order
2. Maximum flow - batch questions at end
3. Reuse patterns where possible
4. Update progress continuously

## Progress
### Done
- [ ] Track completed items here

### Blockers
- [ ] Document blockers + resolutions

### Questions (Batch at end)
- [ ] List ambiguous items here

## DoD
All todos complete + tests pass + review + deploy

---
Start: {{START_DATE}} | Target: {{TARGET_DATE}} | {{TOTAL_ESTIMATE}}
