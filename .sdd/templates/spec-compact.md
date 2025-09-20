# {{TASK_ID}} Spec

## What & Why
- **Problem**: {{PROBLEM}}
- **Users**: {{USERS}} 
- **Value**: {{VALUE}}

## Requirements
### Must Have
{{#each MUST_HAVE}}
- {{this.req}} → {{this.criteria}}
{{/each}}

### Should Have  
{{#each SHOULD_HAVE}}
- {{this}}
{{/each}}

## User Stories
{{#each STORIES}}
**{{this.role}}** {{this.action}} → {{this.outcome}}
- AC: {{this.acceptance}}
- Priority: {{this.priority}} | Effort: {{this.effort}}
{{/each}}

## Success Metrics
{{SUCCESS_METRICS}}

## Dependencies
{{#each DEPS}}
- {{this}}
{{/each}}

## Out of Scope
{{#each OOS}}
- {{this}}
{{/each}}

---
Status: {{STATUS}} | Owner: {{OWNER}} | {{CREATED_DATE}}
