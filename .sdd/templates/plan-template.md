# Technical Plan: {{FEATURE_NAME}}

## Overview
{{PLAN_OVERVIEW}}

## Architecture

### System Architecture
```
{{ARCHITECTURE_DIAGRAM}}
```

### Component Design
{{#each COMPONENTS}}
- **{{this.name}}**: {{this.description}}
  - **Responsibilities**: {{this.responsibilities}}
  - **Interfaces**: {{this.interfaces}}
{{/each}}

## Technology Stack

### Frontend
- **Framework**: {{FRONTEND_FRAMEWORK}}
- **Libraries**: {{FRONTEND_LIBRARIES}}
- **Styling**: {{STYLING_APPROACH}}

### Backend
- **Runtime**: {{BACKEND_RUNTIME}}
- **Framework**: {{BACKEND_FRAMEWORK}}
- **Database**: {{DATABASE_CHOICE}}
- **APIs**: {{API_DESIGN}}

### Infrastructure
- **Hosting**: {{HOSTING_PLATFORM}}
- **CI/CD**: {{CICD_PIPELINE}}
- **Monitoring**: {{MONITORING_TOOLS}}

## Data Models

### Database Schema
```sql
{{DATABASE_SCHEMA}}
```

### API Contracts
{{#each API_ENDPOINTS}}
#### {{this.method}} {{this.path}}
**Description**: {{this.description}}

**Request:**
```json
{{this.request}}
```

**Response:**
```json
{{this.response}}
```
{{/each}}

## Security Considerations
{{#each SECURITY_MEASURES}}
- **{{this.area}}**: {{this.measures}}
{{/each}}

## Performance Considerations
{{#each PERFORMANCE_REQUIREMENTS}}
- **{{this.metric}}**: {{this.target}} ({{this.rationale}})
{{/each}}

## Integration Points
{{#each INTEGRATIONS}}
- **{{this.system}}**: {{this.method}} - {{this.purpose}}
{{/each}}

## Migration Strategy
{{MIGRATION_APPROACH}}

## Rollback Plan
{{ROLLBACK_STRATEGY}}

## Testing Strategy

### Unit Testing
- {{UNIT_TEST_APPROACH}}

### Integration Testing
- {{INTEGRATION_TEST_APPROACH}}

### End-to-End Testing
- {{E2E_TEST_APPROACH}}

## Deployment Strategy
{{DEPLOYMENT_APPROACH}}

## Monitoring & Logging
{{#each MONITORING_REQUIREMENTS}}
- **{{this.type}}**: {{this.implementation}}
{{/each}}

## Risk Assessment
{{#each RISKS}}
- **{{this.risk}}**: 
  - **Impact**: {{this.impact}}
  - **Probability**: {{this.probability}}
  - **Mitigation**: {{this.mitigation}}
{{/each}}

## Review Checklist
- [ ] Architecture is scalable and maintainable
- [ ] Technology choices are justified
- [ ] Security requirements are addressed
- [ ] Performance targets are realistic
- [ ] Integration points are well-defined
- [ ] Testing strategy is comprehensive
- [ ] Deployment approach is feasible
- [ ] Rollback plan is documented
- [ ] Technical review completed

---
**Created:** {{CREATED_DATE}}  
**Last Updated:** {{UPDATED_DATE}}  
**Status:** {{STATUS}}  
**Assignee:** {{ASSIGNEE}}  
**Reviewer:** {{REVIEWER}}
