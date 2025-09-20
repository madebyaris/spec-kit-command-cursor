# Implementation Todo List: {{TASK_ID}}

## Overview
{{TODO_OVERVIEW}}

## Pre-Implementation Setup
- [ ] Review research findings
- [ ] Confirm specification requirements
- [ ] Validate technical plan
- [ ] Set up development environment
- [ ] Create feature branch: `{{TASK_ID}}`

## Todo Items

### Phase 1: Foundation
{{#each PHASE_1_TODOS}}
- [ ] **{{this.id}}**: {{this.description}}
  - **Estimated Time**: {{this.estimate}}
  - **Dependencies**: {{this.dependencies}}
  - **Existing Pattern**: {{this.pattern}}
  - **Files to Modify**: {{this.files}}
{{/each}}

### Phase 2: Core Implementation
{{#each PHASE_2_TODOS}}
- [ ] **{{this.id}}**: {{this.description}}
  - **Estimated Time**: {{this.estimate}}
  - **Dependencies**: {{this.dependencies}}
  - **Existing Pattern**: {{this.pattern}}
  - **Files to Create**: {{this.newFiles}}
  - **Files to Modify**: {{this.modifyFiles}}
{{/each}}

### Phase 3: Integration
{{#each PHASE_3_TODOS}}
- [ ] **{{this.id}}**: {{this.description}}
  - **Estimated Time**: {{this.estimate}}
  - **Dependencies**: {{this.dependencies}}
  - **Integration Points**: {{this.integrations}}
{{/each}}

### Phase 4: Testing
{{#each PHASE_4_TODOS}}
- [ ] **{{this.id}}**: {{this.description}}
  - **Test Type**: {{this.testType}}
  - **Coverage Target**: {{this.coverage}}
  - **Test Files**: {{this.testFiles}}
{{/each}}

### Phase 5: Documentation & Cleanup
{{#each PHASE_5_TODOS}}
- [ ] **{{this.id}}**: {{this.description}}
  - **Documentation Type**: {{this.docType}}
  - **Target Audience**: {{this.audience}}
{{/each}}

## Pattern Reuse Strategy

### Components to Reuse
{{#each REUSE_COMPONENTS}}
- **{{this.component}}** ({{this.location}})
  - **Modifications needed**: {{this.modifications}}
  - **Usage**: {{this.usage}}
{{/each}}

### Code Patterns to Follow
{{#each CODE_PATTERNS}}
- **{{this.pattern}}**: {{this.description}}
  - **Example Location**: {{this.location}}
  - **Implementation**: {{this.implementation}}
{{/each}}

## Execution Strategy

### Continuous Implementation Rules
1. **Execute todo items in dependency order**
2. **Go for maximum flow - complete as much as possible without interruption**  
3. **Group all ambiguous questions for batch resolution at the end**
4. **Reuse existing patterns and components wherever possible**
5. **Update progress continuously**
6. **Document any deviations from plan**

### Checkpoint Schedule
{{#each CHECKPOINTS}}
- **{{this.milestone}}**: {{this.description}}
  - **Expected Completion**: {{this.date}}
  - **Deliverables**: {{this.deliverables}}
  - **Review Criteria**: {{this.criteria}}
{{/each}}

## Questions for Batch Resolution
{{#each QUESTIONS}}
- **{{this.category}}**: {{this.question}}
  - **Context**: {{this.context}}
  - **Impact if unresolved**: {{this.impact}}
{{/each}}

## Progress Tracking

### Completed Items
- [ ] Update this section as items are completed
- [ ] Note any deviations or discoveries
- [ ] Record actual time vs estimates

### Blockers & Issues
- [ ] Document any blockers encountered
- [ ] Include resolution steps taken
- [ ] Note impact on timeline

### Discoveries & Deviations
- [ ] Document any plan changes needed
- [ ] Record new patterns or approaches discovered
- [ ] Note improvements to existing code

## Definition of Done
- [ ] All todo items completed
- [ ] Tests passing with required coverage
- [ ] Code review completed and approved
- [ ] Documentation updated
- [ ] Integration testing successful
- [ ] Performance requirements met
- [ ] Security considerations addressed
- [ ] Deployment successful to staging
- [ ] Stakeholder acceptance received

---
**Created:** {{CREATED_DATE}}  
**Estimated Duration:** {{TOTAL_ESTIMATE}}  
**Implementation Start:** {{START_DATE}}  
**Target Completion:** {{TARGET_DATE}}
