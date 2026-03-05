# {{TASK_ID}} Plan

## Overview
{{OVERVIEW}}

## Tech Stack
- **Frontend**: {{FE_STACK}}
- **Backend**: {{BE_STACK}}
- **DB**: {{DATABASE}}
- **Deploy**: {{DEPLOYMENT}}

## Architecture
```
{{ARCH_DIAGRAM}}
```

## Components
{{#each COMPONENTS}}
- **{{this.name}}**: {{this.desc}} | {{this.tech}}
{{/each}}

## APIs
{{#each APIS}}
### {{this.method}} {{this.endpoint}}
Req: `{{this.request}}`
Res: `{{this.response}}`
{{/each}}

## Data Models
```json
{{DATA_MODELS}}
```

## Security
{{#each SECURITY}}
- {{this.area}}: {{this.approach}}
{{/each}}

## Performance Targets
{{#each PERF}}
- {{this.metric}}: {{this.target}}
{{/each}}

## Risks
{{#each RISKS}}
- **{{this.risk}}** ({{this.impact}}) → {{this.mitigation}}
{{/each}}

## Testing
- Unit: {{UNIT_TESTS}}
- Integration: {{INT_TESTS}}
- E2E: {{E2E_TESTS}}

{{!-- Optional for heavy apps: monorepo, microservices, multi-team --}}
{{#if HEAVY_APP}}
## Monorepo / Multi-Package
- **Packages**: {{MONOREPO_PACKAGES}}
- **Boundaries**: {{MONOREPO_BOUNDARIES}}
- **Shared libs**: {{MONOREPO_SHARED}}

## Team / Ownership
{{TEAM_OWNERSHIP}}

## Integration Contracts
{{INTEGRATION_CONTRACTS}}

## Deployment Topology
- **Services**: {{DEPLOYMENT_SERVICES}}
- **Environments**: {{DEPLOYMENT_ENVS}}
{{/if}}

---
Status: {{STATUS}} | Lead: {{TECH_LEAD}} | {{CREATED_DATE}}
