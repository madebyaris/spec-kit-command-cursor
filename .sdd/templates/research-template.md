# Research Report: {{TASK_ID}}

## Overview
{{RESEARCH_OVERVIEW}}

## Research Objective
{{RESEARCH_OBJECTIVE}}

## Codebase Analysis

### Existing Patterns Found
{{#each EXISTING_PATTERNS}}
#### {{this.name}}
**Location**: {{this.location}}
**Description**: {{this.description}}
**Code Example**:
```{{this.language}}
{{this.code}}
```
**Pros**: {{this.pros}}
**Cons**: {{this.cons}}
{{/each}}

### Similar Implementations
{{#each SIMILAR_IMPLEMENTATIONS}}
- **{{this.name}}**: {{this.description}} ({{this.location}})
{{/each}}

## External Research

### Libraries & Frameworks
{{#each EXTERNAL_LIBRARIES}}
- **{{this.name}}**: {{this.description}}
  - **Use Case**: {{this.useCase}}
  - **Pros**: {{this.pros}}
  - **Cons**: {{this.cons}}
  - **Compatibility**: {{this.compatibility}}
{{/each}}

### Best Practices
{{#each BEST_PRACTICES}}
- **{{this.practice}}**: {{this.description}}
  - **Source**: {{this.source}}
  - **Applicability**: {{this.applicability}}
{{/each}}

### Industry Standards
{{#each STANDARDS}}
- **{{this.standard}}**: {{this.description}}
{{/each}}

## Technical Constraints

### Project Constraints
{{#each PROJECT_CONSTRAINTS}}
- **{{this.type}}**: {{this.description}}
{{/each}}

### Technology Stack Considerations
{{#each TECH_CONSIDERATIONS}}
- **{{this.technology}}**: {{this.consideration}}
{{/each}}

## Opportunities Identified

### Reusable Components
{{#each REUSABLE_COMPONENTS}}
- **{{this.component}}**: {{this.description}}
  - **Location**: {{this.location}}
  - **Modification Needed**: {{this.modifications}}
{{/each}}

### Integration Points
{{#each INTEGRATION_POINTS}}
- **{{this.system}}**: {{this.description}}
  - **API**: {{this.api}}
  - **Data Format**: {{this.dataFormat}}
{{/each}}

## Recommendations

### Preferred Approach
{{PREFERRED_APPROACH}}

### Alternative Approaches
{{#each ALTERNATIVES}}
#### {{this.name}}
**Description**: {{this.description}}
**Pros**: {{this.pros}}
**Cons**: {{this.cons}}
**Effort**: {{this.effort}}
{{/each}}

### Implementation Strategy
{{IMPLEMENTATION_STRATEGY}}

## Risks & Mitigation
{{#each RISKS}}
- **{{this.risk}}**: {{this.description}}
  - **Impact**: {{this.impact}}
  - **Probability**: {{this.probability}}
  - **Mitigation**: {{this.mitigation}}
{{/each}}

## Follow-up Questions
{{#each QUESTIONS}}
- {{this.question}}
{{/each}}

## Research Sources
{{#each SOURCES}}
- [{{this.title}}]({{this.url}}) - {{this.description}}
{{/each}}

---
**Created:** {{CREATED_DATE}}  
**Researcher:** {{RESEARCHER}}  
**Research Duration:** {{RESEARCH_DURATION}}  
**Next Phase:** Specification (`/specify {{TASK_ID}}`)
