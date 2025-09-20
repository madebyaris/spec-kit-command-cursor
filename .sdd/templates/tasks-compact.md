# {{TASK_ID}} Tasks

## Phases
### 1. Setup
{{#each SETUP_TASKS}}
- [ ] {{this.task}} ({{this.effort}}) - {{this.owner}}
{{/each}}

### 2. Core
{{#each CORE_TASKS}}
- [ ] {{this.task}} ({{this.effort}}) - {{this.owner}}
  - Deps: {{this.deps}}
{{/each}}

### 3. Integration
{{#each INT_TASKS}}
- [ ] {{this.task}} ({{this.effort}}) - {{this.owner}}
{{/each}}

### 4. Deploy
{{#each DEPLOY_TASKS}}
- [ ] {{this.task}} ({{this.effort}}) - {{this.owner}}
{{/each}}

## Dependencies
```
{{#each TASK_DEPS}}
{{this.from}} → {{this.to}}
{{/each}}
```

## Definition of Done
**Per Task**: Code + Tests + Review + Docs
**Feature**: All AC met + E2E tests + Deploy + Sign-off

## Estimates
- **Total**: {{TOTAL_EFFORT}}
- **Critical Path**: {{CRITICAL_PATH}}
- **Target**: {{TARGET_DATE}}

---
PM: {{PM}} | Lead: {{LEAD}} | {{CREATED_DATE}}
