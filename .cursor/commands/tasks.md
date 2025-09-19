# /tasks Command

Break down technical plan into actionable development tasks.

## Usage
```
/tasks [feature-name]
```

## Prerequisites
- Must have existing `spec.md` and `plan.md` files
- Feature must exist in `specs/active/feat-XXX-[name]/`

## Purpose
Transform technical plans into discrete, manageable development tasks with clear dependencies and success criteria.

## Process
1. Read existing `spec.md` and `plan.md` files
2. Generate `tasks.md` using template with:
   - Discrete, manageable development tasks
   - Implementation phases and dependencies
   - Effort estimates and priorities
   - Definition of done criteria
   - Testing and deployment tasks
3. Create progress tracking template
4. Ensure tasks align with plan and specifications

## Example
```
/tasks photo-organizer
```

## Implementation Rules
- Break down into small, manageable tasks (max 1-2 days each)
- Define clear dependencies between tasks
- Include testing tasks for each feature
- Create deployment and rollback tasks
- Estimate effort realistically
- Assign priority levels

## Task Organization
- **Phase 1**: Foundation tasks
- **Phase 2**: Core feature implementation
- **Phase 3**: Integration & testing  
- **Phase 4**: Deployment & monitoring

## Output
Creates: `specs/active/feat-XXX-[name]/tasks.md`
