# {{TASK_ID}} Research

## Objective
{{RESEARCH_GOAL}}

## Existing Patterns
{{#each PATTERNS}}
- **{{this.name}}** ({{this.location}})
  - Use: {{this.usage}}
  - Pros: {{this.pros}} | Cons: {{this.cons}}
{{/each}}

## External Solutions
{{#each EXTERNAL}}
- **{{this.name}}**: {{this.desc}}
  - Fit: {{this.fit}}/5 | Effort: {{this.effort}}
{{/each}}

## Tech Options
{{#each TECH_OPTIONS}}
- **{{this.tech}}**: {{this.usecase}}
  - Pros: {{this.pros}}
  - Cons: {{this.cons}}
  - Verdict: {{this.verdict}}
{{/each}}

## Recommendations
1. **Preferred**: {{PREFERRED_APPROACH}}
2. **Alternative**: {{ALTERNATIVE}}
3. **Avoid**: {{AVOID}}

## Next Steps
{{NEXT_STEPS}}

---
Researcher: {{RESEARCHER}} | Duration: {{DURATION}} | {{CREATED_DATE}}
